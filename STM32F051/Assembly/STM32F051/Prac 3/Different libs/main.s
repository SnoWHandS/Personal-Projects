@ STDNUM001 STDNUM002

    .syntax unified
    .global _start
	.cpu cortex-m0
	.thumb
vectors:
    .word 0x20002000                @ 0x00: defines the reset value of the stack pointer
    .word _start + 1                @ 0x04: defines the reset vector, thereby specifying the first instruction.
    @ define the rest of the vectors here
    .word Default_Handler + 1       @ 0x08: NMI vector
    .word HardFault_Handler + 1     @ 0x0C: HardFault vector
    .word Default_Handler + 1       @ 0x10: reserved
    .word Default_Handler + 1       @ 0x14: reserved
    .word Default_Handler + 1       @ 0x18: reserved
    .word Default_Handler + 1       @ 0x1C: reserved
    .word Default_Handler + 1       @ 0x20: reserved
    .word Default_Handler + 1       @ 0x24: reserved
    .word Default_Handler + 1       @ 0x28: reserved
    .word Default_Handler + 1       @ 0x2C: SVCall
    .word Default_Handler + 1       @ 0x30: reserved
    .word Default_Handler + 1       @ 0x34: reserved
    .word Default_Handler + 1       @ 0x38: PendSV
    .word Default_Handler + 1       @ 0x3C: SysTick
    .word Default_Handler + 1       @ 0x40: WWDG
    .word Default_Handler + 1       @ 0x44: PVD_VDDIO2 
    .word Default_Handler + 1       @ 0x48: RTC
    .word Default_Handler + 1       @ 0x4C: FLASH
    .word Default_Handler + 1       @ 0x50: RCC_CRS
    .word Default_Handler + 1       @ 0x54: EXTI0_1
    .word Default_Handler + 1       @ 0x58: EXTI2_3
    .word Default_Handler + 1       @ 0x5C: EXTI4_15
    .word Default_Handler + 1       @ 0x60: TSC vector
    .word Default_Handler + 1       @ 0x64: DMA_CH1
    .word Default_Handler + 1       @ 0x68: DMA_CH2_3
    .word Default_Handler + 1       @ 0x6C: DMA_CH[4:7]
    .word Default_Handler + 1       @ 0x70: ADC_COMP v
    .word Default_Handler + 1       @ 0x74: TIM1_BRK_UP_TRG_COM
    .word Default_Handler + 1       @ 0x78: TIM1_CC
    .word Default_Handler + 1       @ 0x7C: TIM2
    .word Default_Handler + 1       @ 0x80: TIM3
    .word TIM6_Handler + 1          @ 0x84: TIM6_DAC
    .word Default_Handler + 1       @ 0x88: TIM7 
    .word Default_Handler + 1       @ 0x8C: TIM14
    .word Default_Handler + 1       @ 0x90: TIM15
    .word Default_Handler + 1       @ 0x94: TIM16
    .word Default_Handler + 1       @ 0x98: TIM17
    .word Default_Handler + 1       @ 0x9C: I2C1
    .word Default_Handler + 1       @ 0xA0: I2C2
    .word Default_Handler + 1       @ 0xA4: SPI1
    .word Default_Handler + 1       @ 0xA8: SPI2
    .word Default_Handler + 1       @ 0xAC: USART1
    .word Default_Handler + 1       @ 0xB0: USART2
    .word Default_Handler + 1       @ 0xB4: USART3_4
    .word Default_Handler + 1       @ 0xB8: CEC_CAN
    .word Default_Handler + 1       @ 0xBC: USB
    @ If an exception happens which we don't expect to happen, hang in an infinite loop
Default_Handler:
    NOP
    B Default_Handler

HardFault_Handler:
    NOP
    B HardFault_Handler

TIM6_Handler:
    @ Acknowledge interrupt
    PUSH {LR}
	BL lib_tim6_ack
	
	MOVS R7, R4
	BL lib_write_leds
	SUBS R4, #1
	
exit_interrupt:
    @ return from interrupt
    POP {PC}
	
	@ libs.s functions
	@ lib_init_leds					@ 1) none														
	@ lib_write_leds				@ R7 = output data (8bit)                                       
	@ lib_read_leds					@ R7 = read data
	@ lib_init_push_buttons			@ 2) none                                                       
	@ lib_read_push_buttons			@ R7 = input data                                               
	@ lib_init_adc_12_bit			@ 5) none                                                       
	@ lib_init_adc_10_bit			@ 5) none                                                       
	@ lib_init_adc_8_bit			@ 5) none                                                       
	@ lib_init_pots					@ 3) none BL lib_init_push_buttons required                     
	@ lib_read_pot_0				@ R7 = input data (depends)                                     
	@ lib_read_pot_1				@ R7 = input data (depends)                                     
	@ lib_init_tim6					@ 7) none 	@ R5 = PSC	@ R6 = ARR                              
	@ lib_tim6_ack					@ none
	@ lib_update_arr				@ R7 = ARR update data
	@ lib_init_lcd_0				@ 4) none BL lib_init_leds & lib_init_push_buttons required     
	@ lib_init_lcd_1				@ 6) none BL lib_init_lcd_0 required                            
	@ lib_write_lcd_0				@ R7 = 4-bit infc com data                                      
	@ lib_write_lcd_1				@ R7 = 4-bit infc com data  
	
_start:
    
	@Init I/O
	BL lib_init_leds
	BL lib_init_push_buttons
	BL lib_init_pots
	BL lib_init_adc_8_bit

	@Init Timer
	MOVS R5, TIM6_PSC_VAL
	MOVS R6, TIM6_ARR_VAL
	BL lib_init_tim6
	
	@LED count
	MOVS R4, #0xFF
	
	@Stack loading registers
	MOVS R0, #0
	LDR R1, DATA_BEGIN_ADDR
	LDR R2, DATA_END_ADDR
	
to_stack_loop:
	LDRB R3, [R1]
	PUSH {R3}
	ADDS R0, #1		@ increment loop index
	ADDS R1, #1		@ increment source pointer address in flash
	CMP R1, R2 		@ compare current pointer address and end address
	BNE to_stack_loop	@ if not last, loop back
    @ from the DATA block, read each BYTE and push it to the stack

@ CRITICAL! When the program hits this label, the automarker will stop execution,
@ verify the contents of the stack and then modify the contents of the stack.
stack_push_done:
@ find pair A and B
	MOVS R1, #0 	 	@ counter for number of processed
	MOVS R3, #0xff		@ initialise smallest number found
	MOVS R4, #0x00		@ initialise largest number found
	POP {R6}		@ R6 will hold elements coming off the stack

find_min_max:
	CMP R6, R3 		@ compare working element with smallest so far
	BHI not_smaller  	@ if bigger dont update smallest
	MOVS R3, R6		@ update new smallest
not_smaller:
	CMP R6, R4 		@ compare working element with largest so far
	BLO not_larger		@ dont update largest
	MOVS R4, R6		@ update new largest
not_larger:
	ADDS R1, #1 		@ check if we've got all elements
	CMP R0, R1
	BEQ found_min_max
	POP {R6}		@ get next element
	B find_min_max

found_min_max:
	SUBS R7, R4, R3
	ADDS R6, R4, R3

	
main_loop:
    @ default flash between displaying A and B.
	@ If SW0 is held, display A-B constantly on the LEDs.  
	@ If SW1 is held, display A+B constantly on the LEDs. 
    @ If SW2 is held, vary numerical representation of voltage proportianal to POT1. 
	@ if SW3 is held, bonus. 

    B main_loop

    .align
@ you can define more literals here.
TIM6_PSC_VAL:   	.word 1999
TIM6_ARR_VAL:   	.word 1499
DATA_BEGIN_ADDR:	.word DATA
DATA_END_ADDR:		.word DATA_END

@ don't modify the following. 
DATA:  
    .word 0x45ac6a90
	.word 0x484721b4
	.word 0x5607039f
	.word 0x0e0253c4
	.word 0x0e1bc715
	.word 0xbe2f74b2
	.word 0x9f781e7f
	.word 0xc198339b
DATA_END: 

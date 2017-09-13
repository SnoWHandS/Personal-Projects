@ STDNUM001
@ Intro to micros practical exam 0 ; 2017-01-11

    .syntax unified
    .global _start

vectors:
    .word 0x20002000                @ 0x00: defines the reset value of the stack pointer
    .word _start + 1                @ 0x04: defines the reset vector, thereby specifying the first instruction.
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

HardFault_Handler:
    NOP
    B HardFault_Handler

Default_Handler:
    NOP
    B Default_Handler

TIM6_Handler:
    PUSH {R7, LR}  @ saving the LR to the stack allows us to call subroutines from the ISR
    @ Ack the IRQ. 
    BL lib_tim6_ack
	
	MOVS R7, R5
	BL lib_write_leds
	
	ADDS R5, #1
    
    POP {R7, PC}  @ take that return code from stack into PC, thereby telling the CPU we want to exit from the ISR

	
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
    @ Initliase LEDs
	BL lib_init_leds
	BL lib_init_push_buttons
	BL lib_init_adc_8_bit
	BL lib_init_pots
	LDR R5, PSC
	LDR R6, ARR
	BL lib_init_tim6
    @ perform copy to RAM 0x20001000

	MOVS R5, #0
    @ CRITICAL! Here, the automarker will verify block in RAM.
copy_to_RAM_complete:

    @ Find sum of signed numbers in RAM
    
    @ Display SUM  on the LEDs

    @ CRITICAL! Automarker will verify value displayed on LEDs here
display_sum_done:

    @ Initialise TIM6, NVIC, push buttons, ADC

main_loop:
    
	@ Read button press
	MOVS R6, #0b100
	BL lib_read_push_buttons
	ANDS R6, R6, R7
	BEQ sw2_pressed
	B sw2_not_pressed
		@if button is pressed, sample ADC
		sw2_pressed:
		@PUSH {R7}
		BL lib_read_pot_1
		@change ADC val to ARR val (1999 - 3999)
		LDR R6, FORMULA_GRAD
		MULS R7, R7, R6
		LDR R6, FORMULA_INTERSECT
		ADDS R7, R7, R6		
		@update ARR with adc sample
		BL lib_update_arr
		@POP {R7}
	sw2_not_pressed:
    B main_loop

    .align
PSC:	.word 1999
ARR:	.word 1999
FORMULA_INTERSECT:	.word 2200
FORMULA_GRAD:		.word 7

DATA:
    .word 0x2436f1cd 
    .word 0x215a9596 
    .word 0x7118bd2b 
    .word 0x1708d29b 
DATA_END:  @ this will point to the address immediately after the block. 

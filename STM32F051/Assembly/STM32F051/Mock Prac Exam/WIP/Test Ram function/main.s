@ STDNUM001
@ Intro to micros practical exam 0 ; 2016-09-13

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
    PUSH {LR}  @ saving the LR to the stack allows us to call subroutines from the ISR
    @ Ack the IRQ. 
    BL lib_tim6_ack
    @ Default action fetch current value on LEDs
	@ Increment it.
	@ Read first value in RAM
	
	
	ADDS R4, #1
	
	MOVS R7, R4
	
	BL lib_write_leds
	@ Alternative action fetch the current value of the pointer on the patterns block
    @ Incrment it. Wrap if required  
    @ Another alternative action, change the rate at which TIM6_Handler is being invoked     
   
    POP {PC}  @ take that return code from stack into PC, thereby telling the CPU we want to exit from the ISR

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
	@ lib_disp_clear				@ none
	
_start:
    @ Initliase LEDs
	BL lib_init_leds
	BL lib_init_push_buttons
	BL lib_init_adc_8_bit
    BL lib_init_pots
	
	@ read each sign extended byte from DATA, store it to a relative location at the start of RAM.
	LDR R7, DATA_BEGIN_ADDR
	LDR R6, DATA_END_ADDR
	BL lib_write_bytes_to_RAM
	
	@ R7 contains address of last item
	LDR R0, RAM_START
	LDRSB R4, [R0, R2]
	@ CRITICAL! Here, the automarker will verify block in RAM.
copy_to_RAM_complete:
	LDR R4, [R0]
	LDRB R5, [R0, R1]
	ADDS R1, #1
	CMP R1, R6
	BNE copy_to_RAM_complete
    @ Comparing against SPECIAL_VALUE find x and y such that
    @ x is the number of values smaller than SPECIAL_VALUE
    @ y is the number of values equal to or larger than SPECIAL_VALUE
    @ RESULT = x * y
    @ Display RESULT on the LEDs

    @ CRITICAL! Automarker will verify value displayed on LEDs here
display_result_done:

    @ Initialise TIM6, NVIC, push buttons, ADC
	LDR R5, PSC
	LDR R6, ARR
	BL lib_init_tim6
main_loop:
    
    @ If SW1 held:
    @ - backup value on LEDs
    @ - If SW1 held:
    @ -- sample POT1 and display. 
    @ -- Loop to 2nd SW1 test
    @ - Else: 
    
	@ -- restore LEDs
	NOP
    B main_loop

    .align
PSC:	.word 1999
ARR:	.word 3199
DATA_BEGIN_ADDR:	.word DATA 
DATA_END_ADDR:		.word DATA_END
RAM_START:			.word 0x2000000
@ The automarker will modify ALL! of the following values at compile time
@ Number of values in the PATTERNS block will remain the same
@ Number of values in the DATA block will change!
@ SPECIAL_VALUE will change!

PATTERNS:
    .word 0xBBAA5500
    .word 0xFFEEDDCC
    
SPECIAL_VALUE:
	.word 0xffffff9f

DATA:
    .word 0x2436f1cd
    .word 0x215a9596
    .word 0x8118bd2b 
    .word 0x1708d29b 
    .word 0X65b77a3e
	.word 0xa96e21e1 
	.word 0xcd0fcdbe 
	.word 0x565165d9 
	.word 0xa30e7dec
	.word 0x17142d9c 
	.word 0x2e72e0b1
	.word 0x2c055dc8 
	.word 0x4156ea0c  
DATA_END:  @ this will point to the address immediately after the block. 

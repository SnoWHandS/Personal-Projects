@ STDNUM001 STDNUM002

    .syntax unified
    .global _start

    @ The suggestion is to define specific blocks for the HardFault exception and
    @ the exception associated with the timer we're using, leaving the rest of the
    @ vectors pointing to a Default_Handler.
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
    @ By default the interrupt handler should decrement 
	@ the value displayed on the LEDs by 1. Start counting from FF.
	BL lib_tim6_ack
	
	
	read_ram:
	LDRB R2, [R5, R4]		@Load R2 with byte in RAM
	ADDS R5, #4
	CMP R5, R7				@ Counter of data in memory
	BNE no_restart
	LDR R5, START_OF_RAM

no_restart:
	@Now R2 contains the content of a particular address in RAM
	ADDS R4, #8
	@R3 contains what needs to be displayed on LEDs
	MOVS R7, R2
	BL lib_write_leds
	CMP R4, #32		
	BNE no_reset_count
	MOVS R4, #0
no_reset_count:
	@ If SW0 held:
    @ No logic here should affect the LEDs
	
	
    @ If SW1 held:
    @ Save the value on the leds
	@ Cycle throught the pattens
	
    @ If SW2 held:
    @ Vary the delay depending on value from POT1

    @ return from interrupt
	POP {PC}
@ ------- END OF INTERRUPT SERVICE ROUTINE --------

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
	@ lib_write_bytes_to_RAM			@ R7 = begin data block & R6 = end data block
	
_start:
    @ enable GPIOA, GPIOB, TIM6
    BL lib_init_leds
	BL lib_init_push_buttons
	BL lib_init_pots
	
	@ Load patterns to ram
	LDR R7, PATTERNS_BEGIN
	LDR R6, PATTERNS_EOF
	BL lib_write_bytes_to_RAM 
	
	LDR R5, PSC
	LDR R6, ARR
	BL lib_init_tim6
    @ Enable TIM6 IRQ in NVIC

    @ Other initialisations 
    LDR R5, START_OF_RAM	@RAM base address
	MOVS R4, #0
    
main_loop:
    NOP
	    
	B main_loop
    
    .align
@ Define your literals here
PSC:	.word 1999
ARR:	.word 1999	@Half a second
START_OF_RAM:	.word 0x20000000
PATTERNS_BEGIN:	.word PATTERNS
PATTERNS_EOF:	.word PATTERNS_END
DATA_BEGIN_ADDR:	.word DATA 
DATA_END_ADDR:		.word DATA_END
@ This is the sequence of patterns (each byte is a pattern) which the LEDs must cycle through. 
@ The values of the following words will be modified at compile time by the marker, but the number 
@ of values will not change. Hence, you can hard-code your bounds checking condition if you wish.
PATTERNS:
    .word 0x66B9543C
    .word 0xCA71D738
PATTERNS_END:
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
DATA_END:

@ STDNUM001 STDNUM002

    .syntax unified
    .global _start
	.cpu cortex-m0
	.thumb
@ STDNUM001 STDNUM002

    .syntax unified
    .global _start

    @ The suggestion is to define specific blocks for the HardFault exception and
    @ the exception associated with the timer we're using, leaving the rest of the
    @ vectors pointing to a Default_Handler.
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
    BL _TIM6_ack
    
	MOVS R7, R4
    BL _write_to_LEDs
	SUBS R4, #1
	
exit_interrupt:
    @ return from interrupt
    POP {PC}
	
_start:
    
    @ do initialisations here
	BL _init_clks
	BL _init_gpio
	
	@TIM6
	BL _init_TIM6_enable
	LDR R7, TIM6_PSC_VAL
	BL _TIM6_PSC
	LDR R7, TIM6_ARR_VAL
	BL _TIM6_ARR
	@ Enable TIM6 IRQ in NVIC
	BL _TIM6_NVIC_init
	BL _init_adc
	
	MOVS R4, #0xFF

to_stack_loop:

    @ from the DATA block, read each BYTE and push it to the stack

@ CRITICAL! When the program hits this label, the automarker will stop execution,
@ verify the contents of the stack and then modify the contents of the stack.
stack_push_done:

    @ find pair A and B 
	
    
main_loop:
    @ default flash between displaying A and B.
	@ If SW0 is held, display A-B constantly on the LEDs.  
	@ If SW1 is held, display A+B constantly on the LEDs. 
    @ If SW2 is held, vary numerical representation of voltage proportianal to POT1. 
	@ if SW3 is held, bonus. 
	NOP

    B main_loop

    .align
@ you can define more literals here.
TIM6_PSC_VAL:   .word 1999
TIM6_ARR_VAL:   .word 1199


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

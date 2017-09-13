@ STDNUM001 STDNUM002

    .syntax unified
    .global _start
	.cpu cortex-m0
	.thumb
vectors:
    .word 0x20002000
    .word _start + 1
_start:
    @ enable clock for GPIOA, GPIOB, ADC
	LDR R0, RCC_BASE
	LDR R1, [R0, #0x14]			@ RCC_AHBENR
	LDR R2, AHBENR_IOPABEN
	ORRS R1, R1, R2
	STR R1, [R0, #0x14]
	
	LDR R1, [R0, #0x18]			@ RCC_APB2ENR
	LDR R2, APB2ENR_ADCEN
	ORRS R1, R1, R2
	STR R1, [R0, #0x18]
	
	@ set LEDs to outputs in mode register
	LDR R0, GPIOB_BASE
	LDR R1, LEDS_OUTPUTS
	STR R1, [R0, #0]
	
	@ set pullup for PA[0:3] for push buttons
	LDR R0, GPIOA_BASE  		
	LDR R1, [R0, #0x0C]			@GPIOA_PUPDR
	MOVS R2, #0b01010101
	ORRS R1, R1, R2
	STR R1, [R0, #0x0C]
	
	@ set PA5 to analogue
	LDR R1, [R0, #0]			@GPIOA_MODER
	LDR R2, MODER_5_ANALOGUE
	ORRS R1, R1, R2
	STR R1, [R0, #0]
	
	@ ADC resolution to 8-bit
	LDR R0, ADC_BASE
	LDR R1, [R0, #0x0C]
	MOVS R2, #0b10000
	ORRS R1, R1, R2
	STR R1, [R0, #0x0C]
	
	@ enable ADC
	MOVS R1, #1 				@ ADEN = bit0
	STR R1, [R0, #0x08]			@ ADC_CR
adrdy_loop:
	LDR R1, [R0, #0]			@ ADC_ISR
	MOVS R2, #1
	ANDS R1, R1, R2
	BNE adrdy_loop
	MOVS R1, #0b100000
	STR R1, [R0, 0x28]

	MOVS R0, #0 		@ loop index and element tracker
	LDR R1, DATA_BEGIN_ADDR
	LDR R2, DATA_END_ADDR
to_stack_loop:
	LDRB R3, [R1]
	PUSH {R3}
	ADDS R0, #1		@ increment loop index
	ADDS R1, #1		@ increment source pointer address in flash
	CMP R1, R2 		@ compare current pointer address and end address
	BNE to_stack_loop	@ if not last, loop back

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
	
	LDR R0, GPIOA_BASE
	@ If SW0 is held, display A-B constantly on the LEDs.  
	@ Display A - B
	LDR R1, [R0, #0x10]
	MOVS R2, #0b1
	ANDS R1, R1, R2
	BEQ switch_0
	
	@ If SW1 is held, display A+B constantly on the LEDs. 
   	@ Display A + B
	LDR R1, [R0, #0x10]
	MOVS R2, #0b10
	ANDS R1, R1, R2
	BEQ switch_1
	
	@ If SW2 is held, vary delay between A and B proportianal to POT0. 
	@check for POT0
	LDR R1, [R0, #0x10]
	MOVS R2, #0b100
	ANDS R1, R1, R2
	BEQ display_adc
	LDR R0, DELAY

	@ flash between displaying A and B.
delay_loop:
	SUBS R0, #1
	BNE delay_loop
	LDR R0, GPIOB_BASE
	LDR R1, [R0, #0x14]
	CMP R1, R3
	BNE display_smaller
	STR R4, [R0, #0x14]
	B main_loop
display_smaller:
	STR R3, [R0, #0x14]
	B main_loop

display_adc:
LDR R0, ADC_BASE
	MOVS R1, #0b100   @ ADSTART
	STR R1, [R0, #0x08]  @ ADC_CR
eoc_loop:
	LDR R1, [R0, #0]
	MOVS R2, #0b100
	ANDS R1, R1, R2
	BEQ eoc_loop
	LDR R1, [R0, #0x40]  @ ADC_DR
	LDR R0, GPIOB_BASE
	STR R1, [R0, #0x14]  @ GPIOB_ODR
	B main_loop

	
	    
switch_0:
	LDR R0, GPIOB_BASE
	STR R7, [R0, #0x14]
	B main_loop
	
switch_1:
	LDR R0, GPIOB_BASE
	STR R6, [R0, #0x14]
	B main_loop
	

    .align
RCC_BASE: 			.word 0x40021000
AHBENR_IOPABEN: 	.word 0b11 << 17	@>
APB2ENR_ADCEN: 		.word 0b1 << 9		@>
GPIOB_BASE: 		.word 0x48000400
LEDS_OUTPUTS: 		.word 0x5555
GPIOA_BASE: 		.word  0x48000000
MODER_5_ANALOGUE: 	.word 0b1111 << 10	@>
ADC_BASE: 			.word 0x40012400
DELAY:			 	.word 1200000

DATA_BEGIN_ADDR:  	.word DATA_BEGIN
DATA_END_ADDR: 		.word DATA_END

	@ don't modify the following. 
DATA_BEGIN:  
        .word 0x45ac6a90
	.word 0x484721b4
	.word 0x5607039f
	.word 0x0e0253c4
	.word 0x0e1bc715
	.word 0xbe2f74b2
	.word 0x9f781e7f
	.word 0xc198339b
DATA_END: 

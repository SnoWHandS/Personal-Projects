@STDNUM001 STDNUM002
	.syntax unified
	.cpu cortex-m0
	.thumb
	.global _start

vectors:
	.word 0x20002000
	.word _start + 1

_start:
	@ Initialisations block
	LDR R6, RCC_BASE		@Configure GPIO A and B Clock
	LDR R0, AHBENR_GPIOB
	STR R0, [R6, #0x14]		
	
	LDR R6, GPIOB_BASE		@Set first 8 GPIOs to Outputs
	LDR R0, MODER_OUTPUT
	STR R0, [R6, #0]
	
	LDR R5, GPIOA_BASE		@Set first 4 GPIOs to Inputs
	LDR R0, MODERA_INPUT
	STR R0, [R5, #0]
	
	LDR R5, GPIOA_BASE		@Configure first 4 GPIOA pins as Pulled Up (this line can be removed)
	LDR R0, GPIOA_PULLUP
	STR R0, [R5, #0x0C]
	
	MOVS R1, #0x00			@Initialise R1 to 0
	
		
main_loop:
	@ Main block
	
	MOVS R2, R1				@Write value to LEDs
	STR R2, [R6, #0x14]
	
	@Delay function
	LDR R0, LOOP_LENGTH		@Load the delay time in R0
	B delay
	
	
	ADD R1, R2, #1			@Add 1 to previous value and store it in R1
	
	B main_loop

delay:
	SUBS R0, #1
	CMP R0, #0
	BNE delay 

   
    .align
RCC_BASE: 		.word 0x40021000
AHBENR_GPIOB: 	.word 0b1100000000000000000
GPIOB_BASE: 	.word 0x48000400
GPIOA_BASE:		.word 0x48000000
MODER_OUTPUT: 	.word 0X5555
MODERA_INPUT: 	.word 0x28000000
GPIOA_PULLUP:	.word 0x55
LOOP_LENGTH:	.word #1600000					@A 1 second delay
@HLDDIL001 HYLMUH001
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
	LDR R0, AHBENR_GPIOAB
	STR R0, [R6, #0x14]
	
	LDR R6, GPIOB_BASE		@Set first 8 GPIOs to Outputs
	LDR R0, MODER_BOUTPUT
	STR R0, [R6, #0]
	
	LDR R7, GPIOA_BASE		@Set first 4 GPIOs to Pulled up
	LDR R0, GPIOA_PULLUP
	STR R0, [R7, #0x0C]
	
	LDR R5, GPIOA_IDR		@Load the address of the input data into R5
	
	
	
main_loop:
	@***************GLOBAL REGISTER ASSIGNMENT**********************
	@				R0 = Switch Value
	@				R1 = Current LED pattern
	@				R2 = Delay Value
	@				R3 = 
	@				R4 = 
	@				R5 = 
	@				R6 = GPIOB_BASE
	@				R7 = GPIOA_BASE
	
	LDR R2, DEFAULT_DELAY
	
	@Checking Switch Condition
		@If SW0 is pressed
			LDR R5, GPIOA_IDR		@Load the value of the IDR in R0
			LDR R0, [R5, #0]
			MOVS R3, #0b1110
			ANDS R0, R0, R3
			CMP R0, R3
			BEQ SW0					@Set increment to amount to 2 & same timing
			
		@If SW1 is pressed
			LDR R5, GPIOA_IDR		@Load the value of the IDR in R0
			LDR R0, [R5, #0]
			MOVS R3, #0b1101
			ANDS R0, R0, R3
			CMP R0, R3
			BEQ SW1					@Change timing to 400ms and increment by 1
		
		@If SW2 is pressed
		LDR R5, GPIOA_IDR		@Load the value of the IDR in R0
		LDR R0, [R5, #0]		
			@Decrement by 1 and timing set to 300ms
		@If SW3 is pressed
		LDR R5, GPIOA_IDR		@Load the value of the IDR in R0
		LDR R0, [R5, #0]		
			@Branch back to main loop
	
	@Write current LED pattern to the LEDs
	STR R1, [R6, #0x14]
	
	@Delay by chosen delay time
	BL delay
	
	B main_loop

SW0:
	ADDS R1, #2
	@Delay time is default
SW1:
	ADDS R1, #1
	LDR R2, DELAY400MS
	
	
delay:
	SUBS R2, #1
	CMP R2, #0
	BNE delay	

	
	.align
RCC_BASE: 		.word 0x40021000
AHBENR_GPIOAB: 	.word 0x60000
GPIOB_BASE: 	.word 0x48000400
GPIOA_BASE:		.word 0x48000000
MODER_BOUTPUT:	.word 0x5555
GPIOA_PULLUP:	.word 0x55
GPIOA_IDR:      .word 0x48000010
DEFAULT_DELAY:	.word 0x186A00
DELAY400MS:		.word 0x9C400
DELAY300MS:		.word 0x75300
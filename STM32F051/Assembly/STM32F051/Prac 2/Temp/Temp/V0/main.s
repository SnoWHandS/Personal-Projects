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
	LDR R0, MODER_OUTPUT
	STR R0, [R6, #0]
	
	LDR R5, GPIOA_BASE		@Set first 4 GPIOs to Inputs
	LDR R0, MODERA_INPUT
	STR R0, [R5, #0]
	
	LDR R5, GPIOA_BASE		@Configure first 4 GPIOA pins as Pulled Up (this line can be removed)
	LDR R0, GPIOA_PULLUP
	STR R0, [R5, #0x0C]
	
	MOVS R1, #0x00			@Initialise R1 to 0
    
    LDR R5, GPIOA_BASE      @Stores the input data register in R3
    STR R3, [R5, #0x10]
    
	
		
main_loop:
	@ Main block
	
    LDR R4, #0b1111
    ANDS R3, R3, R4
    BEQ NOPress
    
    LDR R4, #0b1110
    ANDS R3, R3, R4
    BEQ SW0Pressed
    
    LDR R4, #0b1101
    ANDS R3, R3, R4
    BEQ SW1Pressed
	
	
	B main_loop
    
NOPress:
    MOVS R2, R1				@Write value to LEDs
	STR R2, [R6, #0x14]
    
    @Delay function
	LDR R0, LOOP_LENGTH1SEC		@Load the delay time in R0
	BL delay
    
    ADDS R1, R2, #1			@Add 1 to previous value and store it in R1
    
SW0Pressed:
    MOVS R2, R1				@Write value to LEDs
	STR R2, [R6, #0x14]
    
    @Delay function
	LDR R0, LOOP_LENGTH1SEC		@Load the delay time in R0
	BL delay
    
    ADDS R1, R2, #2			@Add 1 to previous value and store it in R1
    
SW1Pressed:
    MOVS R2, R1				@Write value to LEDs
	STR R2, [R6, #0x14]
    
    @Delay function
	LDR R0, LOOP_LENGTH04SEC		@Load the delay time in R0
	BL delay
    
    ADDS R1, R2, #1			@Add 1 to previous value and store it in R1
    
delay:
	SUBS R0, #1
	CMP R0, #0
	BNE delay
	Bx lr

	.align
RCC_BASE: 		.word 0x40021000
AHBENR_GPIOAB: 	.word 0b1100000000000000000
GPIOB_BASE: 	.word 0x48000400
GPIOA_BASE:		.word 0x48000000
MODER_OUTPUT: 	.word 0X5555
MODERA_INPUT: 	.word 0x28000000
GPIOA_PULLUP:	.word 0x55
LOOP_LENGTH1SEC: .word 0x186A00					@1600000 in dec = 1sec
LOOP_LENGTH04SEC:   .word 0x01E84800

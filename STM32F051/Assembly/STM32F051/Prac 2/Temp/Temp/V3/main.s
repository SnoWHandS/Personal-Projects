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
    
    LDR R3, GPIOA_IDR      @Stores the input data register in R3
    
	
    
@The code logic works
@***********************************    
main_loop:
	@ Main block
    MOVS R2, R1				@Write value to LEDs
	STR R2, [R6, #0x14]
    
    MOVS R7, #1              @Incrementation register set to 1 by default
    LDR R0, LOOP_LENGTH1SEC @Default delay time
    
    @Check if SW0 pressed
    MOVS R4, #0b1110
    ANDS R3, R3, R4
    BEQ SW0Pressed
SW0Checked:

    @Check if SW1 pressed
    MOVS R4, #0b1101
    ANDS R3, R3, R4
    BEQ SW1Pressed
SW1Checked:

    @Check if SW2 pressed 
    MOVS R4, #0b1011
    ANDS R3, R3, R4
    BEQ SW2Pressed
@Note if sw2 is pressed, it'll overide sw3 
    
    @Check if SW3 pressed
    MOVS R4, #0b0111
    ANDS R3, R3, R4
    BEQ SW3Pressed
SW3Checked:

    @Delay function
	BL delay  
    ADDS R1, R2, R7	@Add R7 to previous value and store it in R1, will be skipped if SW2 was pressed
    B main_loop
    
SW2Checked:
    BL delay
    SUBS R1, R2, R7
	B main_loop
    
@***********************************
@Check statements:    
SW0Pressed:   
    MOVS R7, #2   @increments with 2
    B SW0Checked
    
SW1Pressed:    
	LDR R0, LOOP_LENGTH04SEC		@Load the delay time in R0
    B SW1Checked
    
SW2Pressed:
    LDR R0, LOOP_LENGTH03SEC        @Load the delay time in R0
    MOVS R7, #1
    B SW2Checked

SW3Pressed:
    MOVS R7, #0
    B SW3Checked

        
delay:
	SUBS R0, #1
	CMP R0, #0
	BNE delay
	Bx lr
@***********************************
	.align
RCC_BASE: 		.word 0x40021000
AHBENR_GPIOAB: 	.word 0b1100000000000000000
GPIOB_BASE: 	.word 0x48000400
GPIOA_BASE:		.word 0x48000000
MODER_OUTPUT: 	.word 0X5555
MODERA_INPUT: 	.word 0x28000000
GPIOA_PULLUP:	.word 0x55
LOOP_LENGTH1SEC: .word 0x7A1200				@1600000 in dec = 1sec
LOOP_LENGTH04SEC:   .word 0x01E84800
LOOP_LENGTH03SEC:   .word 0x249F00  
GPIOA_IDR:       .word 0x48000410    

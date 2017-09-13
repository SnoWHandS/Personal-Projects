@STDNUM001 STDNUM002
	.syntax unified
	.cpu cortex-m0
	.thumb
	.global _start
        
@Register Defs      
        .equ GPIOB_MODER, 0x48000400
		.equ GPIOA_MODER, 0x48000000
		.equ GPIOA_IDR,   0x48000010
        .equ GPIOA_PUPDR, 0x4800000C
		.equ GPIOB_ODR,   0x48000414
        .equ RCC_AHBENR,  0x40021014
        .equ GPIOB_CLKEN, 0x00040000
		

vectors:
	.word 0x20002000
	.word _start + 1

_start:
	@ enable peripheral
    LDR R6, = RCC_AHBENR    @Set up the port A & B Clock
    LDR R0, = #0x00060000
    STR R0, [R6]
	@ configure relevant pins to be outputs
    LDR R6, = GPIOB_MODER   @Sets the address of the GPIOB_MODE register
    LDR R0, = 0x00005555    @Sets the first 8 pins of port B to output mode
    STR R0, [R6]            @Writes this config to the GPIOB_MODE register
	
	LDR R6, = GPIOA_MODER
	LDR R0, = 0x28000000
	STR R0, [R6]
	
	LDR R6, = GPIOA_PUPDR   @Set port A pin 1 to pull up
	LDR R0, = 0x00000004
	STR R0, [R6]
		
	LDR R5, = GPIOA_IDR		@Loads regiser 5 with the input data register
    LDR R6, = GPIOB_ODR     @Loads register 6 with the output data register
	
all_off:
	@ turn all LEDs off
    MOVS R1, #0x00
    STR R1, [R6]

display_AA:
	@ display the pattern 0xAA on the LEDs
    MOVS R2, #0xAA
    STR R2, [R6]
	
all_on:
	@ turn all LEDs on
    MOVS R3, #0xFF
    STR R3, [R6]
   
display_55:
	@ display the pattern 0x55 on the LEDs
    MOVS R4, #0x55
    STR R4, [R6]
	CMP R5, #0
	BNE bonus 
	
bonus:
	@ If push button SW1 is held down, change the
	@LED pattern to 0x0A.
	MOVS R4, #0x0A
	STR R4, [R6]
	@ Or else, do not alter it.

end: B all_off

   


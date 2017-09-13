@STDNUM001 STDNUM002
	.syntax unified
	.cpu cortex-m0
	.thumb
	.global _start

vectors:
	.word 0x20002000
	.word _start + 1

_start:
	@ enable peripheral
BL init_clks
    
BL init_gpio
    
@Load Base Address
LDR R0, GPIOB_BASE
	
all_off:
    MOVS R1, #0x00
    STR R1, [R0, 0x14]
    
display_AA:
	@ display the pattern 0xAA on the LEDs
	MOVS R1, #0xAA
    STR R1, [R0, #0x14]
        
all_on:
	@ turn all LEDs on
    MOVS R1, #0xFF
    STR R1, [R0, #0x14]
       
display_55:
	@ display the pattern 0x55 on the LEDs
	MOVS R1, #0x55
    STR R1, [R0, #0x14]
    
bonus:
	@ If push button SW1 is held down, change the
	@ LED pattern to 0x0A.
    LDR R2, GPIOA_BASE
    LDR R1, [R2, #0x10]
    MOVS R3, #0b10
    ANDS R1, R1, R3
    BEQ display_0A
	@ Or else, do not alter it.

end: B all_off

display_0A:
    MOVS R1, #0x0A
    STR R1, [R0, #0x14]
    B all_off

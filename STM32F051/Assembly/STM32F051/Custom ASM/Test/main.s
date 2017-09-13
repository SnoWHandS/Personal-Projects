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

BL _init_clks
    
BL _init_gpio
    
@Load Base Address
	
all_off:
    MOVS R7, #0x00
    BL _write_to_LEDs
    
display_AA:
	@ display the pattern 0xAA on the LEDs
	MOVS R7, #0xAA
    BL _write_to_LEDs
        
all_on:
	@ turn all LEDs on
    MOVS R7, #0xFF
    BL _write_to_LEDs
       
display_55:
	@ display the pattern 0x55 on the LEDs
	MOVS R7, #0x55
    BL _write_to_LEDs
    
bonus:
	@ If push button SW1 is held down, change the
    MOVS R1, #0b10
	BL _read_frm_switch
    ANDS R7, R7, R1
    BEQ display_0A
	@ Or else, do not alter it.

end: B all_off

display_0A:
    MOVS R7, #0x0A
    BL _write_to_LEDs
    B all_off

	
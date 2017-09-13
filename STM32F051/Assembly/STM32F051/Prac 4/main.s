@ STDNUM001 STDNUM002

    .syntax unified
    .global _start

    .word 0x20002000
    .word _start + 1
_start:
    
    @ do initialisations here

to_RAM_loop_loop:
    @ iterate through each

@ CRITICAL! When the program hits this label, the automarker will
@ stop execution and verify the contents of RAM.
copy_to_RAM_done:

    @ Multiple iterations through data at start of ram and push
	@ to the stack from smallest negative number to largest positive number

@ CRITICAL! The marker will verify contents of stack
@ the stack when the program hits this label.
order_to_stack_done:
    
main_loop:
    @ Display smallest from part 2 on LEDs
    @ call delay subroutine
    @ Display largest from part 2 on LEDs
    @ call delay subroutine
    B main_loop

delay:
    @ backup registers to the stack
    @ implement your delay routine here.
    @ restore backed up registers
    @ return in the way that subroutines return.


    .align
@ you can define more literals here.


@ Before compiling your code, the automarker will modify this block.
@ Be sure to avoid out-by-one errors: make sure you access ALL elements.
DATA:  
    .word 0x62967109
    .word 0x0674a70b
    .word 0x902bff4f
    .word 0xe7fa8a65
    .word 0xb610c2fe
    .word 0x237e8814
    .word 0xfe0573a4
    .word 0xefd6e381
    .word 0x33c8bf70
    .word 0xfbe4bc46
DATA_END: 

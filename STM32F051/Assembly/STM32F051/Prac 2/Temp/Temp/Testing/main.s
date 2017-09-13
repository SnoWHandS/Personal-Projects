	.syntax unified
	.cpu cortex-m0
	.thumb
	.global _start
    
vectors:
	.word 0x20002000
	.word _start + 1

_start:
    LDR R6, RCC_BASE		@Configure GPIO A and B Clock
	LDR R0, AHBENR_GPIOAB
	STR R0, [R6, #0x14]		
	
	LDR R6, GPIOB_BASE		@Set first 8 GPIOs to Outputs
	LDR R0, MODER_OUTPUT
	STR R0, [R6, #0]
    
    LDR R6, GPIOA_BASE
    @LDR R0, MODERA_INPUT
    @STR R0, [R6, #0]
    
    LDR R0, GPIOA_PULLUP
    STR R0, [R6, #0x0C]  
    
    LDR R0, GPIOA_IDR
    LDR R6, GPIOB_BASE 
    
    
main_loop:
    LDR R0, GPIOA_IDR
    LDR R1, [R0, #0]
    STR R1, [R6, #0x14]
    
    
    B main_loop
    
    
    
    .align
RCC_BASE: 		.word 0x40021000
AHBENR_GPIOAB: 	.word 0b1100000000000000000
GPIOB_BASE: 	.word 0x48000400
GPIOA_BASE:		.word 0x48000000
MODER_OUTPUT: 	.word 0x5555
MODERA_INPUT: 	.word 0x28000000
GPIOA_PULLUP:	.word 0x55
GPIOA_IDR:      .word 0x48000010  



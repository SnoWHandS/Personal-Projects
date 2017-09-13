
@----------------Clocks-------------------
_init_clks:
    LDR R0, RCC_BASE
    @---Clocking for GPIO---
        LDR R1, [R0, #0x14]
        LDR R2, GPIOAB_CLK
        ORRS R1, R1, R2
        STR R1, [R0, #0x14]
    @-----------------------
    
    @---Clocking for TIM6---
        LDR R1, [R0, #0x1C]
        LDR R2, TIM6_CLK
        ORRS R1, R1, R2
        STR R1, [R0, #0x1C]
    @-----------------------
    
    @---Clocking for ADC----
        LDR R1, [R0, #0x18]
        LDR R2, ADC_CLK
        ORRS R1, R1, R2
        STR R1, [R0, #0x18]
    @-----------------------
@-----------------------------------------
BX LR

_init_gpio:    
@-----------------GPIO--------------------
    LDR R0, GPIOB_BASE
    @---Mode select--------
        LDR R1, [R0, #0x00]
        LDR R2, GPIOB_LEDS_OUTPUT
        ORRS R1, R1, R2
        STR R1, [R0, #0x00]
    @----------------------
    
    LDR R0, GPIOA_BASE
    @---Mode select--------
        LDR R1, [R0, #0x00]
        LDR R2, GPIOA_POTS_ANALOGUE
        ORRS R1, R1, R2
        STR R1, [R0, #0x00]
    @----------------------
    
    @---Pull-Up/Pull-Down--
        LDR R1, [R0, #0x0C]
        LDR R2, PORTA_PULL_UP
        ORRS R1, R1, R2
        STR R1, [R0, #0x0C]
    @---------------------
@----------------------------------------
BX LR


	.align
@Base addresses-------------------------------------------------
RCC_BASE:   .word 0x40021000
GPIOA_BASE: .word 0x48000000
GPIOB_BASE: .word 0x48000400
TIM6_BASE:  .word 0x40001000
SRAM_BASE:  .word 0x20000000
@---------------------------------------------------------------

@Configurations-------------------------------------------------
GPIOAB_CLK:          .word 0b11 << 17
TIM6_CLK:            .word 0b1 << 4
ADC_CLK:             .word 0b1 << 9
GPIOB_LEDS_OUTPUT:   .word 0x5555           @0b0101010101010101
GPIOA_POTS_ANALOGUE: .word 0x3C00           @0b11110000000000
PORTA_PULL_UP:       .word 0b01010101
@---------------------------------------------------------------
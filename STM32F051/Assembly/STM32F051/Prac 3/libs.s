.syntax unified
.global _init_clks
.global _init_gpio
.global _init_TIM6_enable
.global _TIM6_NVIC_init
.global _write_to_LEDs
.global _read_frm_btns
.global _one_sec_delay
.global _init_adc
.global _get_adc
.global _write_bytes_to_RAM

.global _adc_sample_6
.global _adc_sample_5
.global _TIM6_PSC
.global _TIM6_ARR
.global _TIM6_ack

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
BX LR
@-----------------------------------------

@----------------ADC----------------------
_init_adc:
	LDR R0, ADC_BASE
	@---ADC resolution to 8-bit---
		LDR R1, [R0, #0x0C]
		MOVS R2, #0b10000
		ORRS R1, R1, R2
		STR R1, [R0, #0x0C]
	@-----------------------------
		
	@---enable ADC----------------
		MOVS R1, #1 				@ ADEnable = bit0
		STR R1, [R0, #0x08]			@ ADC_ControlReg
	adrdy_loop:
		LDR R1, [R0, #0]			@ ADC_ISR
		MOVS R2, #1
		ANDS R1, R1, R2
		BNE adrdy_loop
		MOVS R1, #0b100000
		STR R1, [R0, 0x28]
	@-----------------------------
BX LR
@-----------------------------------------

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
BX LR
@----------------------------------------

@----------------TIM6--------------------
_init_TIM6_enable:
    PUSH {R0, R1, R2, LR}           	@ push registers used to the stack
  @ set update interupt enable for TIM6
  	LDR R0, TIM6_BASE           		@ load with base address for TIM6
  	LDR R1, [R0, #0x0C]         		@ load with effective address of TIM6_DIER
    MOVS R2, #1                 		@ set first bit high of TIM6_DIER
    ORRS R1, R1, R2             		@ change first bit to 1
    STR R1, [R0, #0x0C]         		@ store back in memory

  @ enable counter (CEN)
  	LDR R1, [R0]				       	@ load with counter effective address
  	LDR R2, =0b1					    @ load number 1
  	ORRS R2, R2, R1					    @ change the first bit
  	STR R2, [R0]					    @ store back in memory

  @ set buffering for ARR
    LDR R1, [R0, #0x00] 		        @ load with effective address of TIM6_CR1
    LDR R2, =0b10000000         		@ ste 7th bit high, ARPE high
    ORRS R1, R1, R2             		@ set ARPE to buffered
    STR R1, [R0, #0x00]         		@ store back in memory
    POP {R0, R1, R2, PC}            	@ recover used registers from the stack
 
@----------------------------------------

@--------NVIC---------------------------- 
_TIM6_NVIC_init:
  @ set TIM6 IRQ in NVIC
      PUSH {R0, R1, LR}           		@ push registers used to the stack
      LDR R0, ISER                      @ load with base of ISER
      LDR R1, =0b100000000000000000     @ set bit 17 high
      STR R1, [R0]                      @ make 17th bit high
      POP {R0, R1, PC}            		@ recover used registers from the stack    

@----------------------------------------
      
_get_adc:				@Outputs the ADC value to R7
PUSH {R0-R2, LR}
	LDR R0, ADC_BASE
	MOVS R1, #0b100   @ ADSTART
	STR R1, [R0, #0x08]  @ ADC_CR
	eoc_loop:
		LDR R1, [R0, #0]
		MOVS R2, #0b100
		ANDS R1, R1, R2
		BEQ eoc_loop
	LDR R7, [R0, #0x40]  @ ADC_DR
POP {R0-R2, PC}

_adc_sample_6:
@ ***sampled value is held in R3***
    PUSH {R0, R1, R2, LR}               @ push registers used to the stack
    LDR R0, ADC_BASE					@ R0 = ADC_BASE
  	MOVS R1, #0x40						@ R1 = bit6 high (Channel 6)
  	STR R1, [R0, #0x28]					@ overwrite ADC_CHSELR
  	@ ADC start
  	MOVS R2, #0x04						@ R2 = ADSTART high
  	STR R2, [R0, #0x08]					@ overwrite ADC_CR
   EOC_ready_pot1:
        LDR R1, [R0, #0x0]					@ R1 = ADC_ISR
        MOVS R2, #0x04						@ R2 = EOC check value
        ANDS R1, R1, R2
        CMP R1, #0							@ compare to EOC
        BEQ EOC_ready_pot1					@ 0: EOC_ready_pot1 1: forward
  	@ Store POT0 in R3
  	LDR R3, [R0, #0x40]					@ R3 = data from ADC_DR
    POP {R0, R1, R2, PC}                @ recover used registers from the stack
    
_adc_sample_5:
@ ***sampled value is held in R7***
  PUSH {R0, R1, R2, LR}             	@ push registers used to the stack
  LDR R0, ADC_BASE						@ R0 = ADC_BASE
  MOVS R1, #0x20						@ R1 = bit5 high (Channel 5)
  STR R1, [R0, #0x28]					@ overwrite ADC_CHSELR
  @ ADC start
  MOVS R2, #0x04						@ R2 = ADSTART high
  STR R2, [R0, #0x08]					@ overwrite ADC_CR
  EOC_ready_pot0:
      LDR R1, [R0, #0x0]					@ R1 = ADC_ISR
      MOVS R2, #0x04						@ R2 = EOC check value
      ANDS R1, R1, R2
      CMP R1, #0							@ compare to EOC
      BEQ EOC_ready_pot0					@ 0: EOC_ready_pot0 1: forward
  @ Store POT0 in R3
  LDR R7, [R0, #0x40]				    @ R3 = ADC_DR
  POP {R0, R1, R2, PC}              	@ recover used registers from the stack
    
_TIM6_PSC:
  @ set prescaler for TIM6
  @***R7 must contain the value for PSC***
    PUSH {R0, LR}               		@ push registers used to the stack
    LDR R0, TIM6_BASE       			@ load with base address for TIM6
    STR R7, [R0, #0x28]     			@ store number in R1 to TIM6_PSC
    POP {R0, PC}                		@ recover used registers from the stack

_TIM6_ARR:
  @ set ARR of TIM6
  @***R7 must contain the value for the ARR***
    PUSH {R0, LR}               		@ push registers used to the stack
    LDR R0, TIM6_BASE       			@ load with base address for TIM6
    STR R7, [R0, #0x2C]     			@ set TIM6_ARR to R1
    POP {R0, PC}                		@ recover used registers from the stack
    
_TIM6_ack:
  @ acknowledges the TIM6 interrupt
  PUSH {R0, R1, LR}
  LDR R0, TIM6_BASE               		@ load with TIM6 base address
  MOVS R1, #0                     		@ load 0
  STR R1, [R0, 0x10]              		@ store back in memory to TIM6_SR to ack. interrupt
  POP {R0, R1, PC}
	
_write_bytes_to_RAM:	@Expects R7 to contain begin address and R6 to contain end address of data block
						@Returns the address of the last byte in R7
PUSH {R2-R3, LR}
LDR R3, BEGIN_OF_RAM
	write_to_RAM_loop:
		LDRB R2, [R7]
		@ADDS R2, #1	@If you wish to add 1 to each byte :)
		STRB R2, [R3]
		ADDS R3, #1
		ADDS R7, #1
		CMP R7, R6
		BNE write_to_RAM_loop
	MOVS R7, R3
POP {R2-R3, PC}

_write_to_LEDs:				@Expects R7 to contain byte to be written
	PUSH {R0-R7, LR}
	LDR R0, GPIOB_BASE
	STR R7, [R0,0x14]
	POP {R0-R7, PC}
	
_read_frm_btns:			@Outputs the switch output to R7
	PUSH {R0, LR}
	LDR R0, GPIOA_BASE
	LDR R7, [R0, #0x10]
	POP {R0, PC}
	
_one_sec_delay:
	PUSH {R7, LR}
	LDR R7, ONESEC_DELAY
	delay_loop:
		SUBS R7, #1
		BNE delay_loop
	POP {R7, PC}
	
	.align
@Base addresses-------------------------------------------------
RCC_BASE:   .word 0x40021000
GPIOA_BASE: .word 0x48000000
GPIOB_BASE: .word 0x48000400
TIM6_BASE:  .word 0x40001000
SRAM_BASE:  .word 0x20000000
ADC_BASE:	.word 0x40012400
BEGIN_OF_RAM:	.word 0x20000000
ISER:       .word 0xE000E100
@---------------------------------------------------------------

@Configurations-------------------------------------------------
GPIOAB_CLK:          .word 0b11 << 17
TIM6_CLK:            .word 0b1 << 4
ADC_CLK:             .word 0b1 << 9
GPIOB_LEDS_OUTPUT:   .word 0x5555           @0b0101010101010101
GPIOA_POTS_ANALOGUE: .word 0x3C00           @0b11110000000000
PORTA_PULL_UP:       .word 0b01010101
@---------------------------------------------------------------


ONESEC_DELAY:	.word 2000000				@2000000 = 1second, 2400000 = 1.2second

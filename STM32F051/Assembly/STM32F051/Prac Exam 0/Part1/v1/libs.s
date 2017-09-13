@KXXDOY001 HLDDIL001 

	.syntax unified
	.global lib_init_leds					@ none
	.global lib_write_leds					@ R7 = output data (8bit)
	.global lib_read_leds					@ R7 = read data
	.global lib_init_push_buttons			@ none
	.global lib_read_push_buttons			@ R7 = input data
	.global lib_init_adc_12_bit				@ none
	.global lib_init_adc_10_bit				@ none
	.global lib_init_adc_8_bit				@ none
	.global lib_init_pots					@ none BL lib_init_push_buttons required
	.global lib_read_pot_0					@ R7 = input data (depends)
	.global lib_read_pot_1					@ R7 = input data (depends)
	.global lib_init_tim6					@ R5 = PSC & R6 = ARR
	.global lib_tim6_ack					@ none
	.global lib_update_arr					@ R7 = ARR update data
	.global lib_init_lcd_0					@ none BL lib_init_leds & lib_init_push_buttons required
	.global lib_init_lcd_1					@ none BL lib_init_lcd_0 required
	.global lib_write_lcd_0					@ R7 = 4-bit infc com data
	.global lib_write_lcd_1					@ R7 = 4-bit infc com data
	.global lib_disp_clear					@ none
	.global lib_write_bytes_to_RAM			@ R7 = begin data block & R6 = end data block
	.global lib_find_minimum_RAM_unsigned
	
	@ libs.s functions
	@ lib_init_leds					@ 1) none														
	@ lib_write_leds				@ R7 = output data (8bit)                                       
	@ lib_read_leds					@ R7 = read data
	@ lib_init_push_buttons			@ 2) none                                                       
	@ lib_read_push_buttons			@ R7 = input data                                               
	@ lib_init_adc_12_bit			@ 5) none                                                       
	@ lib_init_adc_10_bit			@ 5) none                                                       
	@ lib_init_adc_8_bit			@ 5) none                                                       
	@ lib_init_pots					@ 3) none BL lib_init_push_buttons required                     
	@ lib_read_pot_0				@ R7 = input data (depends)                                     
	@ lib_read_pot_1				@ R7 = input data (depends)                                     
	@ lib_init_tim6					@ 7) none 	@ R5 = PSC	@ R6 = ARR                              
	@ lib_tim6_ack					@ none
	@ lib_update_arr				@ R7 = ARR update data
	@ lib_init_lcd_0				@ 4) none BL lib_init_leds & lib_init_push_buttons required     
	@ lib_init_lcd_1				@ 6) none BL lib_init_lcd_0 required                            
	@ lib_write_lcd_0				@ R7 = 4-bit infc com data                                      
	@ lib_write_lcd_1				@ R7 = 4-bit infc com data  
	@ lib_write_bytes_to_RAM:		@Expects R7 to contain begin address and R6 to contain end address of data block
									@Returns the address of the last byte in R7
									
lib_find_minimum_RAM_unsigned:

	PUSH {R1, R4-R5, LR}

    @ initialise the possibly false minimum
    LDRB R3, [R1, #0x0]
    MOVS R5, R2
    ADDS R5, #1
    SUBS R5, R1

    rmin_compare_loop_1:

    	CMP R5, #0
        BEQ end_of_rmin_1

        @ load the next value for comparison
        LDRB R4, [R1, #0x0]
        ADDS R1, #1
        SUBS R5, #1

        @ replace it with R4 if R4 is smaller
        CMP R4, R3
        BLT rmin_replace_1

        B rmin_compare_loop_1

    rmin_replace_1:
        MOVS R3, R4

        B rmin_compare_loop_1

    end_of_rmin_1:

    POP {R1, R4-R5, PC}								
									
	
lib_write_bytes_to_RAM:	@Expects R7 to contain begin address and R6 to contain end address of data block
						@Returns the address of the last byte in R7
PUSH {R2-R3, LR}
LDR R3, RAM_START
	write_to_RAM_loop:
		LDRB R2, [R7]
		ADDS R2, #1	@If you wish to add 1 to each byte :)
		STRB R2, [R3]
		ADDS R3, #1
		ADDS R7, #1
		CMP R7, R6
		BNE write_to_RAM_loop
	MOVS R7, R3
POP {R2-R3, PC}
	
lib_init_leds:
	PUSH {R0-R6, LR}
	@ IOPBEN
	LDR R0, RCC_BASE			@ R0 = RCC_BASE
	LDR R1, [R0, #0x14]			@ R1 = RCC_AHBENR
	LDR R2, =0x40000			@ R2 = bit18 high
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x14]			@ storing back into RCC_AHBENR
	@ MODER PB[0:7] OUTPUT
	LDR R0, GPIOB_BASE			@ R0 = GPIOB_BASE
	LDR R1, [R0, #0]			@ R1 = MODER
	LDR R2, =0x5555				@ R2 = Setting 8 LEDs to output
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0]			@ storing back into MODER
	POP  {R0-R6, PC}
	
lib_write_leds:
	@ R7 = holds value to be stored to output
	PUSH {R0-R6, LR}
	LDR R0, GPIOB_BASE			@ R0 = GPIOB_BASE
	STR R7, [R0, #0x14]			@ Storing R7 into ODR
	POP  {R0-R6, PC}

lib_read_leds:
	@ R7 = holds read value from GPIOB_ODR
	PUSH {R0-R6, LR}
	LDR R0, GPIOB_BASE			@ R0 = GPIOB_BASE
	LDR R7, [R0, #0x14]			@ reading off from R7 into ODR
	POP  {R0-R6, PC}

lib_init_push_buttons:
	PUSH {R0-R6, LR}
	@ IOPAEN
	LDR R0, RCC_BASE			@ R0 = RCC_BASE
	LDR R1, [R0, #0x14]			@ R1 = RCC_AHBENR
	LDR R2, =0x20000			@ R2 = bit17 high
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x14]			@ storing back into RCC_AHBENR
	@ MODER PA[0:3] INPUT by default
	@ PUPDR PA[0:3]
	LDR R0, GPIOA_BASE			@ R0 = GPIOA_BASE
	LDR R1, [R0, #0x0C]			@ R1 = GPIOA_PUPDR
	LDR R2, =0x55				@ R2 PA[0:3] pull-up
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x0C]			@ storing back into GPOIA_PUPDR
	POP  {R0-R6, PC}
	
lib_read_push_buttons:
	@ R7 = holds value to be returned
	PUSH {R0-R6, LR}
	LDR R0, GPIOA_BASE			@ R0 = GPIOA_BASE
	LDR R7, [R0, #0x10]			@ R7 = holds data from GPIOA_IDR
	POP  {R0-R6, PC}
	
lib_init_adc_12_bit:
	PUSH {R0-R6, LR}
	@ Enable ADC Clock
	LDR R0, RCC_BASE			@ R0 = RCC_BASE			
	LDR R1, [R0, #0x18]			@ R1 = RCC_APB2ENR
	LDR R2, =0x200				@ R2 = bit0 high (ADCEN)
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x18]			@ storing in RCC_APB2ENR
	@ Configure ADC, resolution 12 bit
	LDR R0, ADC_BASE			@ R0 = ADC_BASE
	LDR R1, [R0, #0x0C]			@ R1 = ADC_CFGR1
	LDR R2, =0b00000			@ R2 = bit[4:3] = 00 (12 bit)
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x0C]			@ storing in ADC_CFGR1
	@ Enable ADC
	LDR R1, [R0, #0x08]			@ R1 = ADC_CR
	MOVS R2, #1					@ R2 = ADEN 1
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x08]			@ storing in the ADC_CR
	@ Wait until ADC is ready
ADCRDY_12_bit:	
	LDR R1, [R0]				@ R1 = ADC_ISR
	MOVS R2, #1					@ R2 = ADEN 1
	ANDS R1, R1, R2				
	CMP R1, #0					@ compare	
	BEQ ADCRDY_12_bit			@ 0: ADCRDY_12_bit 1: forward
	POP  {R0-R6, PC}
	
lib_init_adc_10_bit:
	PUSH {R0-R6, LR}
	@ Enable ADC Clock
	LDR R0, RCC_BASE			@ R0 = RCC_BASE			
	LDR R1, [R0, #0x18]			@ R1 = RCC_APB2ENR
	LDR R2, =0x200				@ R2 = bit0 high (ADCEN)
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x18]			@ storing in RCC_APB2ENR
	@ Configure ADC, resolution 10 bit
	LDR R0, ADC_BASE			@ R0 = ADC_BASE
	LDR R1, [R0, #0x0C]			@ R1 = ADC_CFGR1
	LDR R2, =0x01000			@ R2 = bit[4:3] = 01 (10 bit)
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x0C]			@ storing in ADC_CFGR1
	@ Enable ADC
	LDR R1, [R0, #0x08]			@ R1 = ADC_CR
	MOVS R2, #1					@ R2 = ADEN 1
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x08]			@ storing in the ADC_CR
	@Wait until ADC is ready
ADCRDY_10_bit:	
	LDR R1, [R0]				@ R1 = ADC_ISR
	MOVS R2, #1					@ R2 = ADEN 1
	ANDS R1, R1, R2				
	CMP R1, #0					@ compare	
	BEQ ADCRDY_10_bit			@ 0: ADCRDY_10_bit 1: forward
	POP  {R0-R6, PC}
	
lib_init_adc_8_bit:
	PUSH {R0-R6, LR}
	@ Enable ADC Clock
	LDR R0, RCC_BASE			@ R0 = RCC_BASE			
	LDR R1, [R0, #0x18]			@ R1 = RCC_APB2ENR
	LDR R2, =0x200				@ R2 = bit0 high (ADCEN)
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x18]			@ storing in RCC_APB2ENR
	@ Configure ADC, resolution 8 bit
	LDR R0, ADC_BASE			@ R0 = ADC_BASE
	LDR R1, [R0, #0x0C]			@ R1 = ADC_CFGR1
	LDR R2, =0b10000			@ R2 = bit[4:3] = 10 (8 bit)
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x0C]			@ storing in ADC_CFGR1
	@ Enable ADC
	LDR R1, [R0, #0x08]			@ R1 = ADC_CR
	MOVS R2, #1					@ R2 = ADEN 1
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x08]			@ storing in the ADC_CR
	@ Wait until ADC is ready
ADCRDY_8_bit:	
	LDR R1, [R0]				@ R1 ADC_ISR
	MOVS R2, #1					@ R2 = ADEN 1
	ANDS R1, R1, R2				
	CMP R1, #0					@ compare	
	BEQ ADCRDY_8_bit			@ 0: ADCRDY_8_bit 1: forward
	POP  {R0-R6, PC}

lib_init_pots:
	@ BL lib_init_push_buttons required
	PUSH {R0-R6, LR}
	LDR R0, GPIOA_BASE			@ R0 = GPIOA_BASE
	LDR R1, [R0, #0]			@ R1 = GPIOA_MODER
	LDR R2, =0x3C00				@ R2 = set PA[5:6] set to analogue
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0]			@ storing to GPIOA_MODER
	POP  {R0-R6, PC}
	
lib_read_pot_0:
	@ R7 = holds value to be returned
	PUSH {R0-R6, LR}
	LDR R0, ADC_BASE			@ R0 = ADC_BASE
	@ Set ADC Channels PA5 (POT0)
	MOVS R1, #0x20				@ R1 = bit5 high (Channel 5)
	STR R1, [R0, #0x28]			@ overwrite ADC_CHSELR
	@ ADC start					
	MOVS R2, #0x04				@ R2 = ADSTART high
	STR R2, [R0, #0x08]			@ overwrite ADC_CR
EOC_ready_pot0:
	LDR R1, [R0, #0x0]			@ R1 = ADC_ISR
	MOVS R2, #0x04				@ R2 = EOC check value
	ANDS R1, R1, R2				
	CMP R1, #0					@ compare to EOC
	BEQ EOC_ready_pot0			@ 0: EOC_ready_pot0 1: forward
	@ Store POT0 in R7
	LDR R7, [R0, #0x40]			@ R7 = data from ADC_DR	
	POP  {R0-R6, PC}
	
lib_read_pot_1:
	@ R7 = holds value to be returned
	PUSH {R0-R6, LR}
	LDR R0, ADC_BASE			@ R0 = ADC_BASE
	@Set ADC Channels PA6 (POT1)
	MOVS R1, #0x40				@ R1 = bit6 high (Channel 6)
	STR R1, [R0, #0x28]			@ overwrite ADC_CHSELR
	@ ADC start					
	MOVS R2, #0x04				@ R2 = ADSTART high
	STR R2, [R0, #0x08]			@ overwrite ADC_CR
EOC_ready_pot1:
	LDR R1, [R0, #0x0]			@ R1 = ADC_ISR
	MOVS R2, #0x04				@ R2 = EOC check value
	ANDS R1, R1, R2				
	CMP R1, #0					@ compare to EOC
	BEQ EOC_ready_pot1			@ 0: EOC_ready_pot1 1: forward
	@ Store POT0 in R1
	LDR R7, [R0, #0x40]			@ R7 = data from ADC_DR	
	POP  {R0-R6, PC}
	
lib_tim6_ack:
  @ acknowledges the TIM6 interrupt
  PUSH {R0, R1, LR}
  LDR R0, TIM6_BASE               		@ load with TIM6 base address
  MOVS R1, #0                     		@ load 0
  STR R1, [R0, 0x10]              		@ store back in memory to TIM6_SR to ack. interrupt
  POP {R0, R1, PC}

lib_init_tim6:
	@ R5 = PSC
	@ R6 = ARR
	PUSH {R0-R4, LR}
	@ TIM6 enable
	LDR R0, RCC_BASE			@ R0 = RCC_BASE
	LDR R1, [R0, #0x1C]			@ R1 = RCC_APB1ENR
	MOVS R2, #0x10				@ R2 bit4 high (TIM6EN)
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x1C]			@ storing in RCC_APB1ENR
	@ Configure TIM6: PSC, ARR
	LDR R0, TIM6_BASE			@ R0 = TIM6_BASE
	STR R5, [R0, #0x28]         @ store R5 in TIM6_PSC
	STR R6, [R0, #0x2C]         @ store R6 in TIM6_ARR
	@ Enable interrupt request
	LDR R1, [R0, #0x0C]         @ R1 = TIM6_DIER
	MOVS R2, #1                 @ R2 = bit0 high (UIE)
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x0C]			@ storing into TIM6_DIER
	@Start counter counting
	LDR R1, [R0, #0]            @ R1 = TIM6_CR1
	MOVS R2, #1                 @ R2 = bit0 high (CEN)
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0]			@ storing into TIM6_CR1
	@ Enable TIM6 IRQ in NVIC
	LDR R0, NVIC_ISER
	LDR R1, [R0, #0]            @ R1 = NVIC_ISER (Architecture B3-18)
	LDR R2, =0x20000			@ R2 = bit17 high (TIM6)
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0]			@ storing into NVIC_ISER
	POP  {R0-R4, PC}

lib_update_arr:
	@ R7 = ARR update data
	PUSH {R0-R6,LR}
	LDR R0, TIM6_BASE			@ R0 = TIM6_BASE
	STR R7, [R0, #0x2C]         @ store R6 in TIM6_ARR
	POP {R0-R6, PC}
	
lib_init_lcd_0:
	@ BL lib_init_leds & lib_init_push_buttons required
	PUSH {R0-R6,LR}
	@ IOPCEN
	LDR R0, RCC_BASE			@ R0 = RCC_BASE
	LDR R1, [R0, #0x14]			@ R1 = RCC_AHBENR
	LDR R2, =0x80000			@ R2 = bit19 high
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0x14]			@ storing back into RCC_AHBENR
	@ MODER PA[12,15], PB[8:9] & PC[14:15] OUTPUT
	LDR R0, GPIOA_BASE			@ R0 = GPIOA_BASE
	LDR R1, [R0, #0]			@ R1 = MODER
	LDR R2, =0x41000000			@ R2 = Setting PA[12,15] to output
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0]			@ storing back into MODER
	LDR R0, GPIOB_BASE			@ R0 = GPIOB_BASE
	LDR R1, [R0, #0]			@ R1 = MODER
	LDR R2, =0x50000			@ R2 = Setting PB[8:9] to output
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0]			@ storing back into MODER
	LDR R0, GPIOC_BASE			@ R0 = GPIOC_BASE
	LDR R1, [R0, #0]			@ R1 = MODER
	LDR R2, =0x50000000			@ R2 = Setting PC[14:15] to output
	ORRS R1, R1, R2				@ masking
	STR R1, [R0, #0]			@ storing back into MODER
	POP  {R0-R6, PC}
	
lib_init_lcd_1:
	PUSH {R0-R6,LR}
								@ BL lib_init_lcd_0 required
								@ Please remind yourself regarding Register rsvd before using it.
								@ BL delay = delay based on R4 value
								@ BL enable = trigger pulse on enable pin (PC15)
								@ BL lcd_4b_write = write 4-bit itfc com with PA15, PA12, PB9 & PB8
								@ RS setting needs to be done manually.
	LDR R0, GPIOA_BASE			@ R0 = local reserved, GPIOA_BASE
	LDR R1, GPIOB_BASE			@ R1 = local reserved, GPIOB_BASE
	LDR R2, GPIOC_BASE			@ R2 = local reserved, GPIOC_BASE
	MOVS R3, #0					@ R3 = local reserved, =0
								@ R4 = local reserved, delay length
								@ R5 = local reserved, ODR reading (reloaded)
								@ R6 = local reserved, ODR check value (reloaded)
								@ R7 = global reserved, 4-bit infc com data
	LDR R4, =900000						@ delay of 100ms
	BL delay
@ STEP 1: wait							@ 00 0011 0000
	MOVS R7, #0b0011
	BL lcd_4b_write
	STR R3, [R2, #0x14]					@ output 0 to RS
	BL enable							@ transmit data to lcd
	LDR R4, =35000						@ delay of 4.4ms
	BL delay	
@ STEP 2: wait							@ 00 0011 0000 (8 bit mode)
	BL enable
	LDR R4, =900						@ delay of 100us
	BL delay
@ STEP 3: wait							@ 00 0011 0000 (8 bit mode)
	BL enable
	LDR R4, =900						@ delay of 100us
	BL delay
@ STEP 4: funct set: 4 bit interface	@ 00 0010 0000 (8 bit mode)
	MOVS R7, #0b0010
	BL lcd_4b_write
	BL enable
	LDR R4, =900						@ delay of 100us
	BL delay
@ STEP 5: 4 bit md: dsply ln & chr fnt	@ 00 0010 1000 (4 bit mode)
	BL enable
	MOVS R7, #0b1000
	BL lcd_4b_write
	BL enable
	LDR R4, =450						@ delay of 56us
	BL delay
@ STEP 6: dsply off						@ 00 0000 1000 (4 bit mode)
	MOVS R7, #0b0000
	BL lcd_4b_write
	BL enable
	MOVS R7, #0b1000
	BL lcd_4b_write
	BL enable
	LDR R4, =450						@ delay of 56us
	BL delay
@ STEP 7: dsply clear					@ 00 0000 0001 (4 bit mode)
	MOVS R7, #0b0000
	BL lcd_4b_write
	BL enable
	MOVS R7, #0b0001
	BL lcd_4b_write
	BL enable
	LDR R4, =24000						@ delay of 3ms
	BL delay
@ SKIP STEP 8: etry mod; dsply on		@ 00 0000 1100 (4 bit mode)
	MOVS R7, #0b0000
	BL lcd_4b_write
	BL enable
	MOVS R7, #0b1100
	BL lcd_4b_write
	BL enable
	LDR R4, =450						@ delay of 56us
	BL delay
	POP  {R0-R6, PC}
	
lib_write_lcd_0:
	@ R7 = 4-bit infc com data
	PUSH {R0-R5, LR}
								@ to write, use it twice
	LDR R0, GPIOA_BASE			@ R1 = local reserved, GPIOB_BASE
	LDR R1, GPIOB_BASE			@ R1 = local reserved, GPIOB_BASE
	LDR R2, GPIOC_BASE			@ R2 = local reserved, GPIOC_BASE
	MOVS R3, #0					@ R3 = local reserved, =0
								@ R4 = local reserved, delay length
								@ R5 = local reserved, ODR reading
								@ R6 = local reserved, ODR check value (reloaded)
								@ R7 = global reserved, 4-bit infc com data
	LDR R5, =0x4000				@ RS to high
	STR R5, [R2, #0x14]
	BL lcd_4b_write
	BL enable
	POP {R0-R5, PC}

lib_write_lcd_1:
	@ R7 = 4-bit infc com data
	PUSH {R0-R5, LR}
	@ to write, use it twice
	LDR R0, GPIOA_BASE			@ R1 = local reserved, GPIOB_BASE
	LDR R1, GPIOB_BASE			@ R1 = local reserved, GPIOB_BASE
	LDR R2, GPIOC_BASE			@ R2 = local reserved, GPIOC_BASE
	MOVS R3, #0					@ R3 = local reserved, =0
								@ R4 = local reserved, delay length
								@ R5 = local reserved, ODR reading	(reloaded)
								@ R6 = local reserved, ODR check value (reloaded)
								@ R7 = global reserved, 4-bit infc com data
	LDR R5, =0x4000				@ RS to high
	STR R5, [R2, #0x14]
	BL lcd_4b_write
	BL enable
	LDR R4, =500
	BL delay
	POP {R0-R5, PC}
@-------------------------------------------------------------
@ SUB_FUNCTIONS FOR lib_init_lcd_x
@ BL enable = trigger pulse on enable pin (PC15)
enable:							@ enable pin pulse trigger
	LDR R4, [R2, #0x14]
	LDR R5, =0x8000
	ORRS R5, R5, R4
	STR R5, [R2, #0x14]			@ set enable high
	STR R3, [R2, #0x14]			@ set enable low
	BX LR

delay:							@ BL delay = delay based on R4 value
wait:
	SUBS R4, R4, #1
	CMP R4, R3
	BNE wait
	BX LR
	
lcd_4b_write:					@ BL lcd_4b_write = write 4-bit itfc com
@ initial state of 4-bit itfc com pins
	LDR R5, [R0, #0x14]			@ R5 = GPIOA_ODR
	LDR R6, =0xFFFF6FFF			@ IOP[12,15] = 0
	ANDS R5, R5, R6				@ set GPIOA[12:15] = 0
	STR R5, [R0, #0x14]			@ store
	LDR R5, [R1, #0x14]			@ R5 = GPIOB_ODR
	LDR R6, =0xFFFFFCFF			@ IOP[8:9] = 0
	ANDS R5, R5, R6				@ set GPIOB[8:9] = 0
	STR R5, [R1, #0x14]			@ store
@ check bit & overwrite bit
@ PA15
	MOVS R6, #0b1000			@ check data in PA15
	ANDS R6, R6, R7				@ check 
	BEQ skip_1					@ equal: make PA15 high
	LDR R5, [R0, #0x14]
	LDR R6, =0x8000
	ORRS R5, R5, R6
	STR R5, [R0, #0x14]
	skip_1:
@ PA12
	MOVS R6, #0b0100			@ check data in PA12
	ANDS R6, R6, R7				@ check 
	BEQ skip_2					@ equal: make PA12 high 
	LDR R5, [R0, #0x14]
	LDR R6, =0x1000
	ORRS R5, R5, R6
	STR R5, [R0, #0x14]
	skip_2:
@ PB9
	MOVS R6, #0b0010			@ check data in PB9
	ANDS R6, R6, R7				@ check 
	BEQ skip_3					@ equal: make PB9 high 
	LDR R5, [R1, #0x14]
	LDR R6, =0x200
	ORRS R5, R5, R6
	STR R5, [R1, #0x14]
	skip_3:
@ PB8
	MOVS R6, #0b0001			@ check data in PB8
	ANDS R6, R6, R7				@ check 
	BEQ skip_4					@ equal: make PB8 high 
	LDR R5, [R1, #0x14]
	LDR R6, =0x100
	ORRS R5, R5, R6
	STR R5, [R1, #0x14]
	skip_4:
	BX LR
@-------------------------------------------------------------
	.align
RCC_BASE: .word 0x40021000
GPIOA_BASE: .word 0x48000000
GPIOB_BASE: .word 0x48000400
GPIOC_BASE: .word 0x48000800
ADC_BASE: .word 0x40012400
TIM6_BASE: .word 0x40001000
NVIC_ISER: .word 0xE000E100
RAM_START: .word 0x20000000

	.syntax unified
	.cpu cortex-m0
	.fpu softvfp
	.eabi_attribute 20, 1
	.eabi_attribute 21, 1
	.eabi_attribute 23, 3
	.eabi_attribute 24, 1
	.eabi_attribute 25, 1
	.eabi_attribute 26, 1
	.eabi_attribute 30, 6
	.eabi_attribute 34, 0
	.eabi_attribute 18, 4
	.thumb
	.syntax unified
	.file	"libs.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.global	btn0_previous_state
	.bss
	.align	2
	.type	btn0_previous_state, %object
	.size	btn0_previous_state, 4
btn0_previous_state:
	.space	4
	.global	btn1_previous_state
	.align	2
	.type	btn1_previous_state, %object
	.size	btn1_previous_state, 4
btn1_previous_state:
	.space	4
	.global	btn2_previous_state
	.align	2
	.type	btn2_previous_state, %object
	.size	btn2_previous_state, 4
btn2_previous_state:
	.space	4
	.global	btn3_previous_state
	.align	2
	.type	btn3_previous_state, %object
	.size	btn3_previous_state, 4
btn3_previous_state:
	.space	4
	.text
	.align	2
	.global	lib_init_leds
	.code	16
	.thumb_func
	.type	lib_init_leds, %function
lib_init_leds:
.LFB0:
	.file 1 "libs.c"
	.loc 1 14 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 16 0
	ldr	r3, .L2
	ldr	r2, .L2
	ldr	r2, [r2, #20]
	movs	r1, #128
	lsls	r1, r1, #11
	orrs	r2, r1
	str	r2, [r3, #20]
	.loc 1 18 0
	ldr	r3, .L2+4
	ldr	r2, .L2+8
	str	r2, [r3]
	.loc 1 19 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L3:
	.align	2
.L2:
	.word	1073876992
	.word	1207960576
	.word	21845
	.cfi_endproc
.LFE0:
	.size	lib_init_leds, .-lib_init_leds
	.align	2
	.global	lib_write_leds
	.code	16
	.thumb_func
	.type	lib_write_leds, %function
lib_write_leds:
.LFB1:
	.loc 1 21 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 23 0
	ldr	r2, .L5
	adds	r3, r7, #7
	ldrb	r3, [r3]
	uxth	r3, r3
	strh	r3, [r2, #20]
	.loc 1 24 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L6:
	.align	2
.L5:
	.word	1207960576
	.cfi_endproc
.LFE1:
	.size	lib_write_leds, .-lib_write_leds
	.align	2
	.global	lib_read_leds
	.code	16
	.thumb_func
	.type	lib_read_leds, %function
lib_read_leds:
.LFB2:
	.loc 1 26 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 29 0
	ldr	r3, .L9
	ldrh	r3, [r3, #20]
	uxth	r2, r3
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 30 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	.loc 1 31 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L10:
	.align	2
.L9:
	.word	1207960576
	.cfi_endproc
.LFE2:
	.size	lib_read_leds, .-lib_read_leds
	.align	2
	.global	lib_init_buttons
	.code	16
	.thumb_func
	.type	lib_init_buttons, %function
lib_init_buttons:
.LFB3:
	.loc 1 33 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 35 0
	ldr	r3, .L12
	ldr	r2, .L12
	ldr	r2, [r2, #20]
	movs	r1, #128
	lsls	r1, r1, #10
	orrs	r2, r1
	str	r2, [r3, #20]
	.loc 1 37 0
	movs	r3, #144
	lsls	r3, r3, #23
	movs	r2, #144
	lsls	r2, r2, #23
	ldr	r2, [r2, #12]
	movs	r1, #85
	orrs	r2, r1
	str	r2, [r3, #12]
	.loc 1 38 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L13:
	.align	2
.L12:
	.word	1073876992
	.cfi_endproc
.LFE3:
	.size	lib_init_buttons, .-lib_init_buttons
	.align	2
	.global	lib_read_button_0
	.code	16
	.thumb_func
	.type	lib_read_button_0, %function
lib_read_button_0:
.LFB4:
	.loc 1 40 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 42 0
	movs	r3, #144
	lsls	r3, r3, #23
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	movs	r2, r3
	movs	r3, #1
	ands	r3, r2
	bne	.L15
	.loc 1 44 0
	movs	r3, #1
	b	.L16
.L15:
	.loc 1 48 0
	movs	r3, #0
.L16:
	.loc 1 50 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE4:
	.size	lib_read_button_0, .-lib_read_button_0
	.align	2
	.global	lib_read_button_1
	.code	16
	.thumb_func
	.type	lib_read_button_1, %function
lib_read_button_1:
.LFB5:
	.loc 1 52 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 54 0
	movs	r3, #144
	lsls	r3, r3, #23
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	movs	r2, r3
	movs	r3, #2
	ands	r3, r2
	bne	.L18
	.loc 1 56 0
	movs	r3, #1
	b	.L19
.L18:
	.loc 1 60 0
	movs	r3, #0
.L19:
	.loc 1 62 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE5:
	.size	lib_read_button_1, .-lib_read_button_1
	.align	2
	.global	lib_read_button_2
	.code	16
	.thumb_func
	.type	lib_read_button_2, %function
lib_read_button_2:
.LFB6:
	.loc 1 64 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 66 0
	movs	r3, #144
	lsls	r3, r3, #23
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	movs	r2, r3
	movs	r3, #4
	ands	r3, r2
	bne	.L21
	.loc 1 68 0
	movs	r3, #1
	b	.L22
.L21:
	.loc 1 72 0
	movs	r3, #0
.L22:
	.loc 1 74 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE6:
	.size	lib_read_button_2, .-lib_read_button_2
	.align	2
	.global	lib_read_button_3
	.code	16
	.thumb_func
	.type	lib_read_button_3, %function
lib_read_button_3:
.LFB7:
	.loc 1 76 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 78 0
	movs	r3, #144
	lsls	r3, r3, #23
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	movs	r2, r3
	movs	r3, #8
	ands	r3, r2
	bne	.L24
	.loc 1 80 0
	movs	r3, #1
	b	.L25
.L24:
	.loc 1 84 0
	movs	r3, #0
.L25:
	.loc 1 86 0
	movs	r0, r3
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE7:
	.size	lib_read_button_3, .-lib_read_button_3
	.align	2
	.global	lib_read_falling_edge_button0
	.code	16
	.thumb_func
	.type	lib_read_falling_edge_button0, %function
lib_read_falling_edge_button0:
.LFB8:
	.loc 1 88 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 89 0
	bl	lib_read_button_0
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 1 91 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L29
	ldr	r3, [r3]
	rsbs	r1, r3, #0
	adcs	r3, r3, r1
	uxtb	r3, r3
	ands	r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L27
	.loc 1 92 0
	movs	r3, #1
	b	.L28
.L27:
	.loc 1 95 0
	ldr	r3, .L29
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 96 0
	movs	r3, #0
.L28:
	.loc 1 98 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L30:
	.align	2
.L29:
	.word	btn0_previous_state
	.cfi_endproc
.LFE8:
	.size	lib_read_falling_edge_button0, .-lib_read_falling_edge_button0
	.align	2
	.global	lib_read_falling_edge_button1
	.code	16
	.thumb_func
	.type	lib_read_falling_edge_button1, %function
lib_read_falling_edge_button1:
.LFB9:
	.loc 1 100 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 101 0
	bl	lib_read_button_1
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 1 103 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L34
	ldr	r3, [r3]
	rsbs	r1, r3, #0
	adcs	r3, r3, r1
	uxtb	r3, r3
	ands	r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L32
	.loc 1 104 0
	movs	r3, #1
	b	.L33
.L32:
	.loc 1 107 0
	ldr	r3, .L34
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 108 0
	movs	r3, #0
.L33:
	.loc 1 110 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L35:
	.align	2
.L34:
	.word	btn1_previous_state
	.cfi_endproc
.LFE9:
	.size	lib_read_falling_edge_button1, .-lib_read_falling_edge_button1
	.align	2
	.global	lib_read_falling_edge_button2
	.code	16
	.thumb_func
	.type	lib_read_falling_edge_button2, %function
lib_read_falling_edge_button2:
.LFB10:
	.loc 1 112 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 113 0
	bl	lib_read_button_2
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 1 115 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L39
	ldr	r3, [r3]
	rsbs	r1, r3, #0
	adcs	r3, r3, r1
	uxtb	r3, r3
	ands	r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L37
	.loc 1 116 0
	movs	r3, #1
	b	.L38
.L37:
	.loc 1 119 0
	ldr	r3, .L39+4
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 120 0
	movs	r3, #0
.L38:
	.loc 1 122 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L40:
	.align	2
.L39:
	.word	btn0_previous_state
	.word	btn2_previous_state
	.cfi_endproc
.LFE10:
	.size	lib_read_falling_edge_button2, .-lib_read_falling_edge_button2
	.align	2
	.global	lib_read_falling_edge_button3
	.code	16
	.thumb_func
	.type	lib_read_falling_edge_button3, %function
lib_read_falling_edge_button3:
.LFB11:
	.loc 1 124 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 125 0
	bl	lib_read_button_3
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 1 127 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L44
	ldr	r3, [r3]
	rsbs	r1, r3, #0
	adcs	r3, r3, r1
	uxtb	r3, r3
	ands	r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L42
	.loc 1 128 0
	movs	r3, #1
	b	.L43
.L42:
	.loc 1 131 0
	ldr	r3, .L44+4
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 132 0
	movs	r3, #0
.L43:
	.loc 1 134 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L45:
	.align	2
.L44:
	.word	btn0_previous_state
	.word	btn3_previous_state
	.cfi_endproc
.LFE11:
	.size	lib_read_falling_edge_button3, .-lib_read_falling_edge_button3
	.align	2
	.global	lib_init_adc_6bit
	.code	16
	.thumb_func
	.type	lib_init_adc_6bit, %function
lib_init_adc_6bit:
.LFB12:
	.loc 1 136 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 138 0
	ldr	r3, .L48
	ldr	r2, .L48
	ldr	r2, [r2, #24]
	movs	r1, #128
	lsls	r1, r1, #2
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 140 0
	ldr	r3, .L48+4
	ldr	r2, .L48+4
	ldr	r2, [r2, #12]
	movs	r1, #24
	orrs	r2, r1
	str	r2, [r3, #12]
	.loc 1 142 0
	ldr	r3, .L48+4
	ldr	r2, .L48+4
	ldr	r2, [r2, #8]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 145 0
	nop
.L47:
	.loc 1 145 0 is_stmt 0 discriminator 1
	ldr	r3, .L48+4
	ldr	r3, [r3]
	movs	r2, #1
	ands	r3, r2
	beq	.L47
	.loc 1 146 0 is_stmt 1
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L49:
	.align	2
.L48:
	.word	1073876992
	.word	1073816576
	.cfi_endproc
.LFE12:
	.size	lib_init_adc_6bit, .-lib_init_adc_6bit
	.align	2
	.global	lib_init_adc_8bit
	.code	16
	.thumb_func
	.type	lib_init_adc_8bit, %function
lib_init_adc_8bit:
.LFB13:
	.loc 1 148 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 150 0
	ldr	r3, .L52
	ldr	r2, .L52
	ldr	r2, [r2, #24]
	movs	r1, #128
	lsls	r1, r1, #2
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 152 0
	ldr	r3, .L52+4
	ldr	r2, .L52+4
	ldr	r2, [r2, #12]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3, #12]
	.loc 1 154 0
	ldr	r3, .L52+4
	ldr	r2, .L52+4
	ldr	r2, [r2, #8]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 157 0
	nop
.L51:
	.loc 1 157 0 is_stmt 0 discriminator 1
	ldr	r3, .L52+4
	ldr	r3, [r3]
	movs	r2, #1
	ands	r3, r2
	beq	.L51
	.loc 1 158 0 is_stmt 1
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L53:
	.align	2
.L52:
	.word	1073876992
	.word	1073816576
	.cfi_endproc
.LFE13:
	.size	lib_init_adc_8bit, .-lib_init_adc_8bit
	.align	2
	.global	lib_init_adc_10bit
	.code	16
	.thumb_func
	.type	lib_init_adc_10bit, %function
lib_init_adc_10bit:
.LFB14:
	.loc 1 160 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 162 0
	ldr	r3, .L56
	ldr	r2, .L56
	ldr	r2, [r2, #24]
	movs	r1, #128
	lsls	r1, r1, #2
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 164 0
	ldr	r3, .L56+4
	ldr	r2, .L56+4
	ldr	r2, [r2, #12]
	movs	r1, #8
	orrs	r2, r1
	str	r2, [r3, #12]
	.loc 1 166 0
	ldr	r3, .L56+4
	ldr	r2, .L56+4
	ldr	r2, [r2, #8]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 169 0
	nop
.L55:
	.loc 1 169 0 is_stmt 0 discriminator 1
	ldr	r3, .L56+4
	ldr	r3, [r3]
	movs	r2, #1
	ands	r3, r2
	beq	.L55
	.loc 1 170 0 is_stmt 1
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L57:
	.align	2
.L56:
	.word	1073876992
	.word	1073816576
	.cfi_endproc
.LFE14:
	.size	lib_init_adc_10bit, .-lib_init_adc_10bit
	.align	2
	.global	lib_init_adc_12bit
	.code	16
	.thumb_func
	.type	lib_init_adc_12bit, %function
lib_init_adc_12bit:
.LFB15:
	.loc 1 172 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 174 0
	ldr	r3, .L60
	ldr	r2, .L60
	ldr	r2, [r2, #24]
	movs	r1, #128
	lsls	r1, r1, #2
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 176 0
	ldr	r3, .L60+4
	ldr	r2, .L60+4
	ldr	r2, [r2, #12]
	str	r2, [r3, #12]
	.loc 1 178 0
	ldr	r3, .L60+4
	ldr	r2, .L60+4
	ldr	r2, [r2, #8]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 181 0
	nop
.L59:
	.loc 1 181 0 is_stmt 0 discriminator 1
	ldr	r3, .L60+4
	ldr	r3, [r3]
	movs	r2, #1
	ands	r3, r2
	beq	.L59
	.loc 1 182 0 is_stmt 1
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L61:
	.align	2
.L60:
	.word	1073876992
	.word	1073816576
	.cfi_endproc
.LFE15:
	.size	lib_init_adc_12bit, .-lib_init_adc_12bit
	.align	2
	.global	lib_adc_cal
	.code	16
	.thumb_func
	.type	lib_adc_cal, %function
lib_adc_cal:
.LFB16:
	.loc 1 184 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 185 0
	ldr	r3, .L63
	movs	r2, #128
	lsls	r2, r2, #24
	str	r2, [r3, #8]
	.loc 1 186 0
	nop
	ldr	r3, .L63
	ldr	r3, [r3, #8]
	.loc 1 187 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L64:
	.align	2
.L63:
	.word	1073816576
	.cfi_endproc
.LFE16:
	.size	lib_adc_cal, .-lib_adc_cal
	.align	2
	.global	lib_init_pot0
	.code	16
	.thumb_func
	.type	lib_init_pot0, %function
lib_init_pot0:
.LFB17:
	.loc 1 189 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 190 0
	movs	r3, #144
	lsls	r3, r3, #23
	movs	r2, #144
	lsls	r2, r2, #23
	ldr	r2, [r2]
	movs	r1, #192
	lsls	r1, r1, #4
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 191 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE17:
	.size	lib_init_pot0, .-lib_init_pot0
	.align	2
	.global	lib_init_pot1
	.code	16
	.thumb_func
	.type	lib_init_pot1, %function
lib_init_pot1:
.LFB18:
	.loc 1 193 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 194 0
	movs	r3, #144
	lsls	r3, r3, #23
	movs	r2, #144
	lsls	r2, r2, #23
	ldr	r2, [r2]
	movs	r1, #192
	lsls	r1, r1, #6
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 195 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE18:
	.size	lib_init_pot1, .-lib_init_pot1
	.align	2
	.global	lib_read_pot0
	.code	16
	.thumb_func
	.type	lib_read_pot0, %function
lib_read_pot0:
.LFB19:
	.loc 1 197 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 201 0
	ldr	r3, .L70
	movs	r2, #32
	str	r2, [r3, #40]
	.loc 1 203 0
	ldr	r3, .L70
	ldr	r2, .L70
	ldr	r2, [r2, #8]
	movs	r1, #4
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 205 0
	nop
.L68:
	.loc 1 205 0 is_stmt 0 discriminator 1
	ldr	r3, .L70
	ldr	r3, [r3]
	movs	r2, #4
	ands	r3, r2
	beq	.L68
	.loc 1 207 0 is_stmt 1
	ldr	r3, .L70
	ldr	r2, [r3, #64]
	adds	r3, r7, #6
	strh	r2, [r3]
	.loc 1 209 0
	adds	r3, r7, #6
	ldrh	r3, [r3]
	uxtb	r3, r3
	.loc 1 210 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L71:
	.align	2
.L70:
	.word	1073816576
	.cfi_endproc
.LFE19:
	.size	lib_read_pot0, .-lib_read_pot0
	.align	2
	.global	lib_read_pot1
	.code	16
	.thumb_func
	.type	lib_read_pot1, %function
lib_read_pot1:
.LFB20:
	.loc 1 212 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 216 0
	ldr	r3, .L75
	movs	r2, #64
	str	r2, [r3, #40]
	.loc 1 218 0
	ldr	r3, .L75
	ldr	r2, .L75
	ldr	r2, [r2, #8]
	movs	r1, #4
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 220 0
	nop
.L73:
	.loc 1 220 0 is_stmt 0 discriminator 1
	ldr	r3, .L75
	ldr	r3, [r3]
	movs	r2, #4
	ands	r3, r2
	beq	.L73
	.loc 1 222 0 is_stmt 1
	ldr	r3, .L75
	ldr	r2, [r3, #64]
	adds	r3, r7, #6
	strh	r2, [r3]
	.loc 1 224 0
	adds	r3, r7, #6
	ldrh	r3, [r3]
	uxtb	r3, r3
	.loc 1 225 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L76:
	.align	2
.L75:
	.word	1073816576
	.cfi_endproc
.LFE20:
	.size	lib_read_pot1, .-lib_read_pot1
	.align	2
	.global	lib_init_TIM6
	.code	16
	.thumb_func
	.type	lib_init_TIM6, %function
lib_init_TIM6:
.LFB21:
	.loc 1 227 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	str	r1, [r7]
	.loc 1 229 0
	ldr	r3, .L78
	ldr	r2, .L78
	ldr	r2, [r2, #28]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3, #28]
	.loc 1 231 0
	ldr	r3, .L78+4
	ldr	r2, [r7, #4]
	uxth	r2, r2
	strh	r2, [r3, #40]
	.loc 1 233 0
	ldr	r3, .L78+4
	ldr	r2, [r7]
	str	r2, [r3, #44]
	.loc 1 235 0
	ldr	r2, .L78+4
	ldr	r3, .L78+4
	ldrh	r3, [r3, #12]
	uxth	r3, r3
	movs	r1, #1
	orrs	r3, r1
	uxth	r3, r3
	strh	r3, [r2, #12]
	.loc 1 237 0
	ldr	r2, .L78+4
	ldr	r3, .L78+4
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r1, #1
	orrs	r3, r1
	uxth	r3, r3
	strh	r3, [r2]
	.loc 1 239 0
	ldr	r2, .L78+4
	ldr	r3, .L78+4
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r1, #128
	orrs	r3, r1
	uxth	r3, r3
	strh	r3, [r2]
	.loc 1 241 0
	ldr	r3, .L78+8
	ldr	r2, .L78+8
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #10
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 242 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L79:
	.align	2
.L78:
	.word	1073876992
	.word	1073745920
	.word	-536813312
	.cfi_endproc
.LFE21:
	.size	lib_init_TIM6, .-lib_init_TIM6
	.align	2
	.global	lib_TIM6_update_ARR
	.code	16
	.thumb_func
	.type	lib_TIM6_update_ARR, %function
lib_TIM6_update_ARR:
.LFB22:
	.loc 1 244 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 245 0
	ldr	r3, .L81
	ldr	r2, [r7, #4]
	str	r2, [r3, #44]
	.loc 1 246 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L82:
	.align	2
.L81:
	.word	1073745920
	.cfi_endproc
.LFE22:
	.size	lib_TIM6_update_ARR, .-lib_TIM6_update_ARR
	.align	2
	.global	lib_TIM6_update_PSC
	.code	16
	.thumb_func
	.type	lib_TIM6_update_PSC, %function
lib_TIM6_update_PSC:
.LFB23:
	.loc 1 248 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 249 0
	ldr	r3, .L84
	ldr	r2, [r7, #4]
	uxth	r2, r2
	strh	r2, [r3, #40]
	.loc 1 250 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L85:
	.align	2
.L84:
	.word	1073745920
	.cfi_endproc
.LFE23:
	.size	lib_TIM6_update_PSC, .-lib_TIM6_update_PSC
	.align	2
	.global	lib_TIM6_ACK
	.code	16
	.thumb_func
	.type	lib_TIM6_ACK, %function
lib_TIM6_ACK:
.LFB24:
	.loc 1 252 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 253 0
	ldr	r2, .L87
	ldr	r3, .L87
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	movs	r1, #1
	bics	r3, r1
	uxth	r3, r3
	strh	r3, [r2, #16]
	.loc 1 254 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L88:
	.align	2
.L87:
	.word	1073745920
	.cfi_endproc
.LFE24:
	.size	lib_TIM6_ACK, .-lib_TIM6_ACK
	.align	2
	.global	delay_ms
	.code	16
	.thumb_func
	.type	delay_ms, %function
delay_ms:
.LFB25:
	.loc 1 256 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 258 0
	ldr	r3, [r7, #4]
	ldr	r2, .L92
	muls	r3, r2
	str	r3, [r7, #12]
	.loc 1 259 0
	b	.L90
.L91:
	.loc 1 260 0
	ldr	r3, [r7, #12]
	subs	r3, r3, #1
	str	r3, [r7, #12]
.L90:
	.loc 1 259 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bgt	.L91
	.loc 1 262 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L93:
	.align	2
.L92:
	.word	735
	.cfi_endproc
.LFE25:
	.size	delay_ms, .-delay_ms
	.align	2
	.global	delay_us
	.code	16
	.thumb_func
	.type	delay_us, %function
delay_us:
.LFB26:
	.loc 1 264 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #16
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #4]
	.loc 1 266 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 268 0
	b	.L95
.L96:
	.loc 1 269 0 discriminator 2
	.syntax divided
@ 269 "libs.c" 1
	NOP
@ 0 "" 2
	.loc 1 268 0 discriminator 2
	.thumb
	.syntax unified
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L95:
	.loc 1 268 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcc	.L96
	.loc 1 271 0 is_stmt 1
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE26:
	.size	delay_us, .-delay_us
	.align	2
	.global	libs_quicksort
	.code	16
	.thumb_func
	.type	libs_quicksort, %function
libs_quicksort:
.LFB27:
	.loc 1 283 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #24
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 284 0
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcs	.L99
.LBB2:
	.loc 1 285 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	partition
	movs	r3, r0
	str	r3, [r7, #20]
	.loc 1 286 0
	ldr	r3, [r7, #20]
	subs	r2, r3, #1
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	libs_quicksort
	.loc 1 287 0
	ldr	r3, [r7, #20]
	adds	r1, r3, #1
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	libs_quicksort
.L99:
.LBE2:
	.loc 1 289 0
	nop
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE27:
	.size	libs_quicksort, .-libs_quicksort
	.align	2
	.global	partition
	.code	16
	.thumb_func
	.type	partition, %function
partition:
.LFB28:
	.loc 1 292 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #40
	.cfi_def_cfa_offset 48
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	str	r0, [r7, #12]
	str	r1, [r7, #8]
	str	r2, [r7, #4]
	.loc 1 293 0
	ldr	r3, [r7, #4]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #28]
	.loc 1 294 0
	ldr	r3, [r7, #8]
	str	r3, [r7, #36]
	.loc 1 296 0
	ldr	r3, [r7, #8]
	str	r3, [r7, #32]
	b	.L101
.L103:
	.loc 1 297 0
	ldr	r3, [r7, #32]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [r7, #28]
	cmp	r2, r3
	bgt	.L102
.LBB3:
	.loc 1 298 0
	ldr	r3, [r7, #36]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #24]
	.loc 1 299 0
	ldr	r3, [r7, #36]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r2, [r7, #32]
	lsls	r2, r2, #2
	ldr	r1, [r7, #12]
	adds	r2, r1, r2
	ldr	r2, [r2]
	str	r2, [r3]
	.loc 1 300 0
	ldr	r3, [r7, #32]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r2, [r7, #24]
	str	r2, [r3]
	.loc 1 301 0
	ldr	r3, [r7, #36]
	adds	r3, r3, #1
	str	r3, [r7, #36]
.L102:
.LBE3:
	.loc 1 296 0 discriminator 2
	ldr	r3, [r7, #32]
	adds	r3, r3, #1
	str	r3, [r7, #32]
.L101:
	.loc 1 296 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	subs	r2, r3, #1
	ldr	r3, [r7, #32]
	cmp	r2, r3
	bhi	.L103
	.loc 1 304 0 is_stmt 1
	ldr	r3, [r7, #36]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #20]
	.loc 1 305 0
	ldr	r3, [r7, #36]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r2, [r7, #4]
	lsls	r2, r2, #2
	ldr	r1, [r7, #12]
	adds	r2, r1, r2
	ldr	r2, [r2]
	str	r2, [r3]
	.loc 1 306 0
	ldr	r3, [r7, #4]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r2, [r7, #20]
	str	r2, [r3]
	.loc 1 307 0
	ldr	r3, [r7, #36]
	.loc 1 308 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #40
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE28:
	.size	partition, .-partition
.Letext0:
	.file 2 "c:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "c:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x985
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF111
	.byte	0xc
	.4byte	.LASF112
	.4byte	.LASF113
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF3
	.byte	0x2
	.byte	0x1d
	.4byte	0x37
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF4
	.byte	0x2
	.byte	0x2b
	.4byte	0x50
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x3f
	.4byte	0x62
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF7
	.uleb128 0x3
	.4byte	.LASF8
	.byte	0x2
	.byte	0x41
	.4byte	0x74
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF10
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x14
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x1a
	.4byte	0x45
	.uleb128 0x3
	.4byte	.LASF15
	.byte	0x3
	.byte	0x1f
	.4byte	0x57
	.uleb128 0x3
	.4byte	.LASF16
	.byte	0x3
	.byte	0x20
	.4byte	0x69
	.uleb128 0x5
	.byte	0x44
	.byte	0x4
	.2byte	0x1f7
	.4byte	0x173
	.uleb128 0x6
	.ascii	"ISR\000"
	.byte	0x4
	.2byte	0x1f9
	.4byte	0x173
	.byte	0
	.uleb128 0x6
	.ascii	"IER\000"
	.byte	0x4
	.2byte	0x1fa
	.4byte	0x173
	.byte	0x4
	.uleb128 0x6
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x1fb
	.4byte	0x173
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x1fc
	.4byte	0x173
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x1fd
	.4byte	0x173
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x1fe
	.4byte	0x173
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x1ff
	.4byte	0xb8
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x200
	.4byte	0xb8
	.byte	0x1c
	.uleb128 0x6
	.ascii	"TR\000"
	.byte	0x4
	.2byte	0x201
	.4byte	0x173
	.byte	0x20
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x202
	.4byte	0xb8
	.byte	0x24
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x203
	.4byte	0x173
	.byte	0x28
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x204
	.4byte	0x178
	.byte	0x2c
	.uleb128 0x6
	.ascii	"DR\000"
	.byte	0x4
	.2byte	0x205
	.4byte	0x173
	.byte	0x40
	.byte	0
	.uleb128 0x8
	.4byte	0xb8
	.uleb128 0x9
	.4byte	0xb8
	.4byte	0x188
	.uleb128 0xa
	.4byte	0x188
	.byte	0x4
	.byte	0
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF25
	.uleb128 0xb
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x206
	.4byte	0xc3
	.uleb128 0x8
	.4byte	0xa2
	.uleb128 0x5
	.byte	0x2c
	.byte	0x4
	.2byte	0x2e6
	.4byte	0x260
	.uleb128 0x7
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x2e8
	.4byte	0x173
	.byte	0
	.uleb128 0x7
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x2e9
	.4byte	0x19b
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x2ea
	.4byte	0xa2
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x2eb
	.4byte	0x173
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x2ec
	.4byte	0x173
	.byte	0xc
	.uleb128 0x6
	.ascii	"IDR\000"
	.byte	0x4
	.2byte	0x2ed
	.4byte	0x19b
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x2ee
	.4byte	0xa2
	.byte	0x12
	.uleb128 0x6
	.ascii	"ODR\000"
	.byte	0x4
	.2byte	0x2ef
	.4byte	0x19b
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x2f0
	.4byte	0xa2
	.byte	0x16
	.uleb128 0x7
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x2f1
	.4byte	0x173
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x2f2
	.4byte	0x173
	.byte	0x1c
	.uleb128 0x6
	.ascii	"AFR\000"
	.byte	0x4
	.2byte	0x2f3
	.4byte	0x270
	.byte	0x20
	.uleb128 0x6
	.ascii	"BRR\000"
	.byte	0x4
	.2byte	0x2f4
	.4byte	0x19b
	.byte	0x28
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x2f5
	.4byte	0xa2
	.byte	0x2a
	.byte	0
	.uleb128 0x9
	.4byte	0xb8
	.4byte	0x270
	.uleb128 0xa
	.4byte	0x188
	.byte	0x1
	.byte	0
	.uleb128 0x8
	.4byte	0x260
	.uleb128 0xb
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x2f6
	.4byte	0x1a0
	.uleb128 0x5
	.byte	0x38
	.byte	0x4
	.2byte	0x335
	.4byte	0x340
	.uleb128 0x6
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x337
	.4byte	0x173
	.byte	0
	.uleb128 0x7
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x338
	.4byte	0x173
	.byte	0x4
	.uleb128 0x6
	.ascii	"CIR\000"
	.byte	0x4
	.2byte	0x339
	.4byte	0x173
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF36
	.byte	0x4
	.2byte	0x33a
	.4byte	0x173
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF37
	.byte	0x4
	.2byte	0x33b
	.4byte	0x173
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x33c
	.4byte	0x173
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x33d
	.4byte	0x173
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x33e
	.4byte	0x173
	.byte	0x1c
	.uleb128 0x7
	.4byte	.LASF41
	.byte	0x4
	.2byte	0x33f
	.4byte	0x173
	.byte	0x20
	.uleb128 0x6
	.ascii	"CSR\000"
	.byte	0x4
	.2byte	0x340
	.4byte	0x173
	.byte	0x24
	.uleb128 0x7
	.4byte	.LASF42
	.byte	0x4
	.2byte	0x341
	.4byte	0x173
	.byte	0x28
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x342
	.4byte	0x173
	.byte	0x2c
	.uleb128 0x7
	.4byte	.LASF43
	.byte	0x4
	.2byte	0x343
	.4byte	0x173
	.byte	0x30
	.uleb128 0x6
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x344
	.4byte	0x173
	.byte	0x34
	.byte	0
	.uleb128 0xb
	.4byte	.LASF44
	.byte	0x4
	.2byte	0x345
	.4byte	0x281
	.uleb128 0x5
	.byte	0x54
	.byte	0x4
	.2byte	0x389
	.4byte	0x528
	.uleb128 0x6
	.ascii	"CR1\000"
	.byte	0x4
	.2byte	0x38b
	.4byte	0x19b
	.byte	0
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x38c
	.4byte	0xa2
	.byte	0x2
	.uleb128 0x6
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x38d
	.4byte	0x19b
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x38e
	.4byte	0xa2
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF45
	.byte	0x4
	.2byte	0x38f
	.4byte	0x19b
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x390
	.4byte	0xa2
	.byte	0xa
	.uleb128 0x7
	.4byte	.LASF46
	.byte	0x4
	.2byte	0x391
	.4byte	0x19b
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x392
	.4byte	0xa2
	.byte	0xe
	.uleb128 0x6
	.ascii	"SR\000"
	.byte	0x4
	.2byte	0x393
	.4byte	0x19b
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x394
	.4byte	0xa2
	.byte	0x12
	.uleb128 0x6
	.ascii	"EGR\000"
	.byte	0x4
	.2byte	0x395
	.4byte	0x19b
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF47
	.byte	0x4
	.2byte	0x396
	.4byte	0xa2
	.byte	0x16
	.uleb128 0x7
	.4byte	.LASF48
	.byte	0x4
	.2byte	0x397
	.4byte	0x19b
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF49
	.byte	0x4
	.2byte	0x398
	.4byte	0xa2
	.byte	0x1a
	.uleb128 0x7
	.4byte	.LASF50
	.byte	0x4
	.2byte	0x399
	.4byte	0x19b
	.byte	0x1c
	.uleb128 0x7
	.4byte	.LASF51
	.byte	0x4
	.2byte	0x39a
	.4byte	0xa2
	.byte	0x1e
	.uleb128 0x7
	.4byte	.LASF52
	.byte	0x4
	.2byte	0x39b
	.4byte	0x19b
	.byte	0x20
	.uleb128 0x7
	.4byte	.LASF53
	.byte	0x4
	.2byte	0x39c
	.4byte	0xa2
	.byte	0x22
	.uleb128 0x6
	.ascii	"CNT\000"
	.byte	0x4
	.2byte	0x39d
	.4byte	0x173
	.byte	0x24
	.uleb128 0x6
	.ascii	"PSC\000"
	.byte	0x4
	.2byte	0x39e
	.4byte	0x19b
	.byte	0x28
	.uleb128 0x7
	.4byte	.LASF54
	.byte	0x4
	.2byte	0x39f
	.4byte	0xa2
	.byte	0x2a
	.uleb128 0x6
	.ascii	"ARR\000"
	.byte	0x4
	.2byte	0x3a0
	.4byte	0x173
	.byte	0x2c
	.uleb128 0x6
	.ascii	"RCR\000"
	.byte	0x4
	.2byte	0x3a1
	.4byte	0x19b
	.byte	0x30
	.uleb128 0x7
	.4byte	.LASF55
	.byte	0x4
	.2byte	0x3a2
	.4byte	0xa2
	.byte	0x32
	.uleb128 0x7
	.4byte	.LASF56
	.byte	0x4
	.2byte	0x3a3
	.4byte	0x173
	.byte	0x34
	.uleb128 0x7
	.4byte	.LASF57
	.byte	0x4
	.2byte	0x3a4
	.4byte	0x173
	.byte	0x38
	.uleb128 0x7
	.4byte	.LASF58
	.byte	0x4
	.2byte	0x3a5
	.4byte	0x173
	.byte	0x3c
	.uleb128 0x7
	.4byte	.LASF59
	.byte	0x4
	.2byte	0x3a6
	.4byte	0x173
	.byte	0x40
	.uleb128 0x7
	.4byte	.LASF60
	.byte	0x4
	.2byte	0x3a7
	.4byte	0x19b
	.byte	0x44
	.uleb128 0x7
	.4byte	.LASF61
	.byte	0x4
	.2byte	0x3a8
	.4byte	0xa2
	.byte	0x46
	.uleb128 0x6
	.ascii	"DCR\000"
	.byte	0x4
	.2byte	0x3a9
	.4byte	0x19b
	.byte	0x48
	.uleb128 0x7
	.4byte	.LASF62
	.byte	0x4
	.2byte	0x3aa
	.4byte	0xa2
	.byte	0x4a
	.uleb128 0x7
	.4byte	.LASF63
	.byte	0x4
	.2byte	0x3ab
	.4byte	0x19b
	.byte	0x4c
	.uleb128 0x7
	.4byte	.LASF64
	.byte	0x4
	.2byte	0x3ac
	.4byte	0xa2
	.byte	0x4e
	.uleb128 0x6
	.ascii	"OR\000"
	.byte	0x4
	.2byte	0x3ad
	.4byte	0x19b
	.byte	0x50
	.uleb128 0x7
	.4byte	.LASF65
	.byte	0x4
	.2byte	0x3ae
	.4byte	0xa2
	.byte	0x52
	.byte	0
	.uleb128 0xb
	.4byte	.LASF66
	.byte	0x4
	.2byte	0x3af
	.4byte	0x34c
	.uleb128 0xc
	.4byte	.LASF67
	.byte	0x1
	.byte	0xe
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF91
	.byte	0x1
	.byte	0x15
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x569
	.uleb128 0xe
	.4byte	.LASF93
	.byte	0x1
	.byte	0x15
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xf
	.4byte	.LASF73
	.byte	0x1
	.byte	0x1a
	.4byte	0x97
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x591
	.uleb128 0x10
	.4byte	.LASF75
	.byte	0x1
	.byte	0x1c
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xc
	.4byte	.LASF68
	.byte	0x1
	.byte	0x21
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF69
	.byte	0x1
	.byte	0x28
	.4byte	0x89
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF70
	.byte	0x1
	.byte	0x34
	.4byte	0x89
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF71
	.byte	0x1
	.byte	0x40
	.4byte	0x89
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF72
	.byte	0x1
	.byte	0x4c
	.4byte	0x89
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF74
	.byte	0x1
	.byte	0x58
	.4byte	0x89
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x61e
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.byte	0x59
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF77
	.byte	0x1
	.byte	0x64
	.4byte	0x89
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x646
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.byte	0x65
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF78
	.byte	0x1
	.byte	0x70
	.4byte	0x89
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x66e
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.byte	0x71
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF79
	.byte	0x1
	.byte	0x7c
	.4byte	0x89
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x696
	.uleb128 0x10
	.4byte	.LASF76
	.byte	0x1
	.byte	0x7d
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.4byte	.LASF80
	.byte	0x1
	.byte	0x88
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF81
	.byte	0x1
	.byte	0x94
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF82
	.byte	0x1
	.byte	0xa0
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF83
	.byte	0x1
	.byte	0xac
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF84
	.byte	0x1
	.byte	0xb8
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF85
	.byte	0x1
	.byte	0xbd
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF86
	.byte	0x1
	.byte	0xc1
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF87
	.byte	0x1
	.byte	0xc5
	.4byte	0x97
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x735
	.uleb128 0x10
	.4byte	.LASF88
	.byte	0x1
	.byte	0xc7
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0xf
	.4byte	.LASF89
	.byte	0x1
	.byte	0xd4
	.4byte	0x97
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x75d
	.uleb128 0x10
	.4byte	.LASF90
	.byte	0x1
	.byte	0xd6
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0xd
	.4byte	.LASF92
	.byte	0x1
	.byte	0xe3
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x78f
	.uleb128 0xe
	.4byte	.LASF94
	.byte	0x1
	.byte	0xe3
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x13
	.ascii	"arr\000"
	.byte	0x1
	.byte	0xe3
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0xd
	.4byte	.LASF95
	.byte	0x1
	.byte	0xf4
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7b3
	.uleb128 0x13
	.ascii	"arr\000"
	.byte	0x1
	.byte	0xf4
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xd
	.4byte	.LASF96
	.byte	0x1
	.byte	0xf8
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7d7
	.uleb128 0x13
	.ascii	"psc\000"
	.byte	0x1
	.byte	0xf8
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.4byte	.LASF97
	.byte	0x1
	.byte	0xfc
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x14
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x100
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x81d
	.uleb128 0x15
	.4byte	.LASF99
	.byte	0x1
	.2byte	0x100
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x102
	.4byte	0x89
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x14
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x108
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x852
	.uleb128 0x15
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x108
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x16
	.4byte	.LASF102
	.byte	0x1
	.2byte	0x10a
	.4byte	0x173
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x17
	.4byte	.LASF103
	.byte	0x1
	.2byte	0x11b
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8a9
	.uleb128 0x18
	.ascii	"a\000"
	.byte	0x1
	.2byte	0x11b
	.4byte	0x8a9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x18
	.ascii	"lo\000"
	.byte	0x1
	.2byte	0x11b
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x18
	.ascii	"hi\000"
	.byte	0x1
	.2byte	0x11b
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x1a
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x11d
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x1b
	.byte	0x4
	.4byte	0xad
	.uleb128 0x1c
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x124
	.4byte	0xb8
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x944
	.uleb128 0x18
	.ascii	"a\000"
	.byte	0x1
	.2byte	0x124
	.4byte	0x8a9
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x18
	.ascii	"lo\000"
	.byte	0x1
	.2byte	0x124
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x18
	.ascii	"hi\000"
	.byte	0x1
	.2byte	0x124
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x16
	.4byte	.LASF105
	.byte	0x1
	.2byte	0x125
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x1a
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x126
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x1a
	.ascii	"j\000"
	.byte	0x1
	.2byte	0x127
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x130
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x19
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x1a
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x12a
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF107
	.byte	0x1
	.byte	0x9
	.4byte	0x89
	.uleb128 0x5
	.byte	0x3
	.4byte	btn0_previous_state
	.uleb128 0x1d
	.4byte	.LASF108
	.byte	0x1
	.byte	0xa
	.4byte	0x89
	.uleb128 0x5
	.byte	0x3
	.4byte	btn1_previous_state
	.uleb128 0x1d
	.4byte	.LASF109
	.byte	0x1
	.byte	0xb
	.4byte	0x89
	.uleb128 0x5
	.byte	0x3
	.4byte	btn2_previous_state
	.uleb128 0x1d
	.4byte	.LASF110
	.byte	0x1
	.byte	0xc
	.4byte	0x89
	.uleb128 0x5
	.byte	0x3
	.4byte	btn3_previous_state
	.byte	0
	.section	.debug_abbrev,"",%progbits
.Ldebug_abbrev0:
	.uleb128 0x1
	.uleb128 0x11
	.byte	0x1
	.uleb128 0x25
	.uleb128 0xe
	.uleb128 0x13
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x1b
	.uleb128 0xe
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x10
	.uleb128 0x17
	.byte	0
	.byte	0
	.uleb128 0x2
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0xe
	.byte	0
	.byte	0
	.uleb128 0x3
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x4
	.uleb128 0x24
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3e
	.uleb128 0xb
	.uleb128 0x3
	.uleb128 0x8
	.byte	0
	.byte	0
	.uleb128 0x5
	.uleb128 0x13
	.byte	0x1
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x7
	.uleb128 0xd
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x38
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0x8
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xa
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x16
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xc
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0xd
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xe
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0xf
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x10
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x11
	.uleb128 0x2e
	.byte	0
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x12
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x14
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x15
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x16
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x17
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2116
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x18
	.uleb128 0x5
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x19
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x1a
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0x8
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.uleb128 0x1b
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1c
	.uleb128 0x2e
	.byte	0x1
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0x5
	.uleb128 0x27
	.uleb128 0x19
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.uleb128 0x40
	.uleb128 0x18
	.uleb128 0x2117
	.uleb128 0x19
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1d
	.uleb128 0x34
	.byte	0
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x3f
	.uleb128 0x19
	.uleb128 0x2
	.uleb128 0x18
	.byte	0
	.byte	0
	.byte	0
	.section	.debug_aranges,"",%progbits
	.4byte	0x1c
	.2byte	0x2
	.4byte	.Ldebug_info0
	.byte	0x4
	.byte	0
	.2byte	0
	.2byte	0
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	0
	.4byte	0
	.section	.debug_line,"",%progbits
.Ldebug_line0:
	.section	.debug_str,"MS",%progbits,1
.LASF99:
	.ascii	"count\000"
.LASF31:
	.ascii	"PUPDR\000"
.LASF33:
	.ascii	"LCKR\000"
.LASF46:
	.ascii	"DIER\000"
.LASF92:
	.ascii	"lib_init_TIM6\000"
.LASF28:
	.ascii	"OTYPER\000"
.LASF3:
	.ascii	"__uint8_t\000"
.LASF66:
	.ascii	"TIM_TypeDef\000"
.LASF27:
	.ascii	"MODER\000"
.LASF11:
	.ascii	"long long unsigned int\000"
.LASF19:
	.ascii	"SMPR\000"
.LASF60:
	.ascii	"BDTR\000"
.LASF106:
	.ascii	"tmp2\000"
.LASF48:
	.ascii	"CCMR1\000"
.LASF50:
	.ascii	"CCMR2\000"
.LASF10:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF96:
	.ascii	"lib_TIM6_update_PSC\000"
.LASF32:
	.ascii	"BSRR\000"
.LASF54:
	.ascii	"RESERVED10\000"
.LASF55:
	.ascii	"RESERVED12\000"
.LASF61:
	.ascii	"RESERVED17\000"
.LASF62:
	.ascii	"RESERVED18\000"
.LASF64:
	.ascii	"RESERVED19\000"
.LASF7:
	.ascii	"long int\000"
.LASF112:
	.ascii	"libs.c\000"
.LASF36:
	.ascii	"APB2RSTR\000"
.LASF90:
	.ascii	"pot1_value\000"
.LASF52:
	.ascii	"CCER\000"
.LASF85:
	.ascii	"lib_init_pot0\000"
.LASF86:
	.ascii	"lib_init_pot1\000"
.LASF14:
	.ascii	"uint16_t\000"
.LASF26:
	.ascii	"ADC_TypeDef\000"
.LASF93:
	.ascii	"led_val\000"
.LASF81:
	.ascii	"lib_init_adc_8bit\000"
.LASF30:
	.ascii	"OSPEEDR\000"
.LASF8:
	.ascii	"__uint32_t\000"
.LASF65:
	.ascii	"RESERVED20\000"
.LASF75:
	.ascii	"value\000"
.LASF83:
	.ascii	"lib_init_adc_12bit\000"
.LASF12:
	.ascii	"unsigned int\000"
.LASF9:
	.ascii	"long unsigned int\000"
.LASF34:
	.ascii	"GPIO_TypeDef\000"
.LASF74:
	.ascii	"lib_read_falling_edge_button0\000"
.LASF77:
	.ascii	"lib_read_falling_edge_button1\000"
.LASF78:
	.ascii	"lib_read_falling_edge_button2\000"
.LASF44:
	.ascii	"RCC_TypeDef\000"
.LASF68:
	.ascii	"lib_init_buttons\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF23:
	.ascii	"CHSELR\000"
.LASF87:
	.ascii	"lib_read_pot0\000"
.LASF89:
	.ascii	"lib_read_pot1\000"
.LASF110:
	.ascii	"btn3_previous_state\000"
.LASF88:
	.ascii	"pot0_value\000"
.LASF108:
	.ascii	"btn1_previous_state\000"
.LASF76:
	.ascii	"current_state\000"
.LASF80:
	.ascii	"lib_init_adc_6bit\000"
.LASF67:
	.ascii	"lib_init_leds\000"
.LASF25:
	.ascii	"sizetype\000"
.LASF82:
	.ascii	"lib_init_adc_10bit\000"
.LASF104:
	.ascii	"partition\000"
.LASF42:
	.ascii	"AHBRSTR\000"
.LASF37:
	.ascii	"APB1RSTR\000"
.LASF63:
	.ascii	"DMAR\000"
.LASF91:
	.ascii	"lib_write_leds\000"
.LASF94:
	.ascii	"prescaler\000"
.LASF29:
	.ascii	"RESERVED0\000"
.LASF20:
	.ascii	"RESERVED1\000"
.LASF21:
	.ascii	"RESERVED2\000"
.LASF113:
	.ascii	"C:\\Users\\Dillon\\Documents\\Engineering\\Universi"
	.ascii	"ty\\2016\\2nd Semester\\Micros\\Projects\\C libs\\C"
	.ascii	" Libs test\000"
.LASF24:
	.ascii	"RESERVED4\000"
.LASF47:
	.ascii	"RESERVED5\000"
.LASF49:
	.ascii	"RESERVED6\000"
.LASF51:
	.ascii	"RESERVED7\000"
.LASF53:
	.ascii	"RESERVED8\000"
.LASF97:
	.ascii	"lib_TIM6_ACK\000"
.LASF15:
	.ascii	"int32_t\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF107:
	.ascii	"btn0_previous_state\000"
.LASF100:
	.ascii	"delay\000"
.LASF79:
	.ascii	"lib_read_falling_edge_button3\000"
.LASF2:
	.ascii	"short int\000"
.LASF102:
	.ascii	"counter\000"
.LASF111:
	.ascii	"GNU C11 5.2.1 20151202 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 231848] -mthumb -mcpu=cortex-m0 -g\000"
.LASF73:
	.ascii	"lib_read_leds\000"
.LASF39:
	.ascii	"APB2ENR\000"
.LASF22:
	.ascii	"RESERVED3\000"
.LASF98:
	.ascii	"delay_ms\000"
.LASF16:
	.ascii	"uint32_t\000"
.LASF95:
	.ascii	"lib_TIM6_update_ARR\000"
.LASF45:
	.ascii	"SMCR\000"
.LASF4:
	.ascii	"__uint16_t\000"
.LASF101:
	.ascii	"delay_us\000"
.LASF105:
	.ascii	"pivot\000"
.LASF6:
	.ascii	"__int32_t\000"
.LASF40:
	.ascii	"APB1ENR\000"
.LASF56:
	.ascii	"CCR1\000"
.LASF57:
	.ascii	"CCR2\000"
.LASF58:
	.ascii	"CCR3\000"
.LASF59:
	.ascii	"CCR4\000"
.LASF41:
	.ascii	"BDCR\000"
.LASF17:
	.ascii	"CFGR1\000"
.LASF18:
	.ascii	"CFGR2\000"
.LASF43:
	.ascii	"CFGR3\000"
.LASF13:
	.ascii	"uint8_t\000"
.LASF109:
	.ascii	"btn2_previous_state\000"
.LASF69:
	.ascii	"lib_read_button_0\000"
.LASF70:
	.ascii	"lib_read_button_1\000"
.LASF71:
	.ascii	"lib_read_button_2\000"
.LASF72:
	.ascii	"lib_read_button_3\000"
.LASF35:
	.ascii	"CFGR\000"
.LASF84:
	.ascii	"lib_adc_cal\000"
.LASF38:
	.ascii	"AHBENR\000"
.LASF103:
	.ascii	"libs_quicksort\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.2.1 20151202 (release) [ARM/embedded-5-branch revision 231848]"

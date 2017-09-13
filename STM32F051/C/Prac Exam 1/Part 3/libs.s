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
	.global	lib_read_rising_edge_button0
	.code	16
	.thumb_func
	.type	lib_read_rising_edge_button0, %function
lib_read_rising_edge_button0:
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
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L29
	ldr	r3, [r3]
	subs	r3, r3, #1
	rsbs	r1, r3, #0
	adcs	r3, r3, r1
	uxtb	r3, r3
	ands	r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L27
	.loc 1 92 0
	ldr	r3, .L29
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 93 0
	movs	r3, #1
	b	.L28
.L27:
	.loc 1 96 0
	ldr	r3, .L29
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 97 0
	movs	r3, #0
.L28:
	.loc 1 99 0
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
	.size	lib_read_rising_edge_button0, .-lib_read_rising_edge_button0
	.align	2
	.global	lib_read_rising_edge_button1
	.code	16
	.thumb_func
	.type	lib_read_rising_edge_button1, %function
lib_read_rising_edge_button1:
.LFB9:
	.loc 1 101 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 102 0
	bl	lib_read_button_1
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 1 104 0
	ldr	r3, [r7, #4]
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L34
	ldr	r3, [r3]
	subs	r3, r3, #1
	rsbs	r1, r3, #0
	adcs	r3, r3, r1
	uxtb	r3, r3
	ands	r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L32
	.loc 1 105 0
	ldr	r3, .L34
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 106 0
	movs	r3, #1
	b	.L33
.L32:
	.loc 1 109 0
	ldr	r3, .L34
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 110 0
	movs	r3, #0
.L33:
	.loc 1 112 0
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
	.size	lib_read_rising_edge_button1, .-lib_read_rising_edge_button1
	.align	2
	.global	lib_read_rising_edge_button2
	.code	16
	.thumb_func
	.type	lib_read_rising_edge_button2, %function
lib_read_rising_edge_button2:
.LFB10:
	.loc 1 114 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 115 0
	bl	lib_read_button_2
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 1 117 0
	ldr	r3, [r7, #4]
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L39
	ldr	r3, [r3]
	subs	r3, r3, #1
	rsbs	r1, r3, #0
	adcs	r3, r3, r1
	uxtb	r3, r3
	ands	r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L37
	.loc 1 118 0
	ldr	r3, .L39
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 119 0
	movs	r3, #1
	b	.L38
.L37:
	.loc 1 122 0
	ldr	r3, .L39
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 123 0
	movs	r3, #0
.L38:
	.loc 1 125 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L40:
	.align	2
.L39:
	.word	btn2_previous_state
	.cfi_endproc
.LFE10:
	.size	lib_read_rising_edge_button2, .-lib_read_rising_edge_button2
	.align	2
	.global	lib_read_rising_edge_button3
	.code	16
	.thumb_func
	.type	lib_read_rising_edge_button3, %function
lib_read_rising_edge_button3:
.LFB11:
	.loc 1 127 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 128 0
	bl	lib_read_button_3
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 1 130 0
	ldr	r3, [r7, #4]
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L44
	ldr	r3, [r3]
	subs	r3, r3, #1
	rsbs	r1, r3, #0
	adcs	r3, r3, r1
	uxtb	r3, r3
	ands	r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L42
	.loc 1 131 0
	ldr	r3, .L44
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 132 0
	movs	r3, #1
	b	.L43
.L42:
	.loc 1 135 0
	ldr	r3, .L44
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 136 0
	movs	r3, #0
.L43:
	.loc 1 138 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L45:
	.align	2
.L44:
	.word	btn3_previous_state
	.cfi_endproc
.LFE11:
	.size	lib_read_rising_edge_button3, .-lib_read_rising_edge_button3
	.align	2
	.global	lib_read_falling_edge_button0
	.code	16
	.thumb_func
	.type	lib_read_falling_edge_button0, %function
lib_read_falling_edge_button0:
.LFB12:
	.loc 1 140 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 141 0
	bl	lib_read_button_0
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 1 143 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L49
	ldr	r3, [r3]
	rsbs	r1, r3, #0
	adcs	r3, r3, r1
	uxtb	r3, r3
	ands	r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L47
	.loc 1 144 0
	ldr	r3, .L49
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 145 0
	movs	r3, #1
	b	.L48
.L47:
	.loc 1 148 0
	ldr	r3, .L49
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 149 0
	movs	r3, #0
.L48:
	.loc 1 151 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L50:
	.align	2
.L49:
	.word	btn0_previous_state
	.cfi_endproc
.LFE12:
	.size	lib_read_falling_edge_button0, .-lib_read_falling_edge_button0
	.align	2
	.global	lib_read_falling_edge_button1
	.code	16
	.thumb_func
	.type	lib_read_falling_edge_button1, %function
lib_read_falling_edge_button1:
.LFB13:
	.loc 1 153 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 154 0
	bl	lib_read_button_1
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 1 156 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L54
	ldr	r3, [r3]
	rsbs	r1, r3, #0
	adcs	r3, r3, r1
	uxtb	r3, r3
	ands	r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L52
	.loc 1 157 0
	ldr	r3, .L54
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 158 0
	movs	r3, #1
	b	.L53
.L52:
	.loc 1 161 0
	ldr	r3, .L54
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 162 0
	movs	r3, #0
.L53:
	.loc 1 164 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L55:
	.align	2
.L54:
	.word	btn1_previous_state
	.cfi_endproc
.LFE13:
	.size	lib_read_falling_edge_button1, .-lib_read_falling_edge_button1
	.align	2
	.global	lib_read_falling_edge_button2
	.code	16
	.thumb_func
	.type	lib_read_falling_edge_button2, %function
lib_read_falling_edge_button2:
.LFB14:
	.loc 1 166 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 167 0
	bl	lib_read_button_2
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 1 169 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L59
	ldr	r3, [r3]
	rsbs	r1, r3, #0
	adcs	r3, r3, r1
	uxtb	r3, r3
	ands	r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L57
	.loc 1 170 0
	ldr	r3, .L59+4
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 171 0
	movs	r3, #1
	b	.L58
.L57:
	.loc 1 174 0
	ldr	r3, .L59+4
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 175 0
	movs	r3, #0
.L58:
	.loc 1 177 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L60:
	.align	2
.L59:
	.word	btn0_previous_state
	.word	btn2_previous_state
	.cfi_endproc
.LFE14:
	.size	lib_read_falling_edge_button2, .-lib_read_falling_edge_button2
	.align	2
	.global	lib_read_falling_edge_button3
	.code	16
	.thumb_func
	.type	lib_read_falling_edge_button3, %function
lib_read_falling_edge_button3:
.LFB15:
	.loc 1 179 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 180 0
	bl	lib_read_button_3
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 1 182 0
	ldr	r3, [r7, #4]
	subs	r3, r3, #1
	rsbs	r2, r3, #0
	adcs	r3, r3, r2
	uxtb	r2, r3
	ldr	r3, .L64
	ldr	r3, [r3]
	rsbs	r1, r3, #0
	adcs	r3, r3, r1
	uxtb	r3, r3
	ands	r3, r2
	uxtb	r3, r3
	cmp	r3, #0
	beq	.L62
	.loc 1 183 0
	ldr	r3, .L64+4
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 184 0
	movs	r3, #1
	b	.L63
.L62:
	.loc 1 187 0
	ldr	r3, .L64+4
	ldr	r2, [r7, #4]
	str	r2, [r3]
	.loc 1 188 0
	movs	r3, #0
.L63:
	.loc 1 190 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L65:
	.align	2
.L64:
	.word	btn0_previous_state
	.word	btn3_previous_state
	.cfi_endproc
.LFE15:
	.size	lib_read_falling_edge_button3, .-lib_read_falling_edge_button3
	.align	2
	.global	lib_init_adc_6bit
	.code	16
	.thumb_func
	.type	lib_init_adc_6bit, %function
lib_init_adc_6bit:
.LFB16:
	.loc 1 192 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 194 0
	ldr	r3, .L68
	ldr	r2, .L68
	ldr	r2, [r2, #24]
	movs	r1, #128
	lsls	r1, r1, #2
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 196 0
	ldr	r3, .L68+4
	ldr	r2, .L68+4
	ldr	r2, [r2, #12]
	movs	r1, #24
	orrs	r2, r1
	str	r2, [r3, #12]
	.loc 1 198 0
	ldr	r3, .L68+4
	ldr	r2, .L68+4
	ldr	r2, [r2, #8]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 201 0
	nop
.L67:
	.loc 1 201 0 is_stmt 0 discriminator 1
	ldr	r3, .L68+4
	ldr	r3, [r3]
	movs	r2, #1
	ands	r3, r2
	beq	.L67
	.loc 1 202 0 is_stmt 1
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L69:
	.align	2
.L68:
	.word	1073876992
	.word	1073816576
	.cfi_endproc
.LFE16:
	.size	lib_init_adc_6bit, .-lib_init_adc_6bit
	.align	2
	.global	lib_init_adc_8bit
	.code	16
	.thumb_func
	.type	lib_init_adc_8bit, %function
lib_init_adc_8bit:
.LFB17:
	.loc 1 204 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 206 0
	ldr	r3, .L72
	ldr	r2, .L72
	ldr	r2, [r2, #24]
	movs	r1, #128
	lsls	r1, r1, #2
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 208 0
	ldr	r3, .L72+4
	ldr	r2, .L72+4
	ldr	r2, [r2, #12]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3, #12]
	.loc 1 210 0
	ldr	r3, .L72+4
	ldr	r2, .L72+4
	ldr	r2, [r2, #8]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 213 0
	nop
.L71:
	.loc 1 213 0 is_stmt 0 discriminator 1
	ldr	r3, .L72+4
	ldr	r3, [r3]
	movs	r2, #1
	ands	r3, r2
	beq	.L71
	.loc 1 214 0 is_stmt 1
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L73:
	.align	2
.L72:
	.word	1073876992
	.word	1073816576
	.cfi_endproc
.LFE17:
	.size	lib_init_adc_8bit, .-lib_init_adc_8bit
	.align	2
	.global	lib_init_adc_10bit
	.code	16
	.thumb_func
	.type	lib_init_adc_10bit, %function
lib_init_adc_10bit:
.LFB18:
	.loc 1 216 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 218 0
	ldr	r3, .L76
	ldr	r2, .L76
	ldr	r2, [r2, #24]
	movs	r1, #128
	lsls	r1, r1, #2
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 220 0
	ldr	r3, .L76+4
	ldr	r2, .L76+4
	ldr	r2, [r2, #12]
	movs	r1, #8
	orrs	r2, r1
	str	r2, [r3, #12]
	.loc 1 222 0
	ldr	r3, .L76+4
	ldr	r2, .L76+4
	ldr	r2, [r2, #8]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 225 0
	nop
.L75:
	.loc 1 225 0 is_stmt 0 discriminator 1
	ldr	r3, .L76+4
	ldr	r3, [r3]
	movs	r2, #1
	ands	r3, r2
	beq	.L75
	.loc 1 226 0 is_stmt 1
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L77:
	.align	2
.L76:
	.word	1073876992
	.word	1073816576
	.cfi_endproc
.LFE18:
	.size	lib_init_adc_10bit, .-lib_init_adc_10bit
	.align	2
	.global	lib_init_adc_12bit
	.code	16
	.thumb_func
	.type	lib_init_adc_12bit, %function
lib_init_adc_12bit:
.LFB19:
	.loc 1 228 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 230 0
	ldr	r3, .L80
	ldr	r2, .L80
	ldr	r2, [r2, #24]
	movs	r1, #128
	lsls	r1, r1, #2
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 232 0
	ldr	r3, .L80+4
	ldr	r2, .L80+4
	ldr	r2, [r2, #12]
	str	r2, [r3, #12]
	.loc 1 234 0
	ldr	r3, .L80+4
	ldr	r2, .L80+4
	ldr	r2, [r2, #8]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 237 0
	nop
.L79:
	.loc 1 237 0 is_stmt 0 discriminator 1
	ldr	r3, .L80+4
	ldr	r3, [r3]
	movs	r2, #1
	ands	r3, r2
	beq	.L79
	.loc 1 238 0 is_stmt 1
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L81:
	.align	2
.L80:
	.word	1073876992
	.word	1073816576
	.cfi_endproc
.LFE19:
	.size	lib_init_adc_12bit, .-lib_init_adc_12bit
	.align	2
	.global	lib_adc_cal
	.code	16
	.thumb_func
	.type	lib_adc_cal, %function
lib_adc_cal:
.LFB20:
	.loc 1 240 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 241 0
	ldr	r3, .L83
	movs	r2, #128
	lsls	r2, r2, #24
	str	r2, [r3, #8]
	.loc 1 242 0
	nop
	ldr	r3, .L83
	ldr	r3, [r3, #8]
	.loc 1 243 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L84:
	.align	2
.L83:
	.word	1073816576
	.cfi_endproc
.LFE20:
	.size	lib_adc_cal, .-lib_adc_cal
	.align	2
	.global	lib_init_pot0
	.code	16
	.thumb_func
	.type	lib_init_pot0, %function
lib_init_pot0:
.LFB21:
	.loc 1 245 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 246 0
	movs	r3, #144
	lsls	r3, r3, #23
	movs	r2, #144
	lsls	r2, r2, #23
	ldr	r2, [r2]
	movs	r1, #192
	lsls	r1, r1, #4
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 247 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE21:
	.size	lib_init_pot0, .-lib_init_pot0
	.align	2
	.global	lib_init_pot1
	.code	16
	.thumb_func
	.type	lib_init_pot1, %function
lib_init_pot1:
.LFB22:
	.loc 1 249 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 250 0
	movs	r3, #144
	lsls	r3, r3, #23
	movs	r2, #144
	lsls	r2, r2, #23
	ldr	r2, [r2]
	movs	r1, #192
	lsls	r1, r1, #6
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 251 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE22:
	.size	lib_init_pot1, .-lib_init_pot1
	.align	2
	.global	lib_read_pot0
	.code	16
	.thumb_func
	.type	lib_read_pot0, %function
lib_read_pot0:
.LFB23:
	.loc 1 253 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 257 0
	ldr	r3, .L90
	movs	r2, #32
	str	r2, [r3, #40]
	.loc 1 259 0
	ldr	r3, .L90
	ldr	r2, .L90
	ldr	r2, [r2, #8]
	movs	r1, #4
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 261 0
	nop
.L88:
	.loc 1 261 0 is_stmt 0 discriminator 1
	ldr	r3, .L90
	ldr	r3, [r3]
	movs	r2, #4
	ands	r3, r2
	beq	.L88
	.loc 1 263 0 is_stmt 1
	ldr	r3, .L90
	ldr	r2, [r3, #64]
	adds	r3, r7, #6
	strh	r2, [r3]
	.loc 1 265 0
	adds	r3, r7, #6
	ldrh	r3, [r3]
	.loc 1 266 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L91:
	.align	2
.L90:
	.word	1073816576
	.cfi_endproc
.LFE23:
	.size	lib_read_pot0, .-lib_read_pot0
	.align	2
	.global	lib_read_pot1
	.code	16
	.thumb_func
	.type	lib_read_pot1, %function
lib_read_pot1:
.LFB24:
	.loc 1 268 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 272 0
	ldr	r3, .L95
	movs	r2, #64
	str	r2, [r3, #40]
	.loc 1 274 0
	ldr	r3, .L95
	ldr	r2, .L95
	ldr	r2, [r2, #8]
	movs	r1, #4
	orrs	r2, r1
	str	r2, [r3, #8]
	.loc 1 276 0
	nop
.L93:
	.loc 1 276 0 is_stmt 0 discriminator 1
	ldr	r3, .L95
	ldr	r3, [r3]
	movs	r2, #4
	ands	r3, r2
	beq	.L93
	.loc 1 278 0 is_stmt 1
	ldr	r3, .L95
	ldr	r2, [r3, #64]
	adds	r3, r7, #6
	strh	r2, [r3]
	.loc 1 280 0
	adds	r3, r7, #6
	ldrh	r3, [r3]
	.loc 1 281 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L96:
	.align	2
.L95:
	.word	1073816576
	.cfi_endproc
.LFE24:
	.size	lib_read_pot1, .-lib_read_pot1
	.align	2
	.global	lib_init_TIM14
	.code	16
	.thumb_func
	.type	lib_init_TIM14, %function
lib_init_TIM14:
.LFB25:
	.loc 1 283 0
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
	.loc 1 285 0
	ldr	r3, .L98
	ldr	r2, .L98
	ldr	r2, [r2, #28]
	movs	r1, #128
	lsls	r1, r1, #1
	orrs	r2, r1
	str	r2, [r3, #28]
	.loc 1 287 0
	ldr	r3, .L98+4
	ldr	r2, [r7, #4]
	uxth	r2, r2
	strh	r2, [r3, #40]
	.loc 1 289 0
	ldr	r3, .L98+4
	ldr	r2, [r7]
	str	r2, [r3, #44]
	.loc 1 291 0
	ldr	r2, .L98+4
	ldr	r3, .L98+4
	ldrh	r3, [r3, #12]
	uxth	r3, r3
	movs	r1, #1
	orrs	r3, r1
	uxth	r3, r3
	strh	r3, [r2, #12]
	.loc 1 293 0
	ldr	r2, .L98+4
	ldr	r3, .L98+4
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r1, #1
	orrs	r3, r1
	uxth	r3, r3
	strh	r3, [r2]
	.loc 1 295 0
	ldr	r2, .L98+4
	ldr	r3, .L98+4
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r1, #128
	orrs	r3, r1
	uxth	r3, r3
	strh	r3, [r2]
	.loc 1 297 0
	ldr	r3, .L98+8
	ldr	r2, .L98+8
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #10
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 298 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L99:
	.align	2
.L98:
	.word	1073876992
	.word	1073750016
	.word	-536813312
	.cfi_endproc
.LFE25:
	.size	lib_init_TIM14, .-lib_init_TIM14
	.align	2
	.global	lib_init_TIM6
	.code	16
	.thumb_func
	.type	lib_init_TIM6, %function
lib_init_TIM6:
.LFB26:
	.loc 1 300 0
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
	.loc 1 302 0
	ldr	r3, .L101
	ldr	r2, .L101
	ldr	r2, [r2, #28]
	movs	r1, #16
	orrs	r2, r1
	str	r2, [r3, #28]
	.loc 1 304 0
	ldr	r3, .L101+4
	ldr	r2, [r7, #4]
	uxth	r2, r2
	strh	r2, [r3, #40]
	.loc 1 306 0
	ldr	r3, .L101+4
	ldr	r2, [r7]
	str	r2, [r3, #44]
	.loc 1 308 0
	ldr	r2, .L101+4
	ldr	r3, .L101+4
	ldrh	r3, [r3, #12]
	uxth	r3, r3
	movs	r1, #1
	orrs	r3, r1
	uxth	r3, r3
	strh	r3, [r2, #12]
	.loc 1 310 0
	ldr	r2, .L101+4
	ldr	r3, .L101+4
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r1, #1
	orrs	r3, r1
	uxth	r3, r3
	strh	r3, [r2]
	.loc 1 312 0
	ldr	r2, .L101+4
	ldr	r3, .L101+4
	ldrh	r3, [r3]
	uxth	r3, r3
	movs	r1, #128
	orrs	r3, r1
	uxth	r3, r3
	strh	r3, [r2]
	.loc 1 314 0
	ldr	r3, .L101+8
	ldr	r2, .L101+8
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #10
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 315 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L102:
	.align	2
.L101:
	.word	1073876992
	.word	1073745920
	.word	-536813312
	.cfi_endproc
.LFE26:
	.size	lib_init_TIM6, .-lib_init_TIM6
	.align	2
	.global	lib_TIM6_update_ARR
	.code	16
	.thumb_func
	.type	lib_TIM6_update_ARR, %function
lib_TIM6_update_ARR:
.LFB27:
	.loc 1 317 0
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
	.loc 1 318 0
	ldr	r3, .L104
	ldr	r2, [r7, #4]
	str	r2, [r3, #44]
	.loc 1 319 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L105:
	.align	2
.L104:
	.word	1073745920
	.cfi_endproc
.LFE27:
	.size	lib_TIM6_update_ARR, .-lib_TIM6_update_ARR
	.align	2
	.global	lib_TIM6_update_PSC
	.code	16
	.thumb_func
	.type	lib_TIM6_update_PSC, %function
lib_TIM6_update_PSC:
.LFB28:
	.loc 1 321 0
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
	.loc 1 322 0
	ldr	r3, .L107
	ldr	r2, [r7, #4]
	uxth	r2, r2
	strh	r2, [r3, #40]
	.loc 1 323 0
	nop
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L108:
	.align	2
.L107:
	.word	1073745920
	.cfi_endproc
.LFE28:
	.size	lib_TIM6_update_PSC, .-lib_TIM6_update_PSC
	.align	2
	.global	lib_TIM6_ACK
	.code	16
	.thumb_func
	.type	lib_TIM6_ACK, %function
lib_TIM6_ACK:
.LFB29:
	.loc 1 325 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 326 0
	ldr	r2, .L110
	ldr	r3, .L110
	ldrh	r3, [r3, #16]
	uxth	r3, r3
	movs	r1, #1
	bics	r3, r1
	uxth	r3, r3
	strh	r3, [r2, #16]
	.loc 1 327 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L111:
	.align	2
.L110:
	.word	1073745920
	.cfi_endproc
.LFE29:
	.size	lib_TIM6_ACK, .-lib_TIM6_ACK
	.align	2
	.global	delay_ms
	.code	16
	.thumb_func
	.type	delay_ms, %function
delay_ms:
.LFB30:
	.loc 1 329 0
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
	.loc 1 331 0
	ldr	r3, [r7, #4]
	ldr	r2, .L115
	muls	r3, r2
	str	r3, [r7, #12]
	.loc 1 332 0
	b	.L113
.L114:
	.loc 1 333 0
	ldr	r3, [r7, #12]
	subs	r3, r3, #1
	str	r3, [r7, #12]
.L113:
	.loc 1 332 0
	ldr	r3, [r7, #12]
	cmp	r3, #0
	bgt	.L114
	.loc 1 335 0
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L116:
	.align	2
.L115:
	.word	735
	.cfi_endproc
.LFE30:
	.size	delay_ms, .-delay_ms
	.align	2
	.global	delay_us
	.code	16
	.thumb_func
	.type	delay_us, %function
delay_us:
.LFB31:
	.loc 1 337 0
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
	.loc 1 339 0
	movs	r3, #0
	str	r3, [r7, #12]
	.loc 1 341 0
	b	.L118
.L119:
	.loc 1 342 0 discriminator 2
	.syntax divided
@ 342 "libs.c" 1
	NOP
@ 0 "" 2
	.loc 1 341 0 discriminator 2
	.thumb
	.syntax unified
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L118:
	.loc 1 341 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcc	.L119
	.loc 1 344 0 is_stmt 1
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE31:
	.size	delay_us, .-delay_us
	.align	2
	.global	lib_find_min_uint8
	.code	16
	.thumb_func
	.type	lib_find_min_uint8, %function
lib_find_min_uint8:
.LFB32:
	.loc 1 354 0
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
	str	r1, [r7]
	.loc 1 355 0
	movs	r3, #15
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 357 0
	movs	r3, #1
	str	r3, [r7, #8]
	b	.L121
.L123:
	.loc 1 358 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	movs	r2, #15
	adds	r2, r7, r2
	ldrb	r2, [r2]
	cmp	r2, r3
	bls	.L122
	.loc 1 359 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	adds	r2, r2, r3
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r2, [r2]
	strb	r2, [r3]
.L122:
	.loc 1 357 0 discriminator 2
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L121:
	.loc 1 357 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #8]
	ldr	r3, [r7]
	cmp	r2, r3
	bcc	.L123
	.loc 1 362 0 is_stmt 1
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 363 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE32:
	.size	lib_find_min_uint8, .-lib_find_min_uint8
	.align	2
	.global	lib_find_max_uint8
	.code	16
	.thumb_func
	.type	lib_find_max_uint8, %function
lib_find_max_uint8:
.LFB33:
	.loc 1 366 0
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
	str	r1, [r7]
	.loc 1 367 0
	movs	r3, #15
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 369 0
	movs	r3, #1
	str	r3, [r7, #8]
	b	.L126
.L128:
	.loc 1 370 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	adds	r3, r2, r3
	ldrb	r3, [r3]
	movs	r2, #15
	adds	r2, r7, r2
	ldrb	r2, [r2]
	cmp	r2, r3
	bcs	.L127
	.loc 1 371 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	adds	r2, r2, r3
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r2, [r2]
	strb	r2, [r3]
.L127:
	.loc 1 369 0 discriminator 2
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L126:
	.loc 1 369 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #8]
	ldr	r3, [r7]
	cmp	r2, r3
	bcc	.L128
	.loc 1 374 0 is_stmt 1
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	.loc 1 375 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE33:
	.size	lib_find_max_uint8, .-lib_find_max_uint8
	.align	2
	.global	lib_find_min_int8
	.code	16
	.thumb_func
	.type	lib_find_min_int8, %function
lib_find_min_int8:
.LFB34:
	.loc 1 378 0
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
	str	r1, [r7]
	.loc 1 379 0
	movs	r3, #15
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 381 0
	movs	r3, #1
	str	r3, [r7, #8]
	b	.L131
.L133:
	.loc 1 382 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	adds	r3, r2, r3
	ldrb	r1, [r3]
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	ldrsb	r2, [r3, r2]
	sxtb	r3, r1
	cmp	r2, r3
	ble	.L132
	.loc 1 383 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	adds	r2, r2, r3
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r2, [r2]
	strb	r2, [r3]
.L132:
	.loc 1 381 0 discriminator 2
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L131:
	.loc 1 381 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #8]
	ldr	r3, [r7]
	cmp	r2, r3
	bcc	.L133
	.loc 1 386 0 is_stmt 1
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	sxtb	r3, r3
	.loc 1 387 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE34:
	.size	lib_find_min_int8, .-lib_find_min_int8
	.align	2
	.global	lib_find_max_int8
	.code	16
	.thumb_func
	.type	lib_find_max_int8, %function
lib_find_max_int8:
.LFB35:
	.loc 1 390 0
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
	str	r1, [r7]
	.loc 1 391 0
	movs	r3, #15
	adds	r3, r7, r3
	ldr	r2, [r7, #4]
	ldrb	r2, [r2]
	strb	r2, [r3]
	.loc 1 393 0
	movs	r3, #1
	str	r3, [r7, #8]
	b	.L136
.L138:
	.loc 1 394 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	adds	r3, r2, r3
	ldrb	r1, [r3]
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	ldrsb	r2, [r3, r2]
	sxtb	r3, r1
	cmp	r2, r3
	bge	.L137
	.loc 1 395 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #8]
	adds	r2, r2, r3
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r2, [r2]
	strb	r2, [r3]
.L137:
	.loc 1 393 0 discriminator 2
	ldr	r3, [r7, #8]
	adds	r3, r3, #1
	str	r3, [r7, #8]
.L136:
	.loc 1 393 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #8]
	ldr	r3, [r7]
	cmp	r2, r3
	bcc	.L138
	.loc 1 398 0 is_stmt 1
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	sxtb	r3, r3
	.loc 1 399 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE35:
	.size	lib_find_max_int8, .-lib_find_max_int8
	.align	2
	.global	lib_quicksort
	.code	16
	.thumb_func
	.type	lib_quicksort, %function
lib_quicksort:
.LFB36:
	.loc 1 405 0
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
	.loc 1 406 0
	ldr	r2, [r7, #8]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcs	.L142
.LBB2:
	.loc 1 407 0
	ldr	r2, [r7, #4]
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	partition
	movs	r3, r0
	str	r3, [r7, #20]
	.loc 1 408 0
	ldr	r3, [r7, #20]
	subs	r2, r3, #1
	ldr	r1, [r7, #8]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	lib_quicksort
	.loc 1 409 0
	ldr	r3, [r7, #20]
	adds	r1, r3, #1
	ldr	r2, [r7, #4]
	ldr	r3, [r7, #12]
	movs	r0, r3
	bl	lib_quicksort
.L142:
.LBE2:
	.loc 1 411 0
	nop
	mov	sp, r7
	add	sp, sp, #24
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE36:
	.size	lib_quicksort, .-lib_quicksort
	.align	2
	.global	partition
	.code	16
	.thumb_func
	.type	partition, %function
partition:
.LFB37:
	.loc 1 414 0
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
	.loc 1 415 0
	ldr	r3, [r7, #4]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #28]
	.loc 1 416 0
	ldr	r3, [r7, #8]
	str	r3, [r7, #36]
	.loc 1 418 0
	ldr	r3, [r7, #8]
	str	r3, [r7, #32]
	b	.L144
.L146:
	.loc 1 419 0
	ldr	r3, [r7, #32]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r2, [r3]
	ldr	r3, [r7, #28]
	cmp	r2, r3
	bgt	.L145
.LBB3:
	.loc 1 420 0
	ldr	r3, [r7, #36]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #24]
	.loc 1 421 0
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
	.loc 1 422 0
	ldr	r3, [r7, #32]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r2, [r7, #24]
	str	r2, [r3]
	.loc 1 423 0
	ldr	r3, [r7, #36]
	adds	r3, r3, #1
	str	r3, [r7, #36]
.L145:
.LBE3:
	.loc 1 418 0 discriminator 2
	ldr	r3, [r7, #32]
	adds	r3, r3, #1
	str	r3, [r7, #32]
.L144:
	.loc 1 418 0 is_stmt 0 discriminator 1
	ldr	r3, [r7, #4]
	subs	r2, r3, #1
	ldr	r3, [r7, #32]
	cmp	r2, r3
	bhi	.L146
	.loc 1 426 0 is_stmt 1
	ldr	r3, [r7, #36]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r3, [r3]
	str	r3, [r7, #20]
	.loc 1 427 0
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
	.loc 1 428 0
	ldr	r3, [r7, #4]
	lsls	r3, r3, #2
	ldr	r2, [r7, #12]
	adds	r3, r2, r3
	ldr	r2, [r7, #20]
	str	r2, [r3]
	.loc 1 429 0
	ldr	r3, [r7, #36]
	.loc 1 430 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #40
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE37:
	.size	partition, .-partition
.Letext0:
	.file 2 "c:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "c:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xbd2
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF122
	.byte	0xc
	.4byte	.LASF123
	.4byte	.LASF124
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.4byte	.LASF0
	.byte	0x2
	.byte	0x1b
	.4byte	0x30
	.uleb128 0x3
	.byte	0x1
	.byte	0x6
	.4byte	.LASF2
	.uleb128 0x2
	.4byte	.LASF1
	.byte	0x2
	.byte	0x1d
	.4byte	0x42
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF3
	.uleb128 0x3
	.byte	0x2
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x2
	.4byte	.LASF5
	.byte	0x2
	.byte	0x2b
	.4byte	0x5b
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF6
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x2
	.byte	0x3f
	.4byte	0x6d
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.4byte	.LASF9
	.byte	0x2
	.byte	0x41
	.4byte	0x7f
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF11
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF12
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x3
	.byte	0x13
	.4byte	0x25
	.uleb128 0x2
	.4byte	.LASF15
	.byte	0x3
	.byte	0x14
	.4byte	0x37
	.uleb128 0x2
	.4byte	.LASF16
	.byte	0x3
	.byte	0x1a
	.4byte	0x50
	.uleb128 0x2
	.4byte	.LASF17
	.byte	0x3
	.byte	0x1f
	.4byte	0x62
	.uleb128 0x2
	.4byte	.LASF18
	.byte	0x3
	.byte	0x20
	.4byte	0x74
	.uleb128 0x5
	.byte	0x44
	.byte	0x4
	.2byte	0x1f7
	.4byte	0x189
	.uleb128 0x6
	.ascii	"ISR\000"
	.byte	0x4
	.2byte	0x1f9
	.4byte	0x189
	.byte	0
	.uleb128 0x6
	.ascii	"IER\000"
	.byte	0x4
	.2byte	0x1fa
	.4byte	0x189
	.byte	0x4
	.uleb128 0x6
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x1fb
	.4byte	0x189
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x1fc
	.4byte	0x189
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x1fd
	.4byte	0x189
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x1fe
	.4byte	0x189
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x1ff
	.4byte	0xce
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x200
	.4byte	0xce
	.byte	0x1c
	.uleb128 0x6
	.ascii	"TR\000"
	.byte	0x4
	.2byte	0x201
	.4byte	0x189
	.byte	0x20
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x202
	.4byte	0xce
	.byte	0x24
	.uleb128 0x7
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x203
	.4byte	0x189
	.byte	0x28
	.uleb128 0x7
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x204
	.4byte	0x18e
	.byte	0x2c
	.uleb128 0x6
	.ascii	"DR\000"
	.byte	0x4
	.2byte	0x205
	.4byte	0x189
	.byte	0x40
	.byte	0
	.uleb128 0x8
	.4byte	0xce
	.uleb128 0x9
	.4byte	0xce
	.4byte	0x19e
	.uleb128 0xa
	.4byte	0x19e
	.byte	0x4
	.byte	0
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF27
	.uleb128 0xb
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x206
	.4byte	0xd9
	.uleb128 0x8
	.4byte	0xb8
	.uleb128 0x5
	.byte	0x2c
	.byte	0x4
	.2byte	0x2e6
	.4byte	0x276
	.uleb128 0x7
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x2e8
	.4byte	0x189
	.byte	0
	.uleb128 0x7
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x2e9
	.4byte	0x1b1
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x2ea
	.4byte	0xb8
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x2eb
	.4byte	0x189
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x2ec
	.4byte	0x189
	.byte	0xc
	.uleb128 0x6
	.ascii	"IDR\000"
	.byte	0x4
	.2byte	0x2ed
	.4byte	0x1b1
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x2ee
	.4byte	0xb8
	.byte	0x12
	.uleb128 0x6
	.ascii	"ODR\000"
	.byte	0x4
	.2byte	0x2ef
	.4byte	0x1b1
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x2f0
	.4byte	0xb8
	.byte	0x16
	.uleb128 0x7
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x2f1
	.4byte	0x189
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x2f2
	.4byte	0x189
	.byte	0x1c
	.uleb128 0x6
	.ascii	"AFR\000"
	.byte	0x4
	.2byte	0x2f3
	.4byte	0x286
	.byte	0x20
	.uleb128 0x6
	.ascii	"BRR\000"
	.byte	0x4
	.2byte	0x2f4
	.4byte	0x1b1
	.byte	0x28
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x2f5
	.4byte	0xb8
	.byte	0x2a
	.byte	0
	.uleb128 0x9
	.4byte	0xce
	.4byte	0x286
	.uleb128 0xa
	.4byte	0x19e
	.byte	0x1
	.byte	0
	.uleb128 0x8
	.4byte	0x276
	.uleb128 0xb
	.4byte	.LASF36
	.byte	0x4
	.2byte	0x2f6
	.4byte	0x1b6
	.uleb128 0x5
	.byte	0x38
	.byte	0x4
	.2byte	0x335
	.4byte	0x356
	.uleb128 0x6
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x337
	.4byte	0x189
	.byte	0
	.uleb128 0x7
	.4byte	.LASF37
	.byte	0x4
	.2byte	0x338
	.4byte	0x189
	.byte	0x4
	.uleb128 0x6
	.ascii	"CIR\000"
	.byte	0x4
	.2byte	0x339
	.4byte	0x189
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x33a
	.4byte	0x189
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x33b
	.4byte	0x189
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x33c
	.4byte	0x189
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF41
	.byte	0x4
	.2byte	0x33d
	.4byte	0x189
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF42
	.byte	0x4
	.2byte	0x33e
	.4byte	0x189
	.byte	0x1c
	.uleb128 0x7
	.4byte	.LASF43
	.byte	0x4
	.2byte	0x33f
	.4byte	0x189
	.byte	0x20
	.uleb128 0x6
	.ascii	"CSR\000"
	.byte	0x4
	.2byte	0x340
	.4byte	0x189
	.byte	0x24
	.uleb128 0x7
	.4byte	.LASF44
	.byte	0x4
	.2byte	0x341
	.4byte	0x189
	.byte	0x28
	.uleb128 0x7
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x342
	.4byte	0x189
	.byte	0x2c
	.uleb128 0x7
	.4byte	.LASF45
	.byte	0x4
	.2byte	0x343
	.4byte	0x189
	.byte	0x30
	.uleb128 0x6
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x344
	.4byte	0x189
	.byte	0x34
	.byte	0
	.uleb128 0xb
	.4byte	.LASF46
	.byte	0x4
	.2byte	0x345
	.4byte	0x297
	.uleb128 0x5
	.byte	0x54
	.byte	0x4
	.2byte	0x389
	.4byte	0x53e
	.uleb128 0x6
	.ascii	"CR1\000"
	.byte	0x4
	.2byte	0x38b
	.4byte	0x1b1
	.byte	0
	.uleb128 0x7
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x38c
	.4byte	0xb8
	.byte	0x2
	.uleb128 0x6
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x38d
	.4byte	0x1b1
	.byte	0x4
	.uleb128 0x7
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x38e
	.4byte	0xb8
	.byte	0x6
	.uleb128 0x7
	.4byte	.LASF47
	.byte	0x4
	.2byte	0x38f
	.4byte	0x1b1
	.byte	0x8
	.uleb128 0x7
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x390
	.4byte	0xb8
	.byte	0xa
	.uleb128 0x7
	.4byte	.LASF48
	.byte	0x4
	.2byte	0x391
	.4byte	0x1b1
	.byte	0xc
	.uleb128 0x7
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x392
	.4byte	0xb8
	.byte	0xe
	.uleb128 0x6
	.ascii	"SR\000"
	.byte	0x4
	.2byte	0x393
	.4byte	0x1b1
	.byte	0x10
	.uleb128 0x7
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x394
	.4byte	0xb8
	.byte	0x12
	.uleb128 0x6
	.ascii	"EGR\000"
	.byte	0x4
	.2byte	0x395
	.4byte	0x1b1
	.byte	0x14
	.uleb128 0x7
	.4byte	.LASF49
	.byte	0x4
	.2byte	0x396
	.4byte	0xb8
	.byte	0x16
	.uleb128 0x7
	.4byte	.LASF50
	.byte	0x4
	.2byte	0x397
	.4byte	0x1b1
	.byte	0x18
	.uleb128 0x7
	.4byte	.LASF51
	.byte	0x4
	.2byte	0x398
	.4byte	0xb8
	.byte	0x1a
	.uleb128 0x7
	.4byte	.LASF52
	.byte	0x4
	.2byte	0x399
	.4byte	0x1b1
	.byte	0x1c
	.uleb128 0x7
	.4byte	.LASF53
	.byte	0x4
	.2byte	0x39a
	.4byte	0xb8
	.byte	0x1e
	.uleb128 0x7
	.4byte	.LASF54
	.byte	0x4
	.2byte	0x39b
	.4byte	0x1b1
	.byte	0x20
	.uleb128 0x7
	.4byte	.LASF55
	.byte	0x4
	.2byte	0x39c
	.4byte	0xb8
	.byte	0x22
	.uleb128 0x6
	.ascii	"CNT\000"
	.byte	0x4
	.2byte	0x39d
	.4byte	0x189
	.byte	0x24
	.uleb128 0x6
	.ascii	"PSC\000"
	.byte	0x4
	.2byte	0x39e
	.4byte	0x1b1
	.byte	0x28
	.uleb128 0x7
	.4byte	.LASF56
	.byte	0x4
	.2byte	0x39f
	.4byte	0xb8
	.byte	0x2a
	.uleb128 0x6
	.ascii	"ARR\000"
	.byte	0x4
	.2byte	0x3a0
	.4byte	0x189
	.byte	0x2c
	.uleb128 0x6
	.ascii	"RCR\000"
	.byte	0x4
	.2byte	0x3a1
	.4byte	0x1b1
	.byte	0x30
	.uleb128 0x7
	.4byte	.LASF57
	.byte	0x4
	.2byte	0x3a2
	.4byte	0xb8
	.byte	0x32
	.uleb128 0x7
	.4byte	.LASF58
	.byte	0x4
	.2byte	0x3a3
	.4byte	0x189
	.byte	0x34
	.uleb128 0x7
	.4byte	.LASF59
	.byte	0x4
	.2byte	0x3a4
	.4byte	0x189
	.byte	0x38
	.uleb128 0x7
	.4byte	.LASF60
	.byte	0x4
	.2byte	0x3a5
	.4byte	0x189
	.byte	0x3c
	.uleb128 0x7
	.4byte	.LASF61
	.byte	0x4
	.2byte	0x3a6
	.4byte	0x189
	.byte	0x40
	.uleb128 0x7
	.4byte	.LASF62
	.byte	0x4
	.2byte	0x3a7
	.4byte	0x1b1
	.byte	0x44
	.uleb128 0x7
	.4byte	.LASF63
	.byte	0x4
	.2byte	0x3a8
	.4byte	0xb8
	.byte	0x46
	.uleb128 0x6
	.ascii	"DCR\000"
	.byte	0x4
	.2byte	0x3a9
	.4byte	0x1b1
	.byte	0x48
	.uleb128 0x7
	.4byte	.LASF64
	.byte	0x4
	.2byte	0x3aa
	.4byte	0xb8
	.byte	0x4a
	.uleb128 0x7
	.4byte	.LASF65
	.byte	0x4
	.2byte	0x3ab
	.4byte	0x1b1
	.byte	0x4c
	.uleb128 0x7
	.4byte	.LASF66
	.byte	0x4
	.2byte	0x3ac
	.4byte	0xb8
	.byte	0x4e
	.uleb128 0x6
	.ascii	"OR\000"
	.byte	0x4
	.2byte	0x3ad
	.4byte	0x1b1
	.byte	0x50
	.uleb128 0x7
	.4byte	.LASF67
	.byte	0x4
	.2byte	0x3ae
	.4byte	0xb8
	.byte	0x52
	.byte	0
	.uleb128 0xb
	.4byte	.LASF68
	.byte	0x4
	.2byte	0x3af
	.4byte	0x362
	.uleb128 0xc
	.4byte	.LASF69
	.byte	0x1
	.byte	0xe
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF97
	.byte	0x1
	.byte	0x15
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x57f
	.uleb128 0xe
	.4byte	.LASF99
	.byte	0x1
	.byte	0x15
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xf
	.4byte	.LASF75
	.byte	0x1
	.byte	0x1a
	.4byte	0xad
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x5a7
	.uleb128 0x10
	.4byte	.LASF77
	.byte	0x1
	.byte	0x1c
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0xc
	.4byte	.LASF70
	.byte	0x1
	.byte	0x21
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF71
	.byte	0x1
	.byte	0x28
	.4byte	0x94
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF72
	.byte	0x1
	.byte	0x34
	.4byte	0x94
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF73
	.byte	0x1
	.byte	0x40
	.4byte	0x94
	.4byte	.LFB6
	.4byte	.LFE6-.LFB6
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x11
	.4byte	.LASF74
	.byte	0x1
	.byte	0x4c
	.4byte	0x94
	.4byte	.LFB7
	.4byte	.LFE7-.LFB7
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x12
	.4byte	.LASF76
	.byte	0x1
	.byte	0x58
	.4byte	0x94
	.4byte	.LFB8
	.4byte	.LFE8-.LFB8
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x634
	.uleb128 0x10
	.4byte	.LASF78
	.byte	0x1
	.byte	0x59
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF79
	.byte	0x1
	.byte	0x65
	.4byte	0x94
	.4byte	.LFB9
	.4byte	.LFE9-.LFB9
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x65c
	.uleb128 0x10
	.4byte	.LASF78
	.byte	0x1
	.byte	0x66
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF80
	.byte	0x1
	.byte	0x72
	.4byte	0x94
	.4byte	.LFB10
	.4byte	.LFE10-.LFB10
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x684
	.uleb128 0x10
	.4byte	.LASF78
	.byte	0x1
	.byte	0x73
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF81
	.byte	0x1
	.byte	0x7f
	.4byte	0x94
	.4byte	.LFB11
	.4byte	.LFE11-.LFB11
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6ac
	.uleb128 0x10
	.4byte	.LASF78
	.byte	0x1
	.byte	0x80
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF82
	.byte	0x1
	.byte	0x8c
	.4byte	0x94
	.4byte	.LFB12
	.4byte	.LFE12-.LFB12
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6d4
	.uleb128 0x10
	.4byte	.LASF78
	.byte	0x1
	.byte	0x8d
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF83
	.byte	0x1
	.byte	0x99
	.4byte	0x94
	.4byte	.LFB13
	.4byte	.LFE13-.LFB13
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x6fc
	.uleb128 0x10
	.4byte	.LASF78
	.byte	0x1
	.byte	0x9a
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF84
	.byte	0x1
	.byte	0xa6
	.4byte	0x94
	.4byte	.LFB14
	.4byte	.LFE14-.LFB14
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x724
	.uleb128 0x10
	.4byte	.LASF78
	.byte	0x1
	.byte	0xa7
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x12
	.4byte	.LASF85
	.byte	0x1
	.byte	0xb3
	.4byte	0x94
	.4byte	.LFB15
	.4byte	.LFE15-.LFB15
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x74c
	.uleb128 0x10
	.4byte	.LASF78
	.byte	0x1
	.byte	0xb4
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0xc
	.4byte	.LASF86
	.byte	0x1
	.byte	0xc0
	.4byte	.LFB16
	.4byte	.LFE16-.LFB16
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF87
	.byte	0x1
	.byte	0xcc
	.4byte	.LFB17
	.4byte	.LFE17-.LFB17
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF88
	.byte	0x1
	.byte	0xd8
	.4byte	.LFB18
	.4byte	.LFE18-.LFB18
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF89
	.byte	0x1
	.byte	0xe4
	.4byte	.LFB19
	.4byte	.LFE19-.LFB19
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF90
	.byte	0x1
	.byte	0xf0
	.4byte	.LFB20
	.4byte	.LFE20-.LFB20
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF91
	.byte	0x1
	.byte	0xf5
	.4byte	.LFB21
	.4byte	.LFE21-.LFB21
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xc
	.4byte	.LASF92
	.byte	0x1
	.byte	0xf9
	.4byte	.LFB22
	.4byte	.LFE22-.LFB22
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xf
	.4byte	.LASF93
	.byte	0x1
	.byte	0xfd
	.4byte	0xb8
	.4byte	.LFB23
	.4byte	.LFE23-.LFB23
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x7eb
	.uleb128 0x10
	.4byte	.LASF94
	.byte	0x1
	.byte	0xff
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x13
	.4byte	.LASF95
	.byte	0x1
	.2byte	0x10c
	.4byte	0xb8
	.4byte	.LFB24
	.4byte	.LFE24-.LFB24
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x815
	.uleb128 0x14
	.4byte	.LASF96
	.byte	0x1
	.2byte	0x10e
	.4byte	0xb8
	.uleb128 0x2
	.byte	0x91
	.sleb128 -10
	.byte	0
	.uleb128 0x15
	.4byte	.LASF98
	.byte	0x1
	.2byte	0x11b
	.4byte	.LFB25
	.4byte	.LFE25-.LFB25
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x84a
	.uleb128 0x16
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x11b
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.ascii	"arr\000"
	.byte	0x1
	.2byte	0x11b
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x15
	.4byte	.LASF101
	.byte	0x1
	.2byte	0x12c
	.4byte	.LFB26
	.4byte	.LFE26-.LFB26
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x87f
	.uleb128 0x16
	.4byte	.LASF100
	.byte	0x1
	.2byte	0x12c
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x17
	.ascii	"arr\000"
	.byte	0x1
	.2byte	0x12c
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x15
	.4byte	.LASF102
	.byte	0x1
	.2byte	0x13d
	.4byte	.LFB27
	.4byte	.LFE27-.LFB27
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8a5
	.uleb128 0x17
	.ascii	"arr\000"
	.byte	0x1
	.2byte	0x13d
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF103
	.byte	0x1
	.2byte	0x141
	.4byte	.LFB28
	.4byte	.LFE28-.LFB28
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x8cb
	.uleb128 0x17
	.ascii	"psc\000"
	.byte	0x1
	.2byte	0x141
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x18
	.4byte	.LASF104
	.byte	0x1
	.2byte	0x145
	.4byte	.LFB29
	.4byte	.LFE29-.LFB29
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x15
	.4byte	.LASF105
	.byte	0x1
	.2byte	0x149
	.4byte	.LFB30
	.4byte	.LFE30-.LFB30
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x912
	.uleb128 0x16
	.4byte	.LASF106
	.byte	0x1
	.2byte	0x149
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x14b
	.4byte	0x94
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x15
	.4byte	.LASF108
	.byte	0x1
	.2byte	0x151
	.4byte	.LFB31
	.4byte	.LFE31-.LFB31
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x947
	.uleb128 0x16
	.4byte	.LASF107
	.byte	0x1
	.2byte	0x151
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x14
	.4byte	.LASF109
	.byte	0x1
	.2byte	0x153
	.4byte	0x189
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.uleb128 0x13
	.4byte	.LASF110
	.byte	0x1
	.2byte	0x162
	.4byte	0xad
	.4byte	.LFB32
	.4byte	.LFE32-.LFB32
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x99a
	.uleb128 0x17
	.ascii	"a\000"
	.byte	0x1
	.2byte	0x162
	.4byte	0x99a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.ascii	"len\000"
	.byte	0x1
	.2byte	0x162
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.ascii	"min\000"
	.byte	0x1
	.2byte	0x163
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x19
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x164
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1a
	.byte	0x4
	.4byte	0xad
	.uleb128 0x13
	.4byte	.LASF111
	.byte	0x1
	.2byte	0x16e
	.4byte	0xad
	.4byte	.LFB33
	.4byte	.LFE33-.LFB33
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x9f3
	.uleb128 0x17
	.ascii	"a\000"
	.byte	0x1
	.2byte	0x16e
	.4byte	0x99a
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.ascii	"len\000"
	.byte	0x1
	.2byte	0x16e
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.ascii	"max\000"
	.byte	0x1
	.2byte	0x16f
	.4byte	0xad
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x19
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x170
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x13
	.4byte	.LASF112
	.byte	0x1
	.2byte	0x17a
	.4byte	0xa2
	.4byte	.LFB34
	.4byte	.LFE34-.LFB34
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa46
	.uleb128 0x17
	.ascii	"a\000"
	.byte	0x1
	.2byte	0x17a
	.4byte	0xa46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.ascii	"len\000"
	.byte	0x1
	.2byte	0x17a
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.ascii	"min\000"
	.byte	0x1
	.2byte	0x17b
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x19
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x17c
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1a
	.byte	0x4
	.4byte	0xa2
	.uleb128 0x13
	.4byte	.LASF113
	.byte	0x1
	.2byte	0x186
	.4byte	0xa2
	.4byte	.LFB35
	.4byte	.LFE35-.LFB35
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xa9f
	.uleb128 0x17
	.ascii	"a\000"
	.byte	0x1
	.2byte	0x186
	.4byte	0xa46
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.ascii	"len\000"
	.byte	0x1
	.2byte	0x186
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x19
	.ascii	"max\000"
	.byte	0x1
	.2byte	0x187
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.uleb128 0x19
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x188
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x1b
	.4byte	.LASF114
	.byte	0x1
	.2byte	0x195
	.4byte	.LFB36
	.4byte	.LFE36-.LFB36
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xaf6
	.uleb128 0x17
	.ascii	"a\000"
	.byte	0x1
	.2byte	0x195
	.4byte	0xaf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x17
	.ascii	"lo\000"
	.byte	0x1
	.2byte	0x195
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x17
	.ascii	"hi\000"
	.byte	0x1
	.2byte	0x195
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x19
	.ascii	"p\000"
	.byte	0x1
	.2byte	0x197
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x1a
	.byte	0x4
	.4byte	0xc3
	.uleb128 0x13
	.4byte	.LASF115
	.byte	0x1
	.2byte	0x19e
	.4byte	0xce
	.4byte	.LFB37
	.4byte	.LFE37-.LFB37
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb91
	.uleb128 0x17
	.ascii	"a\000"
	.byte	0x1
	.2byte	0x19e
	.4byte	0xaf6
	.uleb128 0x2
	.byte	0x91
	.sleb128 -36
	.uleb128 0x17
	.ascii	"lo\000"
	.byte	0x1
	.2byte	0x19e
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -40
	.uleb128 0x17
	.ascii	"hi\000"
	.byte	0x1
	.2byte	0x19e
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -44
	.uleb128 0x14
	.4byte	.LASF116
	.byte	0x1
	.2byte	0x19f
	.4byte	0xc3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x19
	.ascii	"i\000"
	.byte	0x1
	.2byte	0x1a0
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x19
	.ascii	"j\000"
	.byte	0x1
	.2byte	0x1a1
	.4byte	0xce
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.uleb128 0x14
	.4byte	.LASF117
	.byte	0x1
	.2byte	0x1aa
	.4byte	0xc3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x1c
	.4byte	.LBB3
	.4byte	.LBE3-.LBB3
	.uleb128 0x19
	.ascii	"tmp\000"
	.byte	0x1
	.2byte	0x1a4
	.4byte	0xc3
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.byte	0
	.byte	0
	.uleb128 0x1d
	.4byte	.LASF118
	.byte	0x1
	.byte	0x9
	.4byte	0x94
	.uleb128 0x5
	.byte	0x3
	.4byte	btn0_previous_state
	.uleb128 0x1d
	.4byte	.LASF119
	.byte	0x1
	.byte	0xa
	.4byte	0x94
	.uleb128 0x5
	.byte	0x3
	.4byte	btn1_previous_state
	.uleb128 0x1d
	.4byte	.LASF120
	.byte	0x1
	.byte	0xb
	.4byte	0x94
	.uleb128 0x5
	.byte	0x3
	.4byte	btn2_previous_state
	.uleb128 0x1d
	.4byte	.LASF121
	.byte	0x1
	.byte	0xc
	.4byte	0x94
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
	.uleb128 0x3
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
	.uleb128 0x14
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
	.uleb128 0x15
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
	.uleb128 0x16
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
	.uleb128 0x17
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
	.uleb128 0x18
	.uleb128 0x2e
	.byte	0
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
	.byte	0
	.byte	0
	.uleb128 0x19
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
	.uleb128 0x1a
	.uleb128 0xf
	.byte	0
	.uleb128 0xb
	.uleb128 0xb
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x1b
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
	.uleb128 0x1c
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
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
.LASF42:
	.ascii	"APB1ENR\000"
.LASF117:
	.ascii	"tmp2\000"
.LASF34:
	.ascii	"BSRR\000"
.LASF75:
	.ascii	"lib_read_leds\000"
.LASF38:
	.ascii	"APB2RSTR\000"
.LASF97:
	.ascii	"lib_write_leds\000"
.LASF13:
	.ascii	"unsigned int\000"
.LASF83:
	.ascii	"lib_read_falling_edge_button1\000"
.LASF84:
	.ascii	"lib_read_falling_edge_button2\000"
.LASF85:
	.ascii	"lib_read_falling_edge_button3\000"
.LASF43:
	.ascii	"BDCR\000"
.LASF7:
	.ascii	"__int32_t\000"
.LASF120:
	.ascii	"btn2_previous_state\000"
.LASF103:
	.ascii	"lib_TIM6_update_PSC\000"
.LASF68:
	.ascii	"TIM_TypeDef\000"
.LASF91:
	.ascii	"lib_init_pot0\000"
.LASF92:
	.ascii	"lib_init_pot1\000"
.LASF86:
	.ascii	"lib_init_adc_6bit\000"
.LASF18:
	.ascii	"uint32_t\000"
.LASF14:
	.ascii	"int8_t\000"
.LASF44:
	.ascii	"AHBRSTR\000"
.LASF62:
	.ascii	"BDTR\000"
.LASF58:
	.ascii	"CCR1\000"
.LASF59:
	.ascii	"CCR2\000"
.LASF60:
	.ascii	"CCR3\000"
.LASF61:
	.ascii	"CCR4\000"
.LASF50:
	.ascii	"CCMR1\000"
.LASF52:
	.ascii	"CCMR2\000"
.LASF12:
	.ascii	"long long unsigned int\000"
.LASF82:
	.ascii	"lib_read_falling_edge_button0\000"
.LASF5:
	.ascii	"__uint16_t\000"
.LASF29:
	.ascii	"MODER\000"
.LASF99:
	.ascii	"led_val\000"
.LASF25:
	.ascii	"CHSELR\000"
.LASF77:
	.ascii	"value\000"
.LASF93:
	.ascii	"lib_read_pot0\000"
.LASF95:
	.ascii	"lib_read_pot1\000"
.LASF100:
	.ascii	"prescaler\000"
.LASF109:
	.ascii	"counter\000"
.LASF21:
	.ascii	"SMPR\000"
.LASF74:
	.ascii	"lib_read_button_3\000"
.LASF46:
	.ascii	"RCC_TypeDef\000"
.LASF87:
	.ascii	"lib_init_adc_8bit\000"
.LASF90:
	.ascii	"lib_adc_cal\000"
.LASF48:
	.ascii	"DIER\000"
.LASF105:
	.ascii	"delay_ms\000"
.LASF33:
	.ascii	"PUPDR\000"
.LASF106:
	.ascii	"count\000"
.LASF39:
	.ascii	"APB1RSTR\000"
.LASF54:
	.ascii	"CCER\000"
.LASF101:
	.ascii	"lib_init_TIM6\000"
.LASF40:
	.ascii	"AHBENR\000"
.LASF15:
	.ascii	"uint8_t\000"
.LASF47:
	.ascii	"SMCR\000"
.LASF104:
	.ascii	"lib_TIM6_ACK\000"
.LASF76:
	.ascii	"lib_read_rising_edge_button0\000"
.LASF28:
	.ascii	"ADC_TypeDef\000"
.LASF11:
	.ascii	"long long int\000"
.LASF115:
	.ascii	"partition\000"
.LASF94:
	.ascii	"pot0_value\000"
.LASF113:
	.ascii	"lib_find_max_int8\000"
.LASF122:
	.ascii	"GNU C11 5.2.1 20151202 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 231848] -mthumb -mcpu=cortex-m0 -g\000"
.LASF123:
	.ascii	"libs.c\000"
.LASF114:
	.ascii	"lib_quicksort\000"
.LASF19:
	.ascii	"CFGR1\000"
.LASF20:
	.ascii	"CFGR2\000"
.LASF45:
	.ascii	"CFGR3\000"
.LASF41:
	.ascii	"APB2ENR\000"
.LASF70:
	.ascii	"lib_init_buttons\000"
.LASF111:
	.ascii	"lib_find_max_uint8\000"
.LASF0:
	.ascii	"__int8_t\000"
.LASF32:
	.ascii	"OSPEEDR\000"
.LASF79:
	.ascii	"lib_read_rising_edge_button1\000"
.LASF80:
	.ascii	"lib_read_rising_edge_button2\000"
.LASF81:
	.ascii	"lib_read_rising_edge_button3\000"
.LASF16:
	.ascii	"uint16_t\000"
.LASF118:
	.ascii	"btn0_previous_state\000"
.LASF31:
	.ascii	"RESERVED0\000"
.LASF22:
	.ascii	"RESERVED1\000"
.LASF23:
	.ascii	"RESERVED2\000"
.LASF24:
	.ascii	"RESERVED3\000"
.LASF26:
	.ascii	"RESERVED4\000"
.LASF49:
	.ascii	"RESERVED5\000"
.LASF51:
	.ascii	"RESERVED6\000"
.LASF4:
	.ascii	"short int\000"
.LASF55:
	.ascii	"RESERVED8\000"
.LASF8:
	.ascii	"long int\000"
.LASF65:
	.ascii	"DMAR\000"
.LASF107:
	.ascii	"delay\000"
.LASF116:
	.ascii	"pivot\000"
.LASF30:
	.ascii	"OTYPER\000"
.LASF37:
	.ascii	"CFGR\000"
.LASF98:
	.ascii	"lib_init_TIM14\000"
.LASF102:
	.ascii	"lib_TIM6_update_ARR\000"
.LASF124:
	.ascii	"C:\\Users\\Dillon\\Documents\\Engineering\\Universi"
	.ascii	"ty\\2016\\2nd Semester\\Micros\\Prac Exam 1\\Part 3"
	.ascii	"\000"
.LASF71:
	.ascii	"lib_read_button_0\000"
.LASF72:
	.ascii	"lib_read_button_1\000"
.LASF73:
	.ascii	"lib_read_button_2\000"
.LASF1:
	.ascii	"__uint8_t\000"
.LASF78:
	.ascii	"current_state\000"
.LASF36:
	.ascii	"GPIO_TypeDef\000"
.LASF27:
	.ascii	"sizetype\000"
.LASF10:
	.ascii	"long unsigned int\000"
.LASF17:
	.ascii	"int32_t\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF9:
	.ascii	"__uint32_t\000"
.LASF88:
	.ascii	"lib_init_adc_10bit\000"
.LASF119:
	.ascii	"btn1_previous_state\000"
.LASF56:
	.ascii	"RESERVED10\000"
.LASF57:
	.ascii	"RESERVED12\000"
.LASF63:
	.ascii	"RESERVED17\000"
.LASF64:
	.ascii	"RESERVED18\000"
.LASF66:
	.ascii	"RESERVED19\000"
.LASF108:
	.ascii	"delay_us\000"
.LASF2:
	.ascii	"signed char\000"
.LASF6:
	.ascii	"short unsigned int\000"
.LASF67:
	.ascii	"RESERVED20\000"
.LASF69:
	.ascii	"lib_init_leds\000"
.LASF110:
	.ascii	"lib_find_min_uint8\000"
.LASF112:
	.ascii	"lib_find_min_int8\000"
.LASF53:
	.ascii	"RESERVED7\000"
.LASF121:
	.ascii	"btn3_previous_state\000"
.LASF96:
	.ascii	"pot1_value\000"
.LASF35:
	.ascii	"LCKR\000"
.LASF89:
	.ascii	"lib_init_adc_12bit\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.2.1 20151202 (release) [ARM/embedded-5-branch revision 231848]"

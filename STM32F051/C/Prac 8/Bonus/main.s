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
	.file	"main.c"
	.text
.Ltext0:
	.cfi_sections	.debug_frame
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB0:
	.file 1 "main.c"
	.loc 1 67 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 70 0
	bl	lib_init_leds
	.loc 1 71 0
	movs	r0, #1
	bl	lib_write_leds
	.loc 1 72 0
	bl	lock_crystal
.L2:
	.loc 1 76 0 discriminator 1
	ldr	r3, .L3
	movs	r0, r3
	bl	toggle_LED_many_times
	.loc 1 78 0 discriminator 1
	b	.L2
.L4:
	.align	2
.L3:
	.word	200000
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.global	lock_crystal
	.code	16
	.thumb_func
	.type	lock_crystal, %function
lock_crystal:
.LFB1:
	.loc 1 84 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 85 0
	ldr	r3, .L9
	ldr	r2, .L9
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #9
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 86 0
	nop
.L6:
	.loc 1 86 0 is_stmt 0 discriminator 1
	ldr	r3, .L9
	ldr	r2, [r3]
	movs	r3, #128
	lsls	r3, r3, #10
	ands	r3, r2
	beq	.L6
	.loc 1 88 0 is_stmt 1
	ldr	r3, .L9+4
	movs	r2, #17
	str	r2, [r3]
	.loc 1 89 0
	ldr	r3, .L9
	ldr	r2, .L9
	ldr	r2, [r2, #4]
	movs	r1, #128
	lsls	r1, r1, #13
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 90 0
	ldr	r3, .L9
	ldr	r2, .L9
	ldr	r2, [r2, #4]
	movs	r1, #128
	lsls	r1, r1, #9
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 91 0
	ldr	r3, .L9
	ldr	r2, .L9
	ldr	r2, [r2]
	movs	r1, #128
	lsls	r1, r1, #17
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 92 0
	nop
.L7:
	.loc 1 92 0 is_stmt 0 discriminator 1
	ldr	r3, .L9
	ldr	r2, [r3]
	movs	r3, #128
	lsls	r3, r3, #18
	ands	r3, r2
	beq	.L7
	.loc 1 93 0 is_stmt 1
	ldr	r3, .L9
	ldr	r2, .L9
	ldr	r2, [r2, #4]
	movs	r1, #2
	orrs	r2, r1
	str	r2, [r3, #4]
	.loc 1 94 0
	nop
.L8:
	.loc 1 94 0 is_stmt 0 discriminator 1
	ldr	r3, .L9
	ldr	r3, [r3, #4]
	movs	r2, #8
	ands	r3, r2
	beq	.L8
	.loc 1 95 0 is_stmt 1
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L10:
	.align	2
.L9:
	.word	1073876992
	.word	1073881088
	.cfi_endproc
.LFE1:
	.size	lock_crystal, .-lock_crystal
	.align	2
	.global	unlock_crystal
	.code	16
	.thumb_func
	.type	unlock_crystal, %function
unlock_crystal:
.LFB2:
	.loc 1 97 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 98 0
	ldr	r3, .L13
	ldr	r2, .L13
	ldr	r2, [r2, #4]
	movs	r1, #3
	bics	r2, r1
	str	r2, [r3, #4]
	.loc 1 99 0
	nop
.L12:
	.loc 1 99 0 is_stmt 0 discriminator 1
	ldr	r3, .L13
	ldr	r3, [r3, #4]
	movs	r2, #8
	ands	r3, r2
	bne	.L12
	.loc 1 100 0 is_stmt 1
	ldr	r3, .L13
	ldr	r2, .L13
	ldr	r2, [r2]
	ldr	r1, .L13+4
	ands	r2, r1
	str	r2, [r3]
	.loc 1 101 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L14:
	.align	2
.L13:
	.word	1073876992
	.word	-65537
	.cfi_endproc
.LFE2:
	.size	unlock_crystal, .-unlock_crystal
	.align	2
	.global	toggle_LED_many_times
	.code	16
	.thumb_func
	.type	toggle_LED_many_times, %function
toggle_LED_many_times:
.LFB3:
	.loc 1 103 0
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
.LBB2:
	.loc 1 104 0
	movs	r3, #0
	str	r3, [r7, #12]
	b	.L16
.L17:
	.loc 1 105 0 discriminator 3
	ldr	r3, .L18
	ldr	r2, .L18
	ldr	r2, [r2, #24]
	movs	r1, #1
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 106 0 discriminator 3
	ldr	r3, .L18
	ldr	r2, .L18
	ldr	r2, [r2, #24]
	movs	r1, #128
	lsls	r1, r1, #9
	orrs	r2, r1
	str	r2, [r3, #24]
	.loc 1 104 0 discriminator 3
	ldr	r3, [r7, #12]
	adds	r3, r3, #1
	str	r3, [r7, #12]
.L16:
	.loc 1 104 0 is_stmt 0 discriminator 1
	ldr	r2, [r7, #12]
	ldr	r3, [r7, #4]
	cmp	r2, r3
	bcc	.L17
.LBE2:
	.loc 1 108 0 is_stmt 1
	nop
	mov	sp, r7
	add	sp, sp, #16
	@ sp needed
	pop	{r7, pc}
.L19:
	.align	2
.L18:
	.word	1207960576
	.cfi_endproc
.LFE3:
	.size	toggle_LED_many_times, .-toggle_LED_many_times
	.align	2
	.global	TIM6_IRQHandler
	.code	16
	.thumb_func
	.type	TIM6_IRQHandler, %function
TIM6_IRQHandler:
.LFB4:
	.loc 1 112 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 114 0
	bl	lib_TIM6_ACK
	.loc 1 116 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE4:
	.size	TIM6_IRQHandler, .-TIM6_IRQHandler
	.align	2
	.global	TIM14_IRQHandler
	.code	16
	.thumb_func
	.type	TIM14_IRQHandler, %function
TIM14_IRQHandler:
.LFB5:
	.loc 1 119 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 121 0
	bl	lib_TIM14_ACK
	.loc 1 123 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE5:
	.size	TIM14_IRQHandler, .-TIM14_IRQHandler
.Letext0:
	.file 2 "c:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "c:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\sys\\_stdint.h"
	.file 4 "stm32f0xx.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x373
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF45
	.byte	0xc
	.4byte	.LASF46
	.4byte	.LASF47
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x2
	.byte	0x1
	.byte	0x8
	.4byte	.LASF1
	.uleb128 0x2
	.byte	0x2
	.byte	0x5
	.4byte	.LASF2
	.uleb128 0x3
	.4byte	.LASF5
	.byte	0x2
	.byte	0x2b
	.4byte	0x45
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x3
	.4byte	.LASF6
	.byte	0x2
	.byte	0x41
	.4byte	0x5e
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF9
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x3
	.4byte	.LASF11
	.byte	0x3
	.byte	0x1a
	.4byte	0x3a
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x20
	.4byte	0x53
	.uleb128 0x5
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x6
	.byte	0x24
	.byte	0x4
	.2byte	0x2c4
	.4byte	0x11f
	.uleb128 0x7
	.ascii	"ACR\000"
	.byte	0x4
	.2byte	0x2c6
	.4byte	0x97
	.byte	0
	.uleb128 0x8
	.4byte	.LASF14
	.byte	0x4
	.2byte	0x2c7
	.4byte	0x97
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF15
	.byte	0x4
	.2byte	0x2c8
	.4byte	0x97
	.byte	0x8
	.uleb128 0x7
	.ascii	"SR\000"
	.byte	0x4
	.2byte	0x2c9
	.4byte	0x97
	.byte	0xc
	.uleb128 0x7
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x2ca
	.4byte	0x97
	.byte	0x10
	.uleb128 0x7
	.ascii	"AR\000"
	.byte	0x4
	.2byte	0x2cb
	.4byte	0x97
	.byte	0x14
	.uleb128 0x8
	.4byte	.LASF16
	.byte	0x4
	.2byte	0x2cc
	.4byte	0x97
	.byte	0x18
	.uleb128 0x7
	.ascii	"OBR\000"
	.byte	0x4
	.2byte	0x2cd
	.4byte	0x97
	.byte	0x1c
	.uleb128 0x8
	.4byte	.LASF17
	.byte	0x4
	.2byte	0x2ce
	.4byte	0x97
	.byte	0x20
	.byte	0
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x4
	.2byte	0x2cf
	.4byte	0xa3
	.uleb128 0x5
	.4byte	0x81
	.uleb128 0x6
	.byte	0x2c
	.byte	0x4
	.2byte	0x2e6
	.4byte	0x1f0
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x4
	.2byte	0x2e8
	.4byte	0x97
	.byte	0
	.uleb128 0x8
	.4byte	.LASF20
	.byte	0x4
	.2byte	0x2e9
	.4byte	0x12b
	.byte	0x4
	.uleb128 0x8
	.4byte	.LASF21
	.byte	0x4
	.2byte	0x2ea
	.4byte	0x81
	.byte	0x6
	.uleb128 0x8
	.4byte	.LASF22
	.byte	0x4
	.2byte	0x2eb
	.4byte	0x97
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF23
	.byte	0x4
	.2byte	0x2ec
	.4byte	0x97
	.byte	0xc
	.uleb128 0x7
	.ascii	"IDR\000"
	.byte	0x4
	.2byte	0x2ed
	.4byte	0x12b
	.byte	0x10
	.uleb128 0x8
	.4byte	.LASF24
	.byte	0x4
	.2byte	0x2ee
	.4byte	0x81
	.byte	0x12
	.uleb128 0x7
	.ascii	"ODR\000"
	.byte	0x4
	.2byte	0x2ef
	.4byte	0x12b
	.byte	0x14
	.uleb128 0x8
	.4byte	.LASF25
	.byte	0x4
	.2byte	0x2f0
	.4byte	0x81
	.byte	0x16
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x4
	.2byte	0x2f1
	.4byte	0x97
	.byte	0x18
	.uleb128 0x8
	.4byte	.LASF27
	.byte	0x4
	.2byte	0x2f2
	.4byte	0x97
	.byte	0x1c
	.uleb128 0x7
	.ascii	"AFR\000"
	.byte	0x4
	.2byte	0x2f3
	.4byte	0x200
	.byte	0x20
	.uleb128 0x7
	.ascii	"BRR\000"
	.byte	0x4
	.2byte	0x2f4
	.4byte	0x12b
	.byte	0x28
	.uleb128 0x8
	.4byte	.LASF28
	.byte	0x4
	.2byte	0x2f5
	.4byte	0x81
	.byte	0x2a
	.byte	0
	.uleb128 0xa
	.4byte	0x8c
	.4byte	0x200
	.uleb128 0xb
	.4byte	0x9c
	.byte	0x1
	.byte	0
	.uleb128 0x5
	.4byte	0x1f0
	.uleb128 0x9
	.4byte	.LASF29
	.byte	0x4
	.2byte	0x2f6
	.4byte	0x130
	.uleb128 0x6
	.byte	0x38
	.byte	0x4
	.2byte	0x335
	.4byte	0x2d0
	.uleb128 0x7
	.ascii	"CR\000"
	.byte	0x4
	.2byte	0x337
	.4byte	0x97
	.byte	0
	.uleb128 0x8
	.4byte	.LASF30
	.byte	0x4
	.2byte	0x338
	.4byte	0x97
	.byte	0x4
	.uleb128 0x7
	.ascii	"CIR\000"
	.byte	0x4
	.2byte	0x339
	.4byte	0x97
	.byte	0x8
	.uleb128 0x8
	.4byte	.LASF31
	.byte	0x4
	.2byte	0x33a
	.4byte	0x97
	.byte	0xc
	.uleb128 0x8
	.4byte	.LASF32
	.byte	0x4
	.2byte	0x33b
	.4byte	0x97
	.byte	0x10
	.uleb128 0x8
	.4byte	.LASF33
	.byte	0x4
	.2byte	0x33c
	.4byte	0x97
	.byte	0x14
	.uleb128 0x8
	.4byte	.LASF34
	.byte	0x4
	.2byte	0x33d
	.4byte	0x97
	.byte	0x18
	.uleb128 0x8
	.4byte	.LASF35
	.byte	0x4
	.2byte	0x33e
	.4byte	0x97
	.byte	0x1c
	.uleb128 0x8
	.4byte	.LASF36
	.byte	0x4
	.2byte	0x33f
	.4byte	0x97
	.byte	0x20
	.uleb128 0x7
	.ascii	"CSR\000"
	.byte	0x4
	.2byte	0x340
	.4byte	0x97
	.byte	0x24
	.uleb128 0x8
	.4byte	.LASF37
	.byte	0x4
	.2byte	0x341
	.4byte	0x97
	.byte	0x28
	.uleb128 0x8
	.4byte	.LASF38
	.byte	0x4
	.2byte	0x342
	.4byte	0x97
	.byte	0x2c
	.uleb128 0x8
	.4byte	.LASF39
	.byte	0x4
	.2byte	0x343
	.4byte	0x97
	.byte	0x30
	.uleb128 0x7
	.ascii	"CR2\000"
	.byte	0x4
	.2byte	0x344
	.4byte	0x97
	.byte	0x34
	.byte	0
	.uleb128 0x9
	.4byte	.LASF40
	.byte	0x4
	.2byte	0x345
	.4byte	0x211
	.uleb128 0xc
	.4byte	.LASF48
	.byte	0x1
	.byte	0x43
	.4byte	0x73
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF41
	.byte	0x1
	.byte	0x54
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xd
	.4byte	.LASF42
	.byte	0x1
	.byte	0x61
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0xe
	.4byte	.LASF49
	.byte	0x1
	.byte	0x67
	.4byte	.LFB3
	.4byte	.LFE3-.LFB3
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x34f
	.uleb128 0xf
	.4byte	.LASF50
	.byte	0x1
	.byte	0x67
	.4byte	0x34f
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x10
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x11
	.4byte	.LASF51
	.byte	0x1
	.byte	0x68
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.byte	0
	.byte	0
	.uleb128 0x12
	.4byte	0x8c
	.uleb128 0x13
	.4byte	.LASF43
	.byte	0x1
	.byte	0x70
	.4byte	.LFB4
	.4byte	.LFE4-.LFB4
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x13
	.4byte	.LASF44
	.byte	0x1
	.byte	0x77
	.4byte	.LFB5
	.4byte	.LFE5-.LFB5
	.uleb128 0x1
	.byte	0x9c
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
	.uleb128 0x35
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x6
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
	.uleb128 0x7
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
	.uleb128 0x8
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
	.uleb128 0x9
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
	.uleb128 0xa
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0xb
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
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
	.byte	0
	.byte	0
	.uleb128 0xd
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
	.uleb128 0xe
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
	.uleb128 0xf
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
	.uleb128 0x10
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x11
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
	.uleb128 0x12
	.uleb128 0x26
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x13
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
	.uleb128 0x2116
	.uleb128 0x19
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
.LASF23:
	.ascii	"PUPDR\000"
.LASF27:
	.ascii	"LCKR\000"
.LASF20:
	.ascii	"OTYPER\000"
.LASF19:
	.ascii	"MODER\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF8:
	.ascii	"long long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF26:
	.ascii	"BSRR\000"
.LASF18:
	.ascii	"FLASH_TypeDef\000"
.LASF4:
	.ascii	"long int\000"
.LASF31:
	.ascii	"APB2RSTR\000"
.LASF15:
	.ascii	"OPTKEYR\000"
.LASF11:
	.ascii	"uint16_t\000"
.LASF41:
	.ascii	"lock_crystal\000"
.LASF22:
	.ascii	"OSPEEDR\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF44:
	.ascii	"TIM14_IRQHandler\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF29:
	.ascii	"GPIO_TypeDef\000"
.LASF40:
	.ascii	"RCC_TypeDef\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF46:
	.ascii	"main.c\000"
.LASF13:
	.ascii	"sizetype\000"
.LASF37:
	.ascii	"AHBRSTR\000"
.LASF32:
	.ascii	"APB1RSTR\000"
.LASF42:
	.ascii	"unlock_crystal\000"
.LASF47:
	.ascii	"C:\\Users\\Dillon\\Documents\\Engineering\\Universi"
	.ascii	"ty\\2016\\2nd Semester\\Micros\\Projects\\Prac 8\\B"
	.ascii	"onus\000"
.LASF21:
	.ascii	"RESERVED0\000"
.LASF14:
	.ascii	"KEYR\000"
.LASF25:
	.ascii	"RESERVED2\000"
.LASF28:
	.ascii	"RESERVED3\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF2:
	.ascii	"short int\000"
.LASF51:
	.ascii	"counter\000"
.LASF45:
	.ascii	"GNU C11 5.2.1 20151202 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 231848] -mthumb -mcpu=cortex-m0 -g\000"
.LASF16:
	.ascii	"RESERVED\000"
.LASF34:
	.ascii	"APB2ENR\000"
.LASF24:
	.ascii	"RESERVED1\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF17:
	.ascii	"WRPR\000"
.LASF49:
	.ascii	"toggle_LED_many_times\000"
.LASF5:
	.ascii	"__uint16_t\000"
.LASF50:
	.ascii	"times_to_toggle\000"
.LASF35:
	.ascii	"APB1ENR\000"
.LASF43:
	.ascii	"TIM6_IRQHandler\000"
.LASF36:
	.ascii	"BDCR\000"
.LASF38:
	.ascii	"CFGR2\000"
.LASF39:
	.ascii	"CFGR3\000"
.LASF30:
	.ascii	"CFGR\000"
.LASF48:
	.ascii	"main\000"
.LASF33:
	.ascii	"AHBENR\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.2.1 20151202 (release) [ARM/embedded-5-branch revision 231848]"

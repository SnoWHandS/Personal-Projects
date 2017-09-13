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
	.global	myArray
	.data
	.align	2
	.type	myArray, %object
	.size	myArray, 20
myArray:
	.byte	72
	.byte	-116
	.byte	-74
	.byte	-105
	.byte	86
	.byte	-117
	.byte	-114
	.byte	-99
	.byte	1
	.byte	-39
	.byte	78
	.byte	105
	.byte	32
	.byte	-115
	.byte	90
	.byte	-2
	.byte	70
	.byte	-22
	.byte	-86
	.byte	88
	.text
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB0:
	.file 1 "main.c"
	.loc 1 64 0
	.cfi_startproc
	push	{r4, r7, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #20
	.cfi_def_cfa_offset 32
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 66 0
	bl	lib_init_buttons
	.loc 1 67 0
	bl	lib_init_leds
	.loc 1 69 0
	movs	r3, #20
	str	r3, [r7, #8]
	.loc 1 71 0
	adds	r4, r7, #7
	ldr	r2, [r7, #8]
	ldr	r3, .L5
	movs	r1, r2
	movs	r0, r3
	bl	lib_find_max_int8
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 72 0
	adds	r4, r7, #6
	ldr	r2, [r7, #8]
	ldr	r3, .L5
	movs	r1, r2
	movs	r0, r3
	bl	lib_find_min_int8
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 76 0
	adds	r3, r7, #7
	ldrb	r2, [r3]
	adds	r3, r7, #6
	ldrb	r3, [r3]
	adds	r3, r2, r3
	uxtb	r2, r3
	adds	r3, r7, #5
	strb	r2, [r3]
	.loc 1 77 0
	adds	r3, r7, #5
	ldrb	r3, [r3]
	sxtb	r3, r3
	asrs	r1, r3, #31
	adds	r2, r3, r1
	eors	r2, r1
	adds	r3, r7, #4
	strb	r2, [r3]
	.loc 1 79 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L4:
	.loc 1 84 0
	bl	lib_read_falling_edge_button0
	subs	r3, r0, #0
	beq	.L2
	.loc 1 86 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #0
	bne	.L3
	.loc 1 87 0
	adds	r3, r7, #4
	ldrb	r3, [r3]
	movs	r0, r3
	bl	lib_write_leds
	.loc 1 88 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #1
	strb	r2, [r3]
	b	.L2
.L3:
	.loc 1 90 0
	movs	r3, #15
	adds	r3, r7, r3
	ldrb	r3, [r3]
	cmp	r3, #1
	bne	.L2
	.loc 1 91 0
	adds	r3, r7, #5
	ldrb	r3, [r3]
	movs	r0, r3
	bl	lib_write_leds
	.loc 1 92 0
	movs	r3, #15
	adds	r3, r7, r3
	movs	r2, #0
	strb	r2, [r3]
.L2:
	.loc 1 97 0
	movs	r0, #20
	bl	delay_ms
	.loc 1 99 0
	b	.L4
.L6:
	.align	2
.L5:
	.word	myArray
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.global	TIM6_IRQHandler
	.code	16
	.thumb_func
	.type	TIM6_IRQHandler, %function
TIM6_IRQHandler:
.LFB1:
	.loc 1 104 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 106 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
	.cfi_endproc
.LFE1:
	.size	TIM6_IRQHandler, .-TIM6_IRQHandler
.Letext0:
	.file 2 "c:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "c:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\sys\\_stdint.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x15f
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF22
	.byte	0xc
	.4byte	.LASF23
	.4byte	.LASF24
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
	.uleb128 0x3
	.byte	0x2
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x3
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.4byte	.LASF7
	.byte	0x2
	.byte	0x41
	.4byte	0x69
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x3
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x2
	.4byte	.LASF12
	.byte	0x3
	.byte	0x13
	.4byte	0x25
	.uleb128 0x2
	.4byte	.LASF13
	.byte	0x3
	.byte	0x14
	.4byte	0x37
	.uleb128 0x2
	.4byte	.LASF14
	.byte	0x3
	.byte	0x20
	.4byte	0x5e
	.uleb128 0x3
	.byte	0x8
	.byte	0x4
	.4byte	.LASF15
	.uleb128 0x3
	.byte	0x4
	.byte	0x7
	.4byte	.LASF16
	.uleb128 0x3
	.byte	0x1
	.byte	0x8
	.4byte	.LASF17
	.uleb128 0x5
	.4byte	.LASF25
	.byte	0x1
	.byte	0x40
	.4byte	0x7e
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0x130
	.uleb128 0x6
	.4byte	.LASF18
	.byte	0x1
	.byte	0x45
	.4byte	0xa2
	.uleb128 0x2
	.byte	0x91
	.sleb128 -24
	.uleb128 0x7
	.ascii	"max\000"
	.byte	0x1
	.byte	0x47
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -25
	.uleb128 0x7
	.ascii	"min\000"
	.byte	0x1
	.byte	0x48
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -26
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x1
	.byte	0x4c
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -27
	.uleb128 0x6
	.4byte	.LASF20
	.byte	0x1
	.byte	0x4d
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -28
	.uleb128 0x6
	.4byte	.LASF21
	.byte	0x1
	.byte	0x4f
	.4byte	0x97
	.uleb128 0x2
	.byte	0x91
	.sleb128 -17
	.byte	0
	.uleb128 0x8
	.4byte	.LASF26
	.byte	0x1
	.byte	0x68
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	0x8c
	.4byte	0x151
	.uleb128 0xa
	.4byte	0xb4
	.byte	0x13
	.byte	0
	.uleb128 0xb
	.4byte	.LASF27
	.byte	0x1
	.byte	0x3d
	.4byte	0x141
	.uleb128 0x5
	.byte	0x3
	.4byte	myArray
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
	.uleb128 0x6
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
	.uleb128 0x7
	.uleb128 0x34
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
	.uleb128 0x8
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
.LASF0:
	.ascii	"__int8_t\000"
.LASF1:
	.ascii	"__uint8_t\000"
.LASF21:
	.ascii	"flag1\000"
.LASF12:
	.ascii	"int8_t\000"
.LASF19:
	.ascii	"max_plus_min\000"
.LASF2:
	.ascii	"signed char\000"
.LASF18:
	.ascii	"arr_len\000"
.LASF3:
	.ascii	"unsigned char\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF20:
	.ascii	"max_plus_min_abs\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF25:
	.ascii	"main\000"
.LASF11:
	.ascii	"unsigned int\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF13:
	.ascii	"uint8_t\000"
.LASF24:
	.ascii	"C:\\Users\\Dillon\\Documents\\Engineering\\Universi"
	.ascii	"ty\\2016\\2nd Semester\\Micros\\Prac Exam 1\\Part 1"
	.ascii	"\\WIP\000"
.LASF27:
	.ascii	"myArray\000"
.LASF16:
	.ascii	"sizetype\000"
.LASF9:
	.ascii	"long long int\000"
.LASF23:
	.ascii	"main.c\000"
.LASF17:
	.ascii	"char\000"
.LASF22:
	.ascii	"GNU C11 5.2.1 20151202 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 231848] -mthumb -mcpu=cortex-m0 -g\000"
.LASF4:
	.ascii	"short int\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF6:
	.ascii	"long int\000"
.LASF15:
	.ascii	"long double\000"
.LASF26:
	.ascii	"TIM6_IRQHandler\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.2.1 20151202 (release) [ARM/embedded-5-branch revision 231848]"

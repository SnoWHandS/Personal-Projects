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
	.size	myArray, 8
myArray:
	.byte	123
	.byte	24
	.byte	63
	.byte	33
	.byte	2
	.byte	112
	.byte	6
	.byte	-1
	.text
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB0:
	.file 1 "main.c"
	.loc 1 12 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 14 0
	bl	lib_init_leds
	.loc 1 15 0
	bl	lib_init_adc_8bit
	.loc 1 16 0
	bl	lib_init_pot0
	.loc 1 18 0
	adds	r3, r7, #7
	movs	r2, #0
	strb	r2, [r3]
.L11:
	.loc 1 21 0
	bl	lib_read_pot0
	movs	r3, r0
	movs	r2, r3
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 23 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	sxtb	r3, r3
	cmp	r3, #0
	bge	.L2
	.loc 1 24 0
	bl	lib_read_pot0
	movs	r3, r0
	uxtb	r3, r3
	movs	r0, r3
	bl	lib_write_leds
	b	.L11
.L2:
	.loc 1 26 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #111
	bls	.L4
	.loc 1 27 0
	ldr	r3, .L12
	ldrb	r3, [r3, #7]
	movs	r0, r3
	bl	lib_write_leds
	b	.L11
.L4:
	.loc 1 29 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #95
	bls	.L5
	.loc 1 30 0
	ldr	r3, .L12
	ldrb	r3, [r3, #6]
	movs	r0, r3
	bl	lib_write_leds
	b	.L11
.L5:
	.loc 1 32 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #79
	bls	.L6
	.loc 1 33 0
	ldr	r3, .L12
	ldrb	r3, [r3, #5]
	movs	r0, r3
	bl	lib_write_leds
	b	.L11
.L6:
	.loc 1 35 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #63
	bls	.L7
	.loc 1 36 0
	ldr	r3, .L12
	ldrb	r3, [r3, #4]
	movs	r0, r3
	bl	lib_write_leds
	b	.L11
.L7:
	.loc 1 38 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #47
	bls	.L8
	.loc 1 39 0
	ldr	r3, .L12
	ldrb	r3, [r3, #3]
	movs	r0, r3
	bl	lib_write_leds
	b	.L11
.L8:
	.loc 1 41 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #31
	bls	.L9
	.loc 1 42 0
	ldr	r3, .L12
	ldrb	r3, [r3, #2]
	movs	r0, r3
	bl	lib_write_leds
	b	.L11
.L9:
	.loc 1 44 0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r3, #15
	bls	.L10
	.loc 1 45 0
	ldr	r3, .L12
	ldrb	r3, [r3, #1]
	movs	r0, r3
	bl	lib_write_leds
	b	.L11
.L10:
	.loc 1 48 0
	ldr	r3, .L12
	ldrb	r3, [r3]
	movs	r0, r3
	bl	lib_write_leds
	.loc 1 51 0
	b	.L11
.L13:
	.align	2
.L12:
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
	.loc 1 58 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 60 0
	bl	lib_TIM6_ACK
	.loc 1 62 0
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
	.4byte	0xdf
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF12
	.byte	0xc
	.4byte	.LASF13
	.4byte	.LASF14
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF9
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
	.uleb128 0x2
	.byte	0x2
	.byte	0x7
	.4byte	.LASF3
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF4
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF5
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF7
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x3
	.4byte	.LASF10
	.byte	0x3
	.byte	0x14
	.4byte	0x2c
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x5
	.4byte	.LASF15
	.byte	0x1
	.byte	0xc
	.4byte	0x68
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xb0
	.uleb128 0x6
	.4byte	.LASF16
	.byte	0x1
	.byte	0x12
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.uleb128 0x7
	.4byte	.LASF17
	.byte	0x1
	.byte	0x3a
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x8
	.4byte	0x76
	.4byte	0xd1
	.uleb128 0x9
	.4byte	0x81
	.byte	0x7
	.byte	0
	.uleb128 0xa
	.4byte	.LASF18
	.byte	0x1
	.byte	0xa
	.4byte	0xc1
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
	.uleb128 0x8
	.uleb128 0x1
	.byte	0x1
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x1
	.uleb128 0x13
	.byte	0
	.byte	0
	.uleb128 0x9
	.uleb128 0x21
	.byte	0
	.uleb128 0x49
	.uleb128 0x13
	.uleb128 0x2f
	.uleb128 0xb
	.byte	0
	.byte	0
	.uleb128 0xa
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
.LASF6:
	.ascii	"long long int\000"
.LASF8:
	.ascii	"unsigned int\000"
.LASF13:
	.ascii	"main.c\000"
.LASF12:
	.ascii	"GNU C11 5.2.1 20151202 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 231848] -mthumb -mcpu=cortex-m0 -g\000"
.LASF14:
	.ascii	"C:\\Users\\Dillon\\Documents\\Engineering\\Universi"
	.ascii	"ty\\2016\\2nd Semester\\Micros\\Prac Exam 1\\Part 2"
	.ascii	"\\WIP\000"
.LASF5:
	.ascii	"long unsigned int\000"
.LASF7:
	.ascii	"long long unsigned int\000"
.LASF9:
	.ascii	"__uint8_t\000"
.LASF10:
	.ascii	"uint8_t\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF15:
	.ascii	"main\000"
.LASF4:
	.ascii	"long int\000"
.LASF17:
	.ascii	"TIM6_IRQHandler\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF2:
	.ascii	"short int\000"
.LASF18:
	.ascii	"myArray\000"
.LASF11:
	.ascii	"sizetype\000"
.LASF16:
	.ascii	"current_adc_val\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.2.1 20151202 (release) [ARM/embedded-5-branch revision 231848]"

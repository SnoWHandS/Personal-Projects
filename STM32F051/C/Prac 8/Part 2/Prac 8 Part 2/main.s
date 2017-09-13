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
	.size	myArray, 11
myArray:
	.byte	66
	.byte	105
	.byte	18
	.byte	-52
	.byte	-69
	.byte	85
	.byte	-95
	.byte	51
	.byte	26
	.byte	-33
	.byte	86
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
	push	{r4, r7, lr}
	.cfi_def_cfa_offset 12
	.cfi_offset 4, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #12
	.cfi_def_cfa_offset 24
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 14 0
	bl	lib_init_leds
	.loc 1 15 0
	bl	lib_init_buttons
	.loc 1 16 0
	movs	r3, #11
	str	r3, [r7, #4]
	.loc 1 19 0
	adds	r4, r7, #3
	ldr	r2, [r7, #4]
	ldr	r3, .L5
	movs	r1, r2
	movs	r0, r3
	bl	lib_find_min_uint8
	movs	r3, r0
	strb	r3, [r4]
	.loc 1 20 0
	adds	r4, r7, #2
	ldr	r2, [r7, #4]
	ldr	r3, .L5
	movs	r1, r2
	movs	r0, r3
	bl	lib_find_max_uint8
	movs	r3, r0
	strb	r3, [r4]
.L4:
	.loc 1 25 0
	bl	lib_read_button_0
	subs	r3, r0, #0
	beq	.L2
	.loc 1 26 0
	adds	r3, r7, #3
	ldrb	r3, [r3]
	movs	r0, r3
	bl	lib_write_leds
	b	.L4
.L2:
	.loc 1 29 0
	adds	r3, r7, #2
	ldrb	r3, [r3]
	movs	r0, r3
	bl	lib_write_leds
	.loc 1 31 0
	b	.L4
.L6:
	.align	2
.L5:
	.word	myArray
	.cfi_endproc
.LFE0:
	.size	main, .-main
.Letext0:
	.file 2 "c:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "c:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\sys\\_stdint.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x100
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF15
	.byte	0xc
	.4byte	.LASF16
	.4byte	.LASF17
	.4byte	.Ltext0
	.4byte	.Letext0-.Ltext0
	.4byte	.Ldebug_line0
	.uleb128 0x2
	.byte	0x1
	.byte	0x6
	.4byte	.LASF0
	.uleb128 0x3
	.4byte	.LASF5
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
	.byte	0x14
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x20
	.4byte	0x53
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF13
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x1
	.byte	0xc
	.4byte	0x73
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe2
	.uleb128 0x6
	.4byte	.LASF14
	.byte	0x1
	.byte	0x10
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -20
	.uleb128 0x7
	.ascii	"min\000"
	.byte	0x1
	.byte	0x13
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -21
	.uleb128 0x7
	.ascii	"max\000"
	.byte	0x1
	.byte	0x14
	.4byte	0x81
	.uleb128 0x2
	.byte	0x91
	.sleb128 -22
	.byte	0
	.uleb128 0x8
	.4byte	0x81
	.4byte	0xf2
	.uleb128 0x9
	.4byte	0x97
	.byte	0xa
	.byte	0
	.uleb128 0xa
	.4byte	.LASF19
	.byte	0x1
	.byte	0xa
	.4byte	0xe2
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
.LASF8:
	.ascii	"long long int\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF14:
	.ascii	"arr_len\000"
.LASF15:
	.ascii	"GNU C11 5.2.1 20151202 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 231848] -mthumb -mcpu=cortex-m0 -g\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF5:
	.ascii	"__uint8_t\000"
.LASF11:
	.ascii	"uint8_t\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF18:
	.ascii	"main\000"
.LASF16:
	.ascii	"main.c\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF4:
	.ascii	"long int\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF17:
	.ascii	"C:\\Users\\Dillon\\Documents\\Engineering\\Universi"
	.ascii	"ty\\2016\\2nd Semester\\Micros\\Projects\\Prac 8\\P"
	.ascii	"art 2\\Prac 8 Part 2\000"
.LASF2:
	.ascii	"short int\000"
.LASF19:
	.ascii	"myArray\000"
.LASF13:
	.ascii	"sizetype\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.2.1 20151202 (release) [ARM/embedded-5-branch revision 231848]"

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
	.loc 1 17 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 19 0
	ldr	r3, .L7
	ldr	r2, .L7
	ldr	r2, [r2]
	movs	r1, #192
	lsls	r1, r1, #11
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 20 0
	movs	r3, #144
	lsls	r3, r3, #23
	movs	r2, #144
	lsls	r2, r2, #23
	ldr	r2, [r2]
	movs	r1, #240
	lsls	r1, r1, #6
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 21 0
	ldr	r3, .L7+4
	ldr	r2, .L7+4
	ldr	r2, [r2]
	movs	r1, #85
	orrs	r2, r1
	str	r2, [r3]
	.loc 1 22 0
	ldr	r3, .L7+8
	ldr	r2, .L7+8
	ldr	r2, [r2]
	ldr	r1, .L7+12
	orrs	r2, r1
	str	r2, [r3]
.L6:
	.loc 1 27 0
	nop
.L2:
	.loc 1 27 0 is_stmt 0 discriminator 1
	ldr	r3, .L7+16
	ldrb	r3, [r3]
	movs	r2, r3
	movs	r3, #2
	ands	r3, r2
	beq	.L2
	.loc 1 31 0 is_stmt 1
	ldr	r3, .L7+20
	movs	r2, #170
	strh	r2, [r3]
	.loc 1 32 0
	bl	delay
	.loc 1 34 0
	nop
.L3:
	.loc 1 34 0 is_stmt 0 discriminator 1
	ldr	r3, .L7+16
	ldrb	r3, [r3]
	movs	r2, r3
	movs	r3, #2
	ands	r3, r2
	beq	.L3
	.loc 1 38 0 is_stmt 1
	ldr	r3, .L7+20
	movs	r2, #255
	strh	r2, [r3]
	.loc 1 39 0
	bl	delay
	.loc 1 41 0
	nop
.L4:
	.loc 1 41 0 is_stmt 0 discriminator 1
	ldr	r3, .L7+16
	ldrb	r3, [r3]
	movs	r2, r3
	movs	r3, #2
	ands	r3, r2
	beq	.L4
	.loc 1 45 0 is_stmt 1
	ldr	r3, .L7+20
	movs	r2, #85
	strh	r2, [r3]
	.loc 1 46 0
	bl	delay
	.loc 1 48 0
	nop
.L5:
	.loc 1 48 0 is_stmt 0 discriminator 1
	ldr	r3, .L7+16
	ldrb	r3, [r3]
	movs	r2, r3
	movs	r3, #2
	ands	r3, r2
	beq	.L5
	.loc 1 52 0 is_stmt 1
	ldr	r3, .L7+20
	movs	r2, #0
	strh	r2, [r3]
	.loc 1 53 0
	bl	delay
	.loc 1 54 0
	b	.L6
.L8:
	.align	2
.L7:
	.word	1073877012
	.word	1207959564
	.word	1207960576
	.word	21845
	.word	1207959568
	.word	1207960596
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.global	delay
	.code	16
	.thumb_func
	.type	delay, %function
delay:
.LFB1:
	.loc 1 60 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 61 0
	ldr	r3, .L12
	ldr	r2, .L12+4
	str	r2, [r3]
	.loc 1 62 0
	b	.L10
.L11:
	.loc 1 65 0
	ldr	r3, .L12
	ldr	r2, [r3]
	subs	r2, r2, #1
	str	r2, [r3]
.L10:
	.loc 1 62 0
	ldr	r3, .L12
	ldr	r3, [r3]
	cmp	r3, #0
	bne	.L11
	.loc 1 67 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L13:
	.align	2
.L12:
	.word	536871152
	.word	550000
	.cfi_endproc
.LFE1:
	.size	delay, .-delay
.Letext0:
	.file 2 "e:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "e:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\sys\\_stdint.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xd0
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
	.uleb128 0x2
	.byte	0x4
	.byte	0x5
	.4byte	.LASF6
	.uleb128 0x3
	.4byte	.LASF7
	.byte	0x2
	.byte	0x41
	.4byte	0x69
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF8
	.uleb128 0x2
	.byte	0x8
	.byte	0x5
	.4byte	.LASF9
	.uleb128 0x2
	.byte	0x8
	.byte	0x7
	.4byte	.LASF10
	.uleb128 0x4
	.byte	0x4
	.byte	0x5
	.ascii	"int\000"
	.uleb128 0x2
	.byte	0x4
	.byte	0x7
	.4byte	.LASF11
	.uleb128 0x3
	.4byte	.LASF12
	.byte	0x3
	.byte	0x14
	.4byte	0x2c
	.uleb128 0x3
	.4byte	.LASF13
	.byte	0x3
	.byte	0x1a
	.4byte	0x45
	.uleb128 0x3
	.4byte	.LASF14
	.byte	0x3
	.byte	0x20
	.4byte	0x5e
	.uleb128 0x5
	.4byte	.LASF18
	.byte	0x1
	.byte	0x10
	.4byte	0x7e
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF19
	.byte	0x1
	.byte	0x3b
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
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
	.uleb128 0x6
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
.LASF3:
	.ascii	"__uint8_t\000"
.LASF19:
	.ascii	"delay\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF17:
	.ascii	"C:\\Users\\Dillo\\Documents\\UCT\\First Year\\2nd S"
	.ascii	"emester\\Micros\\Projects\\Prac 6\\WIP\\Doing it th"
	.ascii	"e really hard way\000"
.LASF8:
	.ascii	"long unsigned int\000"
.LASF5:
	.ascii	"short unsigned int\000"
.LASF4:
	.ascii	"__uint16_t\000"
.LASF7:
	.ascii	"__uint32_t\000"
.LASF18:
	.ascii	"main\000"
.LASF11:
	.ascii	"unsigned int\000"
.LASF10:
	.ascii	"long long unsigned int\000"
.LASF12:
	.ascii	"uint8_t\000"
.LASF9:
	.ascii	"long long int\000"
.LASF16:
	.ascii	"main.c\000"
.LASF2:
	.ascii	"short int\000"
.LASF13:
	.ascii	"uint16_t\000"
.LASF14:
	.ascii	"uint32_t\000"
.LASF6:
	.ascii	"long int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF15:
	.ascii	"GNU C11 5.2.1 20151202 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 231848] -mcpu=cortex-m0 -mthumb -g\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.2.1 20151202 (release) [ARM/embedded-5-branch revision 231848]"

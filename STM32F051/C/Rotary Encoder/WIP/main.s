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
	.global	current_led_val
	.bss
	.type	current_led_val, %object
	.size	current_led_val, 1
current_led_val:
	.space	1
	.global	previous_clk_pin_state
	.type	previous_clk_pin_state, %object
	.size	previous_clk_pin_state, 1
previous_clk_pin_state:
	.space	1
	.text
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB0:
	.file 1 "main.c"
	.loc 1 63 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 66 0
	bl	lib_init_leds
	.loc 1 67 0
	bl	lib_init_buttons
	.loc 1 68 0
	bl	lib_read_button_0
	movs	r3, r0
	uxtb	r2, r3
	ldr	r3, .L5
	strb	r2, [r3]
.L4:
.LBB2:
	.loc 1 71 0
	bl	lib_read_button_0
	movs	r2, r0
	adds	r3, r7, #7
	strb	r2, [r3]
	.loc 1 72 0
	ldr	r3, .L5
	ldrb	r3, [r3]
	adds	r2, r7, #7
	ldrb	r2, [r2]
	cmp	r2, r3
	beq	.L2
	.loc 1 74 0
	bl	lib_read_button_1
	movs	r2, r0
	adds	r3, r7, #7
	ldrb	r3, [r3]
	cmp	r2, r3
	beq	.L3
	.loc 1 75 0
	ldr	r3, .L5+4
	ldrb	r3, [r3]
	adds	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, .L5+4
	strb	r2, [r3]
	b	.L2
.L3:
	.loc 1 78 0
	ldr	r3, .L5+4
	ldrb	r3, [r3]
	subs	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, .L5+4
	strb	r2, [r3]
.L2:
	.loc 1 82 0
	ldr	r3, .L5+4
	ldrb	r3, [r3]
	movs	r0, r3
	bl	lib_write_leds
	.loc 1 83 0
	ldr	r3, .L5
	adds	r2, r7, #7
	ldrb	r2, [r2]
	strb	r2, [r3]
.LBE2:
	.loc 1 84 0
	b	.L4
.L6:
	.align	2
.L5:
	.word	previous_clk_pin_state
	.word	current_led_val
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
	.loc 1 90 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 92 0
	bl	lib_TIM6_ACK
	.loc 1 94 0
	ldr	r3, .L8
	ldrb	r3, [r3]
	adds	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, .L8
	strb	r2, [r3]
	.loc 1 95 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L9:
	.align	2
.L8:
	.word	current_led_val
	.cfi_endproc
.LFE1:
	.size	TIM6_IRQHandler, .-TIM6_IRQHandler
.Letext0:
	.file 2 "c:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "c:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\sys\\_stdint.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0xea
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF14
	.byte	0xc
	.4byte	.LASF15
	.4byte	.LASF16
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
	.4byte	.LASF17
	.byte	0x1
	.byte	0x3f
	.4byte	0x68
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xba
	.uleb128 0x6
	.4byte	.LBB2
	.4byte	.LBE2-.LBB2
	.uleb128 0x7
	.4byte	.LASF18
	.byte	0x1
	.byte	0x47
	.4byte	0x76
	.uleb128 0x2
	.byte	0x91
	.sleb128 -9
	.byte	0
	.byte	0
	.uleb128 0x8
	.4byte	.LASF19
	.byte	0x1
	.byte	0x5a
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	.LASF12
	.byte	0x1
	.byte	0x3d
	.4byte	0x76
	.uleb128 0x5
	.byte	0x3
	.4byte	current_led_val
	.uleb128 0x9
	.4byte	.LASF13
	.byte	0x1
	.byte	0x3e
	.4byte	0x76
	.uleb128 0x5
	.byte	0x3
	.4byte	previous_clk_pin_state
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
	.uleb128 0xb
	.byte	0x1
	.uleb128 0x11
	.uleb128 0x1
	.uleb128 0x12
	.uleb128 0x6
	.byte	0
	.byte	0
	.uleb128 0x7
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
	.uleb128 0x2116
	.uleb128 0x19
	.byte	0
	.byte	0
	.uleb128 0x9
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
.LASF15:
	.ascii	"main.c\000"
.LASF14:
	.ascii	"GNU C11 5.2.1 20151202 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 231848] -mthumb -mcpu=cortex-m0 -g\000"
.LASF16:
	.ascii	"C:\\Users\\Dillon\\Documents\\Engineering\\Personal"
	.ascii	" Projects\\STM32F051\\Rotary Encoder\\WIP\000"
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
.LASF17:
	.ascii	"main\000"
.LASF4:
	.ascii	"long int\000"
.LASF12:
	.ascii	"current_led_val\000"
.LASF19:
	.ascii	"TIM6_IRQHandler\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF13:
	.ascii	"previous_clk_pin_state\000"
.LASF2:
	.ascii	"short int\000"
.LASF18:
	.ascii	"clk_pin_state\000"
.LASF11:
	.ascii	"sizetype\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.2.1 20151202 (release) [ARM/embedded-5-branch revision 231848]"

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
	.global	current_led_value
	.bss
	.type	current_led_value, %object
	.size	current_led_value, 1
current_led_value:
	.space	1
	.global	current_psc_val
	.data
	.align	2
	.type	current_psc_val, %object
	.size	current_psc_val, 4
current_psc_val:
	.word	4296
	.global	current_arr_val
	.align	2
	.type	current_arr_val, %object
	.size	current_arr_val, 4
current_arr_val:
	.word	558
	.text
	.align	2
	.global	main
	.code	16
	.thumb_func
	.type	main, %function
main:
.LFB0:
	.file 1 "main.c"
	.loc 1 57 0
	.cfi_startproc
	push	{r4, r5, r7, lr}
	.cfi_def_cfa_offset 16
	.cfi_offset 4, -16
	.cfi_offset 5, -12
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 60 0
	bl	lib_init_leds
	.loc 1 61 0
	bl	lib_init_adc_12bit
	.loc 1 62 0
	bl	lib_init_pot0
	.loc 1 63 0
	bl	lib_init_pot1
	.loc 1 65 0
	ldr	r3, .L3
	ldr	r4, [r3]
	bl	find_largest_pot
	movs	r3, r0
	movs	r1, r3
	movs	r0, r4
	bl	lib_init_TIM6
.L2:
	.loc 1 68 0 discriminator 1
	bl	find_largest_pot
	movs	r3, r0
	movs	r0, r3
	bl	lib_TIM6_update_ARR
	.loc 1 69 0 discriminator 1
	ldr	r3, .L3+4
	ldrb	r3, [r3]
	movs	r0, r3
	bl	lib_write_leds
	.loc 1 70 0 discriminator 1
	b	.L2
.L4:
	.align	2
.L3:
	.word	current_psc_val
	.word	current_led_value
	.cfi_endproc
.LFE0:
	.size	main, .-main
	.align	2
	.code	16
	.thumb_func
	.type	find_largest_pot, %function
find_largest_pot:
.LFB1:
	.loc 1 74 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	sub	sp, sp, #8
	.cfi_def_cfa_offset 16
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 75 0
	bl	lib_read_pot0
	movs	r3, r0
	str	r3, [r7, #4]
	.loc 1 76 0
	bl	lib_read_pot1
	movs	r3, r0
	str	r3, [r7]
	.loc 1 78 0
	ldr	r2, [r7, #4]
	ldr	r3, [r7]
	cmp	r2, r3
	bls	.L6
	.loc 1 80 0
	ldr	r3, [r7, #4]
	ldr	r2, .L8
	mov	ip, r2
	add	r3, r3, ip
	b	.L7
.L6:
	.loc 1 84 0
	ldr	r3, [r7]
	ldr	r2, .L8
	mov	ip, r2
	add	r3, r3, ip
.L7:
	.loc 1 86 0
	movs	r0, r3
	mov	sp, r7
	add	sp, sp, #8
	@ sp needed
	pop	{r7, pc}
.L9:
	.align	2
.L8:
	.word	558
	.cfi_endproc
.LFE1:
	.size	find_largest_pot, .-find_largest_pot
	.align	2
	.global	TIM6_IRQHandler
	.code	16
	.thumb_func
	.type	TIM6_IRQHandler, %function
TIM6_IRQHandler:
.LFB2:
	.loc 1 89 0
	.cfi_startproc
	push	{r7, lr}
	.cfi_def_cfa_offset 8
	.cfi_offset 7, -8
	.cfi_offset 14, -4
	add	r7, sp, #0
	.cfi_def_cfa_register 7
	.loc 1 91 0
	bl	lib_TIM6_ACK
	.loc 1 92 0
	ldr	r3, .L11
	ldrb	r3, [r3]
	adds	r3, r3, #1
	uxtb	r2, r3
	ldr	r3, .L11
	strb	r2, [r3]
	.loc 1 94 0
	nop
	mov	sp, r7
	@ sp needed
	pop	{r7, pc}
.L12:
	.align	2
.L11:
	.word	current_led_value
	.cfi_endproc
.LFE2:
	.size	TIM6_IRQHandler, .-TIM6_IRQHandler
.Letext0:
	.file 2 "c:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\machine\\_default_types.h"
	.file 3 "c:\\program files (x86)\\gnu tools arm embedded\\5.2 2015q4\\arm-none-eabi\\include\\sys\\_stdint.h"
	.section	.debug_info,"",%progbits
.Ldebug_info0:
	.4byte	0x12a
	.2byte	0x4
	.4byte	.Ldebug_abbrev0
	.byte	0x4
	.uleb128 0x1
	.4byte	.LASF19
	.byte	0xc
	.4byte	.LASF20
	.4byte	.LASF21
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
	.4byte	.LASF22
	.byte	0x1
	.byte	0x39
	.4byte	0x73
	.4byte	.LFB0
	.4byte	.LFE0-.LFB0
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x6
	.4byte	.LASF23
	.byte	0x1
	.byte	0x4a
	.4byte	0x8c
	.4byte	.LFB1
	.4byte	.LFE1-.LFB1
	.uleb128 0x1
	.byte	0x9c
	.4byte	0xe9
	.uleb128 0x7
	.4byte	.LASF14
	.byte	0x1
	.byte	0x4b
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -12
	.uleb128 0x7
	.4byte	.LASF15
	.byte	0x1
	.byte	0x4c
	.4byte	0x8c
	.uleb128 0x2
	.byte	0x91
	.sleb128 -16
	.byte	0
	.uleb128 0x8
	.4byte	.LASF24
	.byte	0x1
	.byte	0x59
	.4byte	.LFB2
	.4byte	.LFE2-.LFB2
	.uleb128 0x1
	.byte	0x9c
	.uleb128 0x9
	.4byte	.LASF16
	.byte	0x1
	.byte	0x36
	.4byte	0x81
	.uleb128 0x5
	.byte	0x3
	.4byte	current_led_value
	.uleb128 0x9
	.4byte	.LASF17
	.byte	0x1
	.byte	0x37
	.4byte	0x8c
	.uleb128 0x5
	.byte	0x3
	.4byte	current_psc_val
	.uleb128 0x9
	.4byte	.LASF18
	.byte	0x1
	.byte	0x38
	.4byte	0x8c
	.uleb128 0x5
	.byte	0x3
	.4byte	current_arr_val
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
	.byte	0x1
	.uleb128 0x3
	.uleb128 0xe
	.uleb128 0x3a
	.uleb128 0xb
	.uleb128 0x3b
	.uleb128 0xb
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
.LASF8:
	.ascii	"long long int\000"
.LASF10:
	.ascii	"unsigned int\000"
.LASF23:
	.ascii	"find_largest_pot\000"
.LASF20:
	.ascii	"main.c\000"
.LASF19:
	.ascii	"GNU C11 5.2.1 20151202 (release) [ARM/embedded-5-br"
	.ascii	"anch revision 231848] -mthumb -mcpu=cortex-m0 -g\000"
.LASF6:
	.ascii	"__uint32_t\000"
.LASF17:
	.ascii	"current_psc_val\000"
.LASF7:
	.ascii	"long unsigned int\000"
.LASF9:
	.ascii	"long long unsigned int\000"
.LASF5:
	.ascii	"__uint8_t\000"
.LASF14:
	.ascii	"pot0_reading\000"
.LASF11:
	.ascii	"uint8_t\000"
.LASF1:
	.ascii	"unsigned char\000"
.LASF22:
	.ascii	"main\000"
.LASF12:
	.ascii	"uint32_t\000"
.LASF4:
	.ascii	"long int\000"
.LASF16:
	.ascii	"current_led_value\000"
.LASF24:
	.ascii	"TIM6_IRQHandler\000"
.LASF3:
	.ascii	"short unsigned int\000"
.LASF0:
	.ascii	"signed char\000"
.LASF15:
	.ascii	"pot1_reading\000"
.LASF21:
	.ascii	"C:\\Users\\Dillon\\Documents\\Engineering\\Universi"
	.ascii	"ty\\2016\\2nd Semester\\Micros\\Projects\\Prac 8\\P"
	.ascii	"art 3\000"
.LASF2:
	.ascii	"short int\000"
.LASF18:
	.ascii	"current_arr_val\000"
.LASF13:
	.ascii	"sizetype\000"
	.ident	"GCC: (GNU Tools for ARM Embedded Processors) 5.2.1 20151202 (release) [ARM/embedded-5-branch revision 231848]"

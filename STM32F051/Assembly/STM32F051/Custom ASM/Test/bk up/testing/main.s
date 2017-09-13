@STDNUM001 STDNUM002
	.syntax unified
	.cpu cortex-m0
	.thumb
	.global _start

vectors:
	.word 0x20002000
	.word _start + 1

_start:
	@ enable peripheral
main_loop:

	B main_loop
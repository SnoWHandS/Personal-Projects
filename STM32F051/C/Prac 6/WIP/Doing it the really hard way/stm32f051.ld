ENTRY(_start)

MEMORY
{
	FLASH (rx)	: ORIGIN = 0x08000000, LENGTH = 0x08000 /* 32KiB */
	RAM (xrw)	: ORIGIN = 0x20000000, LENGTH = 0x02000 /*8KiB */
}

/* Define output sections */
SECTIONS
{
	/* The vectors must be placed first in FLASH */
	.isr_vectors : { KEEP(*(.isr_vectors)) } > FLASH
	
	/* Program code and literals go after vectors in FLASH */
	.text : { *(.text) } > FLASH	
}
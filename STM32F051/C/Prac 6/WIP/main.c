// Import basic types (uint32_t, int8_t . . .)
#include <stdint.h>

//Global Variables 
#define RCC_AHBENR ((uint32_t)0x40021014)
#define GPIOA_MODE ((uint32_t)0x48000000)
#define GPIOA_PUPD ((uint32_t)0x4800000C)
#define GPIOB_MODE ((uint32_t)0x48000400)
#define GPIOB_OUT ((uint16_t)0x48000414)

//Prototypes
//void delay(int delay_time)

int main(void)
{
	RCC_AHBENR |= 0x40000;			//Enables GPIO A and B clocks
	GPIOA_MODE |= 0x3C00;			//Enables switches and pots
	GPIOA_PUPD |= 0x55;				//Set switches to pull-up
	GPIOB_MODE |= 0x5555;			//Enables LEDs as outputs
	GPIOB_OUT = 0xAA;
	
	while (1)
	{
		
	}
	
	return 0;
}

/*void delay(int delay_time)
{
	uint8_t cnts_of_mem = 0;		//Initalise counter variable
	while(cnts_of_mem < delay_time)
	{
		//increment contents of memory address
		cnts_of_mem ++;
	}
}*/





/*RCC_BASE: 			.word 0x40021000
GPIOA_BASE: 		.word 0x48000000
GPIOB_BASE: 		.word 0x48000400
AHBENR_GPIOPABEN: 	.word 0b11 << 17
APB2ENR_ADCEN: 		.word 0b1 << 9
APB1ENR_TIM6EN: 	.word 0b1 << 4
GPIOA_BUTTONS_INPUTS_MASK_OUT: .word 0xFFFFFFF0
GPIOA_POTS_ANALOGUE_MASK_IN: .word 0x3C00
GPIOB_LEDS_OUTPUTS_MASK_OUT: .word 0xFFFF0000
GPIOB_LEDS_OUTPUTS_MASK_IN:  .word 0x5555*/

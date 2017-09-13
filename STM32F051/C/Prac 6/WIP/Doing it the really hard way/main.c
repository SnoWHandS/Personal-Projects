// Import basic types (uint32_t, int8_t . . .)
#include <stdint.h>

//Global Variables 
#define RCC_AHBENR (*(uint32_t*)0x40021014)
#define GPIOA_MODE (*(uint32_t*)0x48000000)
#define GPIOA_PUPD (*(uint32_t*)0x4800000C)
#define GPIOA_IN (*(uint8_t*)0x48000010)
#define GPIOB_MODE (*(uint32_t*)0x48000400)
#define GPIOB_OUT (*(uint16_t*)0x48000414)
#define DELAY_COUNTER (*(uint32_t*)0x200000F0)

//Prototypes
void delay(void);

int main(void)
{
	//Init
	RCC_AHBENR |= 0x60000;			//Enables GPIO A and B clocks
	GPIOA_MODE |= 0x3C00;			//Enables switches and pots
	GPIOA_PUPD |= 0x55;				//Set switches to pull-up
	GPIOB_MODE |= 0x5555;			//Enables LEDs as outputs
	
	//delay, incremment, write
	while (1)
	{
		while((GPIOA_IN & 0b10) == 0)
		{
			//Do nothing
		}
		GPIOB_OUT = 0xAA;
		delay();
		
		while((GPIOA_IN & 0b10) == 0)
		{
			//Do nothing
		}
		GPIOB_OUT = 0xFF;
		delay();
		
		while((GPIOA_IN & 0b10) == 0)
		{
			//Do nothing
		}
		GPIOB_OUT = 0x55;
		delay();
		
		while((GPIOA_IN & 0b10) == 0)
		{
			//Do nothing
		}
		GPIOB_OUT = 0x00;
		delay();
	}
	
	return 0;
}

void delay(void)
{
	DELAY_COUNTER = 550000;		//Initalise counter variable
	while(DELAY_COUNTER > 0)
	{
		//decrement contents of memory address
		DELAY_COUNTER --;
	}
}
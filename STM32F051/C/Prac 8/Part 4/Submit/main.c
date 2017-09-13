// HLDDIL001
//Test

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h" 
#include "libs.h"

/*Prototypes
void lib_init_leds(void);
void lib_write_leds(uint8_t led_val);
uint8_t lib_read_leds(void);
void lib_init_buttons();
int lib_read_button_0(void);
int lib_read_button_1(void);
int lib_read_button_2(void);
int lib_read_button_3(void);
int lib_read_falling_edge_button0(void);
int lib_read_falling_edge_button1(void);
int lib_read_falling_edge_button2(void);
int lib_read_falling_edge_button3(void);
int lib_read_rising_edge_button0(void);
int lib_read_rising_edge_button1(void);
int lib_read_rising_edge_button2(void);
int lib_read_rising_edge_button3(void);
void lib_init_adc_6bit(void);
void lib_init_adc_8bit(void);
void lib_init_adc_10bit(void);
void lib_init_adc_12bit(void);
void lib_adc_cal(void);
void lib_init_pot0(void);
void lib_init_pot1(void);
uint8_t lib_read_pot0(void);
uint8_t lib_read_pot1(void);
void lib_init_TIM6(uint32_t prescaler, uint32_t arr);
void lib_TIM6_update_ARR(uint32_t arr);
void lib_TIM6_update_PSC(uint32_t psc);
void lib_TIM6_ACK(void);
void delay_ms(uint32_t count);
void delay_us(uint32_t delay);


//None hardware control functions
void libs_quicksort(int32_t* a,uint32_t lo, uint32_t hi);
uint32_t partition(int32_t* a,uint32_t lo, uint32_t hi);
*/

//Prototypes
 
 
uint8_t current_led_value = 0x00;

// DO NOT CHANGE THIS ARRAY. The marker will change the values but *not* the length at compile time. 
static uint8_t led_patterns[] = {0x00, 0x81, 0xC3, 0xE7, 0xFF, 0x7E, 0x3C, 0x18, 0x00};

int main(void) {
	   
    // All other initialisations
	lib_init_leds();
	lib_init_adc_8bit();
	lib_init_pot0();	
	
	uint8_t current_adc_val = 0;
	
    while(1) {
		// sample POT0 and display the pattern at the index proportional to the output voltage.
		current_adc_val = lib_read_pot0();
		
		if(current_adc_val >=224){
			lib_write_leds(led_patterns[8]);
		}
		else if (current_adc_val >= 196){
			lib_write_leds(led_patterns[7]);
		}
		else if (current_adc_val >= 168){
			lib_write_leds(led_patterns[6]);
		}
		else if (current_adc_val >= 140){
			lib_write_leds(led_patterns[5]);
		}
		else if (current_adc_val >= 112){
			lib_write_leds(led_patterns[4]);
		}
		else if (current_adc_val >= 84){
			lib_write_leds(led_patterns[3]);
		}
		else if (current_adc_val >= 56){
			lib_write_leds(led_patterns[2]);
		}
		else if (current_adc_val >= 28){
			lib_write_leds(led_patterns[1]);
		}
		else if (current_adc_val >= 0){
			lib_write_leds(led_patterns[0]);
		}
		
		/*
		switch(current_adc_val){
			
			case 204: 
						lib_write_leds(led_patterns[8]);
						break;
			case 186: 
						lib_write_leds(led_patterns[7]);
						break;
			case 158: 
						lib_write_leds(led_patterns[6]);
						break;
			case 130: 
						lib_write_leds(led_patterns[5]);
						break;
			case 102: 
						lib_write_leds(led_patterns[4]);
						break;
			case 84: 
						lib_write_leds(led_patterns[3]);
						break;
			case 56: 
						lib_write_leds(led_patterns[2]);
						break;
			case 28: 
						lib_write_leds(led_patterns[1]);
						break;
			case 0: 
						lib_write_leds(led_patterns[0]);
						break;	
			default:
						break;
		}
		
		if(current_adc_val&&0b10000000){
			lib_write_leds(0b10000000);
			return;
		}
		if(current_adc_val&&0b01000000){
			lib_write_leds(0b01000000);
			return;
		}
		if(current_adc_val&&0b00100000){
			lib_write_leds(0b00100000);
			return;
		}
		if(current_adc_val&&0b00010000){
			lib_write_leds(0b00010000);
			return;
		}
		if(current_adc_val&&0b00001000){
			lib_write_leds(0b00001000);
			return;
		}
		if(current_adc_val&&0b00000100){
			lib_write_leds(0b00000100);
			return;
		}
		if(current_adc_val&&0b00000010){
			lib_write_leds(0b00000010);
			return;
		}
		if(current_adc_val&&0b00000001){
			lib_write_leds(0b000000001);
			return;
		}
		if(current_adc_val&&0b00000000){
			lib_write_leds(0b00000000);
			return;
		}
		*/
	}
    return 0;  // keep compiler happy with a return code.
}


// ISR: TIM6_IRQHandler
void TIM6_IRQHandler(void) {
	//ACK the interrupt
	lib_TIM6_ACK();
		//Do stuff
}

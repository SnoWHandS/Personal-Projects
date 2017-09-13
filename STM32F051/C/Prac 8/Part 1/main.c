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
 
 
uint8_t current_led_value = 0x0A;
int main(void) {
	   
    // All other initialisations
	lib_init_leds();
	lib_init_buttons();
		
    while(1) {
		if(lib_read_rising_edge_button0()){
			//debounce internally
			delay_ms(10);
			//increment value
			current_led_value++;
		}
		lib_write_leds(current_led_value);
	}
    return 0;  // keep compiler happy with a return code.

}

// ISR: TIM6_IRQHandler (for the future :) )
void TIM6_IRQHandler(void) {
	//ACK the interrupt
	//lib_TIM6_ACK();
	//current_led_value++;
	//lib_write_leds(current_led_value);
		//Do stuff
}

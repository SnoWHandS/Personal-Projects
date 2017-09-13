// HLDDIL001
//Test

#include <stdint.h>
#define STM32F051
#define DEFAULT_PSC 4296
#define ARR_OFFSET 558
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
static uint32_t find_largest_pot();
 
 
uint8_t current_led_value = 0x00;
uint32_t current_psc_val = DEFAULT_PSC;
uint32_t current_arr_val = ARR_OFFSET;
int main(void) {
	   
    // All other initialisations
	lib_init_leds();
	lib_init_adc_12bit();
	lib_init_pot0();
	lib_init_pot1();
	
	lib_init_TIM6(current_psc_val, find_largest_pot());
		
    while(1) {
		lib_TIM6_update_ARR(find_largest_pot());
		lib_write_leds(current_led_value);
	}
    return 0;  // keep compiler happy with a return code.
}

static uint32_t find_largest_pot(){
	uint32_t pot0_reading = lib_read_pot0();
	uint32_t pot1_reading = lib_read_pot1();
	
	if(pot0_reading>pot1_reading){
		//update ARR in favor of pot0
		return ARR_OFFSET+pot0_reading;
	}
	else{
		//update ARR in favor of pot1
		return ARR_OFFSET+pot1_reading;
	}
}

// ISR: TIM6_IRQHandler
void TIM6_IRQHandler(void) {
	//ACK the interrupt
	lib_TIM6_ACK();
	current_led_value++;
		//Do stuff
}

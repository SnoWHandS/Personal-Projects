// HLDDIL001
// Prac Exam 1 Part 1 Template 2017-10-18

#include <stdint.h>
#include <stdlib.h>
#define STM32F051
#include "stm32f0xx.h"  // you can remove this if you're not using it
#include "libs.h"  // include library header file(s) here if appropriate.

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
uint16_t lib_read_pot0(void);
uint16_t lib_read_pot1(void);
void lib_init_TIM6(uint32_t prescaler, uint32_t arr);
void lib_TIM6_update_ARR(uint32_t arr);
void lib_TIM6_update_PSC(uint32_t psc);
void lib_TIM6_ACK(void);
void delay_ms(uint32_t count);
void delay_us(uint32_t delay);

//None hardware control functions

//Find min val of uint8 array
uint8_t lib_find_min_uint8(uint8_t* a, uint32_t len);

//Find max val of uint8 array
uint8_t lib_find_max_uint8(uint8_t* a, uint32_t len);

//Quicksort array 
void lib_quicksort(int32_t* a,uint32_t lo, uint32_t hi);

//Helper don't call!
uint32_t partition(int32_t* a,uint32_t lo, uint32_t hi);


*/

// DO NOT CHANGE THIS ARRAY. The marker will change the values *AND LENGTH* at compile time.
int8_t myArray[] = {0x48, 0x8c, 0xb6, 0x97, 0x56, 0x8b, 0x8e, 0x9d, 0x01, 
	0xd9, 0x4e, 0x69, 0x20, 0x8d, 0x5a, 0xfe, 0x46, 0xea, 0xaa, 0x58}; 

int main(void) {
    // Initialisations 
    lib_init_buttons();
	lib_init_leds();
	
	uint32_t arr_len = sizeof(myArray)/sizeof(myArray[0]);
    // Find max and min
    int8_t max = lib_find_max_int8(myArray, arr_len);
	int8_t min = lib_find_min_int8(myArray, arr_len);
	
	// |max + min| and max + min
	
	int8_t max_plus_min = max+min;
	int8_t max_plus_min_abs = abs(max_plus_min);
	
	uint8_t flag1 = 0;
    // hang in an infinite loop
    while(1) {
		
		// Toggle on SWO presses between
		if(lib_read_falling_edge_button0()){
			
			if(flag1== 0){
				lib_write_leds(max_plus_min_abs);
				flag1 = 1;
			}
			else if (flag1 == 1){
				lib_write_leds(max_plus_min);
				flag1 = 0;
			}
		
		}
		// Debounce at 20ms
		delay_ms(20);
		
    }
    return 0;  // keep compiler happy with a return code.

}

void TIM6_IRQHandler(void){
	
}

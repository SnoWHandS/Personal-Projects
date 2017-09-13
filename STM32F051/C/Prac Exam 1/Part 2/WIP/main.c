// STDNUM001
// Prac Exam 1 Part 2 Template 2017-01-18

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h"  // you can remove this if you're not using it
#include "libs.h"    // include library header file(s) here if appropriate.

// DO NOT CHANGE THIS ARRAY. The marker will change the values at compile time.
uint8_t myArray[] = {0x7b, 0x18, 0x3f, 0x21, 0x02, 0x70, 0x06, 0xff};

int main(void) {
    // initialisations here
    lib_init_leds();
	lib_init_adc_8bit();
	lib_init_pot0();	
	
	uint8_t current_adc_val = 0;
    // hang in an infinite loop
    while(1) {
		current_adc_val = lib_read_pot0();
		
		if(current_adc_val >=128){
			lib_write_leds(lib_read_pot0());
		}
		else if (current_adc_val >= 112){
			lib_write_leds(myArray[7]);
		}
		else if (current_adc_val >= 96){
			lib_write_leds(myArray[6]);
		}
		else if (current_adc_val >= 80){
			lib_write_leds(myArray[5]);
		}
		else if (current_adc_val >= 64){
			lib_write_leds(myArray[4]);
		}
		else if (current_adc_val >= 48){
			lib_write_leds(myArray[3]);
		}
		else if (current_adc_val >= 32){
			lib_write_leds(myArray[2]);
		}
		else if (current_adc_val >= 16){
			lib_write_leds(myArray[1]);
		}
		else if (current_adc_val >= 0){
			lib_write_leds(myArray[0]);
		}
    
    }
    return 0;  // keep compiler happy with a return code.

}


// ISR: TIM6_IRQHandler
void TIM6_IRQHandler(void) {
	//ACK the interrupt
	lib_TIM6_ACK();
		//Do stuff
}

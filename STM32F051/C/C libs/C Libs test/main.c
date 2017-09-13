// HLDDIL001
//Test

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h" 
#include "libs.h"
 
uint8_t current_led_value = 0x00;
int main(void) {
	   
    // All other initialisations
	lib_init_leds();
	lib_init_buttons();
	lib_init_pot0();
	//lib_adc_cal(); 		
							/*this cal seems to break the adc and stop it from completing
							conversions, run it once, then comment out and reupload */
	lib_init_adc_8bit();
	//lib_init_TIM6(1999, 1999);
	
    while(1) {
		//Testing delay_ms
		/*lib_write_leds(0x1);
		delay_ms(10);
		lib_write_leds(0x00);
		delay_ms(10);*/
		
		//Testing delay_us
		lib_write_leds(0x1);
		delay_us(10);
		lib_write_leds(0x00);
		delay_us(10);
	}
    return 0;  // keep compiler happy with a return code.

}

// ISR: TIM6_IRQHandler
void TIM6_IRQHandler(void) {
	//ACK the interrupt
	//lib_TIM6_ACK();
	//current_led_value++;
	//lib_write_leds(current_led_value);
		//Do stuff
}

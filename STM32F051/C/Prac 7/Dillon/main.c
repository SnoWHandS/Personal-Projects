// HLDDIL001
// Prac7

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h"  // you can remove this if you're not using it
#include "libs.h"
 

// change this function prototype to take appropriate arguments.
void find_best_pair(void);  

// DO NOT CHANGE THESE ARRAYS. The marker will change the values *AND LENGTH* at compile time. 
uint8_t patterns0[] = {0x7b, 0x18, 0x3f, 0x21, 0x02, 0x70, 0x06, 0x0c, 0x7d, 0x31, 0x4d, 0x73};
uint8_t patterns1[] = {0x00, 0x01, 0x02, 0x05, 0x0A, 0x15, 0x2A, 0x55};
int32_t outOfOrder[] = {0x26d, 0x309, 0xc73, 0xc42, 0xe1f, 0x235, 0x166, 0x2ef, 0xcf5};

int main(void) {
	
	// Allocate two pointers. These pointers should be set to point to the largest
	// and smallest element in either array. 
	// At marking time, it is possible that the smallest element is in pattens0 and 
	// the largest in patterns1 (or vice versa). It is also possible that the smallest 
	// and largest elements are in one array.
    uint8_t *largest_of_the_two_ptr;
    uint8_t *smallest_of_the_two_ptr;
    
    //Implement as needed
    find_best_pair();
   
    //Implement Part 2 before entering the while loop.
    
    // All other initialisations
	lib_init_leds();
	lib_init_buttons();
	lib_init_pot0();
	//lib_adc_cal(); 		
							/*this cal seems to break the adc and stop it from completing
							conversions, run it once, then comment out and reupload */
	lib_init_adc_8bit();
	
	lib_write_leds(0x00);
	
    while(1) {
		//Implement Parts 3 and 4
		
		
		//Part 4
		if(lib_read_button_2()){
			uint8_t pot0_value = 255 - lib_read_pot0();
			lib_write_leds(pot0_value);
		}
    }
    return 0;  // keep compiler happy with a return code.

}

// Change arguments as required, but don't change return type!
void find_best_pair(void) {
    // Implement as needed
}

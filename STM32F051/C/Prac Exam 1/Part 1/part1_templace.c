// STDNUM001
// Prac Exam 1 Part 1 Template 2017-10-18

#include <stdint.h>
#include <stdlib.h>
#define STM32F051
#include "stm32f0xx.h"  // you can remove this if you're not using it
#include "libs.h"  // include library header file(s) here if appropriate.

// DO NOT CHANGE THIS ARRAY. The marker will change the values *AND LENGTH* at compile time.
int8_t myArray[] = {0x48, 0x8c, 0xb6, 0x97, 0x56, 0x8b, 0x8e, 0x9d, 0x01, 
	0xd9, 0x4e, 0x69, 0x20, 0x8d, 0x5a, 0xfe, 0x46, 0xea, 0xaa, 0x58}; 

int main(void) {
    // Initialisations 
    
    // Find max and min
    
    // hang in an infinite loop
    while(1) {
		
		// Toggle on SWO presses between
		// |max + min| and max + min
		// Debounce at 20ms
		
    }
    return 0;  // keep compiler happy with a return code.

}

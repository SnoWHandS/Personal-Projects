// HYLMUH001
// Prac Exam 1 Part 2 Solution 2015-10-16

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h"
#include "libs.h"

// DO NOT CHANGE THIS ARRAY. The marker will change the values *AND LENGTH* at compile time. 
uint8_t myArray[] = {0x42, 0x69, 0x12, 0xCC, 0xBB, 0x55, 0xA1, 0x33, 0x1A, 0xDF, 0x56};

int main(void) {
    // initialisations here
    lib_init_leds();
    lib_init_buttons();
    uint32_t arr_len = sizeof(myArray)/sizeof(myArray[0]);

    // suggestion: find and store the largest value and smallest value in the array here.
    uint8_t min = lib_find_min_uint8(myArray, arr_len);
    uint8_t max = lib_find_max_uint8(myArray, arr_len);
    // hang in an infinite loop
    while(1) {
        // if SW0 not held, display largest value from array.
        // if SW0 is held, display smallest value from array.
        if(lib_read_button_0()){
            lib_write_leds(min);
        }
        else{
            lib_write_leds(max);
        }
    }
    return 0;  // keep compiler happy with a return code.

}

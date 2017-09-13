// HLDDIL001
// Prac7

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h"  // you can remove this if you're not using it
#include "libs.h"
 

// change this function prototype to take appropriate arguments.
void find_best_pair(uint8_t* a0, uint8_t* a1, uint32_t len_a0, uint32_t len_a1, uint32_t *max_pntr, uint32_t *min_ptr);  

/**
 * Returns index of largest element of an array of unsigned 8 bits
 * Arguments the array, and the length of the array
 */
uint32_t math_max_index_arr_uint8_t(uint8_t* arr, uint32_t len);

/**
 * Returns index of smallest element of an array of unsigned 8 bits
 * Arguments the array, and the length of the array
 */
uint32_t math_min_index_arr_uint8_t(uint8_t* arr, uint32_t len);


// DO NOT CHANGE THESE ARRAYS. The marker will change the values *AND LENGTH* at compile time. 
uint8_t patterns0[] = {0x7b, 0x18, 0x3f, 0x21, 0x02, 0x70, 0x06, 0x0c, 0x7d, 0x31, 0x4d, 0x73};
uint8_t patterns1[] = {0x00, 0x01, 0x02, 0x05, 0x0A, 0x15, 0x2A, 0x55};
int32_t outOfOrder[] = {0x26d, 0x309, 0xc73, 0xc42, 0xe1f, 0x235, 0x166, 0x2ef, 0xcf5};

//nice and global
	uint32_t max_index = 0;
    uint32_t max_counter;
	uint32_t min_index = 0;
    uint32_t min_counter;

int main(void) {
	
	// Allocate two pointers. These pointers should be set to point to the largest
	// and smallest element in either array. 
	// At marking time, it is possible that the smallest element is in pattens0 and 
	// the largest in patterns1 (or vice versa). It is also possible that the smallest 
	// and largest elements are in one array.
    uint8_t *largest_of_the_two_ptr;
    uint8_t *smallest_of_the_two_ptr;
	int pattern_0_length = sizeof(patterns0)/sizeof(patterns0[0]);
	int pattern_1_length = sizeof(patterns1)/sizeof(patterns1[0]);
    
    //Implement as needed
	find_best_pair(patterns0, patterns1, pattern_0_length, pattern_1_length, largest_of_the_two_ptr, smallest_of_the_two_ptr);
    
    //Implement Part 2 before entering the while loop.
    libs_quicksort(outOfOrder, 0, ( sizeof(outOfOrder)/sizeof(outOfOrder[0]) ) - 1);
	
    // All other initialisations
	lib_init_leds();
	lib_init_buttons();
	lib_init_pot0();
	//lib_adc_cal(); 		
							/*this cal seems to break the adc and stop it from completing
							conversions, run it once, then comment out and reupload */
	lib_init_adc_8bit();
	
	lib_write_leds(0x00);
	
	
	int count_pat_1 = 0;	
	int count_pat_0 = 0;
	
    while(1) {

		//Implement Parts 3 and 4
		if(lib_read_falling_edge_button0()){
			if(count_pat_0 <= pattern_0_length-1){
				lib_write_leds(patterns0[count_pat_0]);
				count_pat_0++;
			}
			else{
				count_pat_0 = 0;
			}
		}
		
		if(lib_read_falling_edge_button1()){
			if(count_pat_1 <= pattern_1_length-1){
				lib_write_leds(patterns1[count_pat_1]);
				count_pat_1++;
			}
			else{
				count_pat_1 = 0;
			}
		}

		
		//Part 4
		if(lib_read_button_2()){
			uint8_t pot0_value = 255 - lib_read_pot0();
			lib_write_leds(pot0_value);
		}
				delay_ms(10);		//for debounce
    }
    return 0;  // keep compiler happy with a return code.

}

// Change arguments as required, but don't change return type!
void find_best_pair(uint8_t *array0, uint8_t *array1, uint32_t l_a0, uint32_t l_a1, uint32_t *max_pntr, uint32_t *min_pntr){
    uint32_t max_index_arr0 = math_max_index_arr_uint8_t( array0, l_a0 );

    uint32_t max_index_arr1 = math_max_index_arr_uint8_t( array1, l_a1 ) ;

    uint32_t min_index_arr0 = math_min_index_arr_uint8_t( array0, l_a0 );

    uint32_t min_index_arr1 = math_min_index_arr_uint8_t( array1, l_a1 );

    if(array0[max_index_arr0] >= array1[max_index_arr1]){
        max_pntr = &array0[ max_index_arr0 ];
    }
    else{
        max_pntr = &array1[ max_index_arr1 ];
    }

    if(array0[min_index_arr0] <= array1[min_index_arr1]){
        min_pntr = &array0[ min_index_arr0 ];
    }
    else{
        min_pntr = &array1[ min_index_arr1 ];
    }
}

uint32_t math_max_index_arr_uint8_t(uint8_t* arr, uint32_t len){

    for(max_counter = 0; max_counter < len; max_counter++){
        if(arr[max_counter] >= arr[max_index]){
            max_index = max_counter;
        }
    }
    return max_index;
}


uint32_t math_min_index_arr_uint8_t(uint8_t* arr, uint32_t len){

    for( min_counter = 0; min_counter < len; min_counter++){
        if(arr[min_counter] <= arr[min_index]){
            min_index = min_counter;
        }
    }
    return min_index;
}
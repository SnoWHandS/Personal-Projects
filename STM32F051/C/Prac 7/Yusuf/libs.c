#include "libs.h"
#define STM32F051
#include "stm32f0xx.h"


void libs_sample_function(void) {
    //does nothing. 
}


/**
 * Insort a int32 array using quicksort algorithm.
 * Based on Lomuto partion scheme.
 */
void libs_quicksort(int32_t* a,uint32_t lo, uint32_t hi) {
    if( lo < hi) {
        uint32_t p = partition(a, lo, hi);
        libs_quicksort(a, lo, p - 1);
        libs_quicksort(a, p + 1, hi);
    }
}

//Helper function for quicksort
uint32_t partition(int32_t* a,uint32_t lo, uint32_t hi){
    int32_t pivot = a[hi];
    uint32_t i = lo;
    uint32_t j;
    for(j = lo; j < (hi - 1); j++){
        if(a[j] <= pivot){
            int32_t tmp = a[i];
            a[i] = a[j];
            a[j] = tmp;
            i++;
        }
    }
    int32_t tmp2 = a[i];
    a[i] = a[hi];
    a[hi] = tmp2;
    return i;
}








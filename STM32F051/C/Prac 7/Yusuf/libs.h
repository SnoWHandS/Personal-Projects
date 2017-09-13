#ifndef __LIBS_H_
#define __LIBS_H_

#include <stdint.h>

//Prototypes
void libs_sample_function(void);
void libs_quicksort(int32_t* a, uint32_t lo, uint32_t hi);  
uint32_t partition(int32_t* arr, uint32_t low, uint32_t high);

#endif

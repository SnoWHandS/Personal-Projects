// HLDDIL001
//Test

#include <stdint.h>
#define STM32F051
#include "stm32f0xx.h" 
#include "libs.h"
#define OFFSET 50
#define PSC 62799

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
//Prototypes

void lock_crystal(void);
void unlock_crystal(void);
void toggle_LED_many_times(const uint32_t times_to_toggle);


int main(void) {
	   
    // All other initialisations
	lib_init_leds();
	lib_write_leds(0x1);
		lock_crystal();
	
    while(1) {
		//toggle_LED_many_times(200000);
		toggle_LED_many_times(200000);
		//unlock_crystal();
	}
    return 0;  // keep compiler happy with a return code.
}



void lock_crystal(void) {
  RCC->CR |= RCC_CR_HSEON; // enable HSE
  while(!(RCC->CR & RCC_CR_HSERDY)); // hange here until HSE ready
  // the following adds a wait state to Flash reads and enables the prefetch buffer. This may or may not be necessary...
  FLASH->ACR = FLASH_ACR_PRFTBE | FLASH_ACR_LATENCY;
  RCC->CFGR |= RCC_CFGR_PLLMULL6; // PLLCLK = HSE *  = 8 * 6 = 24 MHz = maximum
  RCC->CFGR |= RCC_CFGR_PLLSRC_HSE_PREDIV; // select HSE as source for PLL
  RCC->CR |= RCC_CR_PLLON; // enable the PLL
  while(!(RCC->CR & RCC_CR_PLLRDY)); // hang here until PLL ready
  RCC->CFGR |= RCC_CFGR_SW_PLL; // SYSCLK sourced from PLL
  while(!(RCC->CFGR & RCC_CFGR_SWS_PLL)); // hang until SYSLK switched
}

void unlock_crystal(void) {
  RCC->CFGR &= ~RCC_CFGR_SW; // clear the SYSCLK selection bits, causing SYSCLK to be sourced from HSI
  while(RCC->CFGR & RCC_CFGR_SWS_PLL); // hang until SYSLK no longer PLL
  RCC->CR &= ~RCC_CR_HSEON;
}

void toggle_LED_many_times(const uint32_t times_to_toggle) {
  for(uint32_t counter = 0; counter < times_to_toggle; counter++) {
    GPIOB->BSRR |= GPIO_BSRR_BS_0;
    GPIOB->BSRR |= GPIO_BSRR_BR_0;
  }
}


// ISR: TIM6_IRQHandler
void TIM6_IRQHandler(void) {
	//ACK the interrupt
	lib_TIM6_ACK();
		//Do stuff
}

// ISR: TIM14_IRQHandler
void TIM14_IRQHandler(void) {
	//ACK the interrupt
	lib_TIM14_ACK();
		//Do stuff
}

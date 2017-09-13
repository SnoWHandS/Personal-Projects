#define STM32F051

#include <stdint.h>
#include "stm32f0xx.h"

// This projects demonstrates PWM on the RG LED
// Red:   PB10, TIM2_CH3
// Green: PB11, TIM2_CH4
// Both run on AF2

void init_timer(void);
void lock_crystal(void);

void main(void) {
	lock_crystal();
	init_timer();
	for(;;);
}

void init_timer(void) {
  RCC->AHBENR |= RCC_AHBENR_GPIOBEN;
  RCC->APB1ENR |= RCC_APB1ENR_TIM2EN;

  GPIOB->MODER |= GPIO_MODER_MODER10_1; // PB10 = AF
  GPIOB->MODER |= GPIO_MODER_MODER11_1; // PB11 = AF
  GPIOB->AFR[1] |= (2 << (4*(10 - 8))); // PB10_AF = AF2 (ie: map to TIM2_CH3)
  GPIOB->AFR[1] |= (2 << (4*(11 - 8))); // PB11_AF = AF2 (ie: map to TIM2_CH4)

  TIM2->ARR = 1;  // f = 1 KHz
  // specify PWM mode: OCxM bits in CCMRx. We want mode 1
  TIM2->CCMR2 |= (TIM_CCMR2_OC3M_2 | TIM_CCMR2_OC3M_1); // PWM Mode 1
  TIM2->CCMR2 |= (TIM_CCMR2_OC4M_2 | TIM_CCMR2_OC4M_1); // PWM Mode 1 
  // set PWM percantages
  TIM2->CCR3 = 50; // Red = 20%
  TIM2->CCR4 = 90 * 80; // Green = 90%

  // enable the OC channels
  TIM2->CCER |= TIM_CCER_CC3E;
  TIM2->CCER |= TIM_CCER_CC4E;

  TIM2->CR1 |= TIM_CR1_CEN; // counter enable
}

void lock_crystal(void) {
  RCC->CR |= RCC_CR_HSEON; // enable HSE
  while(!(RCC->CR & RCC_CR_HSERDY)); // hange here until HSE ready
  // the following adds a wait state to Flash reads and enables the prefetch buffer. This may or may not be necessary...
  FLASH->ACR = FLASH_ACR_PRFTBE | FLASH_ACR_LATENCY;
  RCC->CFGR |= RCC_CFGR_PLLMULL6; // PLLCLK = HSE * 6 = 8 * 6 = 48 MHz = maximum
  RCC->CFGR |= RCC_CFGR_PLLSRC_HSE_PREDIV; // select HSE as source for PLL
  RCC->CR |= RCC_CR_PLLON; // enable the PLL
  while(!(RCC->CR & RCC_CR_PLLRDY)); // hang here until PLL ready
  RCC->CFGR |= RCC_CFGR_SW_PLL; // SYSCLK sourced from PLL
  while(!(RCC->CFGR & RCC_CFGR_SWS_PLL)); // hang until SYSLK switched
}
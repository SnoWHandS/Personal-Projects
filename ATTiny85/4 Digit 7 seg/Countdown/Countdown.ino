#include "LedControl.h"
LedControl lc=LedControl(0,1,2,4);

//Global Variables
int countdownTime = 242;

void setup() 
{
  lc.shutdown(0,false);
  /* Set the brightness to a medium values*/
  lc.setIntensity(0,0);
  /* and clear the display */
  lc.clearDisplay(0);
}

void loop()
{
  countdown(countdownTime);
}

void toDisplay(int digit0, int digit1, int digit2, int digit3)
{
  lc.setDigit(0,0,digit0,false);
  lc.setDigit(0,1,digit1,false);
  lc.setDigit(0,2,digit2,false);
  lc.setDigit(0,3,digit3,false);
}

void countdown(int seconds)
{
  while(seconds>=0)
  {
    seconds--;
    toDisplay(seconds/600,seconds/60,(seconds/10)%10,seconds%10);
    delay(1000);
  }
}

void settingCountdown()
{
  
}


#include "LedControl.h"

LedControl lc=LedControl(12,11,10,4);

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
  lc.setDigit(0,0,1,false);
  lc.setDigit(0,1,2,false);
  lc.setDigit(0,2,3,false);
  lc.setDigit(0,3,4,false);
}

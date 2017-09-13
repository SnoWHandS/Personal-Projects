#include "LedControl.h"

LedControl lc=LedControl(12,11,10,4);
//float tempK, tempC, tempF, temp;

void setup() {
 
  lc.shutdown(0,false);
  /* Set the brightness to a medium values
  lc.setIntensity(0,8);*/
  /* and clear the display */
  lc.clearDisplay(0);
}
void loop()

{
  displayTemp();
}

void displayTemp(float tempC)
{
  readTemp(float tempC);
  
  updateDisp();
  
  clearDisp();
}

void clearDisp() //Clear the display with this function
{
  lc.clearDisplay(0);
}

void updateDisp() //Update the display with this function
{
  lc.setDigit(0, 0, 8, false); // Displays tens of temperature
  lc.setDigit(0, 1, 8, true); // Displays units of tempurature
  lc.setDigit(0, 2, 8, false); // Displays tens of decimal place for temperature
  lc.setDigit(0, 3, 8, false); // Displays units of decimal place for tempurature
}

float readTemp(float temp C)
{
  
}*/

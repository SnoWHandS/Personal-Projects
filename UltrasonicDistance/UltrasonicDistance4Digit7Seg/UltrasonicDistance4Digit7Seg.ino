#include <Ultrasonic.h>
#include "LedControl.h"

LedControl lc=LedControl(12,11,10,4);
#define TRIGGER_PIN  7
#define ECHO_PIN     6


Ultrasonic ultrasonic(TRIGGER_PIN, ECHO_PIN);

void setup()
  {
  //Serial.begin(9600);
  lc.shutdown(0,false);
  /* Set the brightness to a medium values*/
  lc.setIntensity(0,8);
  /* and clear the display */
  lc.clearDisplay(0);
  }

void loop()
  {
  float cmMsec;
  long microsec = ultrasonic.timing();
  cmMsec = ultrasonic.convert(microsec, Ultrasonic::CM);
 /* Serial.print("MS: ");
  Serial.print(microsec);
  Serial.print(", CM: ");
  Serial.print(cmMsec);*/
  
  
  
  //casting the float to int
  int intCmSec = (int) cmMsec;
  
  //writing to display
  lc.setDigit(0,0,intCmSec/100,false);
  lc.setDigit(0,1,(intCmSec%100)/10,false);
  lc.setDigit(0,2,(intCmSec%100)%10,false);
 
 delay(500); 
  }

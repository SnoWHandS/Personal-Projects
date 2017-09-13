//We always have to include the library
#include "LedControl.h"

/*
 Now we need a LedControl to work with.
 pin 12 is connected to the DataIn 
 pin 11 is connected to the CLK 
 pin 10 is connected to LOAD*/
LedControl lc=LedControl(12,11,10,4);

float tempPin = A0; // temperature sensor

float tempK, tempC, tempF, oldTempC;

/* we always wait a bit between updates of the display */
unsigned long delaytime=1000;

void setup() {
  /*
   The MAX72XX is in power-saving mode on startup,
   we have to do a wakeup call
   */
  lc.shutdown(0,false);
  /* Set the brightness to a medium values */
  lc.setIntensity(0,8);
  /* and clear the display */
  lc.clearDisplay(0);
  // For temperature reading
  pinMode(tempPin, INPUT);
  Serial.begin(9600);
}

void loop() 
{ 
  
  //Tempurature reading and conversion
  
 tempK = (((analogRead(tempPin)/1023.0) * 5.0) * 100.0);  
  Serial.print("Analog Value = ");
  Serial.print(analogRead(tempPin));
  Serial.print("\n");
  Serial.print("Temp K = ");
  Serial.print(tempK);
  Serial.print("\n\n");
  //Converts Kelvin to Celsius minus 2.5 degrees error
  tempC = tempK - 273.0;   
  tempF = ((tempK - 2.5) * 9 / 5) - 459.67;
  //Celsius temperature display
  tempC = int(tempC) - 25;
  Serial.print("Temp C = ");
  Serial.print(tempC);
  Serial.print("\n\n");
  delay(100);
  
  //Error protection
  
  if(tempC > (tempC + 10))
  {
    lc.setDigit(0,0,(int(oldTempC))/10, false);
    lc.setDigit(0,1,(int(oldTempC))%10, true);
    lc.setDigit(0,2,(int(oldTempC)), false);
    lc.setDigit(0,3,int(oldTempC), false);
    Serial.print("Reading Error");
  }
  
  else
  {
  //Temperature displaying
  
  lc.setDigit(0,2,(int(tempC)/10), false);
  lc.setDigit(0,3,(int(tempC)%10), true);
  //lc.setDigit(0,2,(int(tempC)), false);
 // lc.setDigit(0,3,int(tempC), false);
  delay(delaytime);
  }
  
  oldTempC = tempC;
}

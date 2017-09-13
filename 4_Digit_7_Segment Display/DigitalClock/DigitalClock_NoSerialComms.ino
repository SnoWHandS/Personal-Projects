#include <Wire.h>
#include <Time.h>
#include <DS1307RTC.h>
#include "LedControl.h"
LedControl lc=LedControl(12,11,10,4);

tmElements_t tm;

//Input variables
int potPin = 1;
int hourPin = 7;
int minPin = 6;
int setPin = 2;


void setup()
{  
  lc.shutdown(0,false);
  /* Set the brightness to a medium values*/
  lc.setIntensity(0,0);
  /* and clear the display */
  lc.clearDisplay(0);
  
  //Button modes
  pinMode(minPin, INPUT);
  pinMode(hourPin, INPUT);
  //attachInterrupt(setPin, displayOff, CHANGE);
  pinMode(setPin, INPUT);
  
}

void loop()
{
  
  if(digitalRead(hourPin) == HIGH && digitalRead(minPin) == HIGH)  //Doesn't display whilst in config
  {
   displayTime();
  }
  if(digitalRead(hourPin) == LOW || digitalRead(minPin) == LOW)
  {
  checkButtons();
  }
  //delay(500);
  
}

void displayOff()
{
 lc.shutdown(0,true); 
}

void checkButtons()
{
  int mappedPotVal;
  bool signature;
  
  //Checks the hour button
  if(digitalRead(hourPin) == LOW)
  {
    int potVal = analogRead(potPin);
    mappedPotVal = map(potVal, 0  , 1023, 0 , 24);
    
    //Displays current value
    lc.setDigit(0,0,mappedPotVal/10, false);
    lc.setDigit(0,1,mappedPotVal%10,false);
    
    signature = 1;//1 = Hour is being set
    
    //checks the set button
    if(digitalRead(setPin) == LOW)
    {
      settingTime(mappedPotVal, signature);
    }
  }
  
  //Checks the Minute button
  if(digitalRead(minPin) == LOW)
  {
    int potVal = analogRead(potPin);
    mappedPotVal = map(potVal, 0  , 1023, 0 , 60);
    
    //Displays current value
    lc.setDigit(0,2,mappedPotVal/10, false);
    lc.setDigit(0,3,mappedPotVal%10,false);
    
    signature = 0; // 0 = Minute is being set
    
    //checks the set button
    if(digitalRead(setPin) == LOW)
    {
      settingTime(mappedPotVal, signature);
    }
    
  }
 
}

void displayTime()
{
  RTC.read(tm);

   //Displaying to 7Segment display
    lc.setDigit(0,0,tm.Hour/10, false);
    lc.setDigit(0,1,tm.Hour%10,true);
  
    lc.setDigit(0,2,tm.Minute/10,false);
    lc.setDigit(0,3,tm.Minute%10,true);  
}

void settingTime(int mappedVal, bool whichConfig)
{
  RTC.read(tm);
  
  int oldHour = tm.Hour;
  int oldMinute = tm.Minute;
  
  if(whichConfig)  //If hour is set
  {
    if(mappedVal == 24)
    {
      mappedVal = 23;
    }
    tm.Hour = mappedVal;
  }
  if(!whichConfig)
  {
    if(mappedVal == 60)
    {
      mappedVal = 59;
    }
    tm.Minute = mappedVal;
  }
  tm.Second = 0;
  
  tm.Day = 22;
  tm.Month = 5;
  tm.Year = 2014;
  
  RTC.write(tm);
}

/* Downloaded from http://projectsfromtech.blogspot.com/
*Connect SCL, SDA, Vcc, and GND
*Open Serial Monitor and enjoy!
*/

//Arduino 1.0+ Only

#include "LedControl.h"
#include "Wire.h"
#define DS1307_ADDRESS 0x68

LedControl lc=LedControl(12,11,10,8);

void setup()
{
  Wire.begin();
  lc.shutdown(0,false);
  /* Set the brightness to a medium values*/
  lc.setIntensity(0,0);
  /* and clear the display */
  lc.clearDisplay(0);
  Serial.begin(9600);
}

void loop()
{
  printDate();
}


byte bcdToDec(byte val)  
{
// Convert binary coded decimal to normal decimal numbers
  return ( (val/16*10) + (val%16) );
}

void printDate(){

  // Reset the register pointer
  Wire.beginTransmission(DS1307_ADDRESS);

  byte zero = 0x00;
  Wire.write(zero);
  Wire.endTransmission();

  Wire.requestFrom(DS1307_ADDRESS, 7);

  int second = bcdToDec(Wire.read());
  int minute = bcdToDec(Wire.read());
  int hour = bcdToDec(Wire.read() & 0b111111); //24 hour time
  int weekDay = bcdToDec(Wire.read()); //0-6 -> sunday - Saturday
  int monthDay = bcdToDec(Wire.read());
  int month = bcdToDec(Wire.read());
  int year = bcdToDec(Wire.read());

  //print the date EG   3/1/11 23:59:59
  
/*
  Serial.print(month);
  Serial.print("/");
  Serial.print(monthDay);
  Serial.print("/");
  Serial.print(year);
  Serial.print(" ");
  Serial.print(hour);
  Serial.print(":");
  Serial.print(minute);
  Serial.print(":");
  Serial.println(second);
  */
  displayDate(hour, minute, second);
}

void countDown(int hr, int mint, int sec)
{
  int downHr, downMint, downSec;
  
  downHr = 24 -  hr;
  downMint = 60 - mint;
  downSec = 60 - sec;
  
  displayDate(downHr, downMint, downSec);
}

void displayDate(int hr, int mint, int sec)
{
  
  //Test
  
  /*lc.setDigit(0,0,0,true);
  lc.setDigit(0,1,1,true);
  lc.setDigit(0,2,2,true);
  lc.setDigit(0,3,3,true);
  lc.setDigit(0,4,4,true);
  lc.setDigit(0,5,5,true);
  lc.setDigit(0,6,6,true);
  lc.setDigit(0,7,7,true);*/
  
  lc.setDigit(0,0,hr/10, false);
  lc.setDigit(0,1,hr%10,true);
  
  lc.setDigit(0,2,mint/10,false);
  lc.setDigit(0,3,mint%10,true);
  
  lc.setDigit(0,4,sec/10,false);
  lc.setDigit(0,5,sec%10,false);
  
  
  //To make it look likee milliseconds
  
  /*int delayTime = 100;
  lc.setDigit(0,6,2,false);
  lc.setDigit(0,7,5,false);
  delay(delayTime);
  lc.setDigit(0,6,3,false);
  lc.setDigit(0,7,3,false);
  delay(delayTime);
  lc.setDigit(0,6,5,false);
  lc.setDigit(0,7,4,false);
  delay(delayTime);
  lc.setDigit(0,6,8,false);
  lc.setDigit(0,7,6,false);
  delay(delayTime);
  lc.setDigit(0,6,9,false);
  lc.setDigit(0,7,1,false);*/
}


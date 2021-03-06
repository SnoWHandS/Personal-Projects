/* Downloaded from http://projectsfromtech.blogspot.com/
*Connect SCL, SDA, Vcc, and GND
*Set date in function below.
*Upload and enjoy!
*/


//Arduino 1.0+ Only
#include "LedControl.h"
#include "Wire.h"

#define DS1307_ADDRESS 0x68
LedControl lc=LedControl(12,11,10,4);
byte zero = 0x00; //workaround for issue #527

//some GLOBAL VARIABLES OOOOOOHHH
int potPin = 1;
int hourPin = 7;
int setPin = 5;
int minPin = 6;

void setup()
{
  Wire.begin();
  
  lc.shutdown(0,false);
  /* Set the brightness to a medium values*/
  lc.setIntensity(0,0);
  /* and clear the display */
  lc.clearDisplay(0);
  
  pinMode(minPin, INPUT);
  pinMode(hourPin, INPUT);
  pinMode(setPin, INPUT);
  
  Serial.begin(9600);
}

void loop()
{
  if(digitalRead(hourPin) == HIGH && digitalRead(minPin) == HIGH)
  {
  printDate();
  }
  checkButtons();
  delay(500);
}

void checkButtons()
{
  int mappedHrPotVal;
  int mappedMinPotVal;
  
  if(digitalRead(hourPin) == LOW)
  {
    int potVal = analogRead(potPin);
    mappedHrPotVal = map(potVal, 0  , 1023, 0 , 24);
    
    //Serial.print(mappedHrPotVal);
    
    lc.setDigit(0,0,mappedHrPotVal/10, false);
    lc.setDigit(0,1,mappedHrPotVal%10,false);
  }
  
  if(digitalRead(minPin) == LOW)
  {
    int potVal = analogRead(potPin);
    mappedMinPotVal = map(potVal, 0  , 1023, 0 , 59);
    
    //Serial.print(mappedMinPotVal);
    
    lc.setDigit(0,2,mappedMinPotVal/10, false);
    lc.setDigit(0,3,mappedMinPotVal%10,false);
  }
  Serial.println("");
  Serial.println("Minute:");
  Serial.print(mappedMinPotVal);
  Serial.println("");
  Serial.println("");
  Serial.println("Hour:");
  Serial.print(mappedHrPotVal);
  Serial.println("");
  
  if(digitalRead(setPin) == LOW)
    {
      setDateTime(0,mappedMinPotVal,mappedHrPotVal);
    }
  
}
void setDateTime(int sec, int mint, int hr)
{
  Serial.print("Inside setDateTime");
  byte second =      sec; //0-59
  byte minute =      mint; //0-59
  byte hour =        hr; //0-23
  byte weekDay =     5; //1-7
  byte monthDay =    2; //1-31
  byte month =       5; //1-12
  byte year  =       14; //0-99

  Wire.beginTransmission(DS1307_ADDRESS);
  Wire.write(zero); //stop Oscillator

  Wire.write(decToBcd(second));
  Wire.write(decToBcd(minute));
  Wire.write(decToBcd(hour));
  Wire.write(decToBcd(weekDay));
  Wire.write(decToBcd(monthDay));
  Wire.write(decToBcd(month));
  Wire.write(decToBcd(year));

  Wire.write(zero); //start 

  Wire.endTransmission();

}

byte decToBcd(byte val)
{
// Convert normal decimal numbers to binary coded decimal
  return ( (val/10*16) + (val%10) );
}

byte bcdToDec(byte val)  
{
// Convert binary coded decimal to normal decimal numbers
  return ( (val/16*10) + (val%16) );
}

void printDate()
{

  // Reset the register pointer
  Wire.beginTransmission(DS1307_ADDRESS);
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
  
  if(digitalRead(hourPin) == HIGH && digitalRead(minPin) == HIGH)
  {
  displayDate(hour, minute, second);
  }
}

void displayDate(int hr, int mint, int sec)
{
  lc.setDigit(0,0,hr/10, false);
  lc.setDigit(0,1,hr%10,true);
  
  lc.setDigit(0,2,mint/10,false);
  lc.setDigit(0,3,mint%10,true);  
}

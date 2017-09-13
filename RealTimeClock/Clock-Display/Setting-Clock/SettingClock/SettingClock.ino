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


int setTimePin = 1;
//applyTimePin
int potPin = 0;
int ledPin = 7;


//Making these global for interactivity
int second;
int minute = 0;
int hour = 0;
byte setMinute;
byte setHour;

void setup()
{
  Wire.begin();
  
  lc.shutdown(0,false);
  /* Set the brightness to a medium values*/
  lc.setIntensity(0,0);
  /* and clear the display */
  lc.clearDisplay(0);
  pinMode(ledPin, OUTPUT);  
  attachInterrupt(setTimePin, changeTimeVar, RISING);
  
  Serial.begin(9600); 
}

void loop()
{
  printDate();
  displayDate(hour, minute, second);
  delay(200);
}

void changeTimeVar()
{
  Serial.print("/n You Are in interrupt");
  digitalWrite(ledPin, HIGH);
  setDateTime(1,1);
}
void displayDate(int hr, int mint, int sec)
{
  lc.setDigit(0,0,hr/10, false);
  lc.setDigit(0,1,hr%10,true);
  
  lc.setDigit(0,2,mint/10,false);
  lc.setDigit(0,3,mint%10,true);  
}


void setDateTime(int hr, int mint){

  byte second =      0; //0-59
  byte minute =     mint ; //0-59
  byte hour =        hr; //0-23
  byte weekDay =     3;//1-7
  byte monthDay =    21; //1-31
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

byte decToBcd(byte val){
// Convert normal decimal numbers to binary coded decimal
  return ( (val/10*16) + (val%10) );
}

byte bcdToDec(byte val)  {
// Convert binary coded decimal to normal decimal numbers
  return ( (val/16*10) + (val%16) );
}

void printDate(){

  // Reset the register pointer
  Wire.beginTransmission(DS1307_ADDRESS);
  Wire.write(zero);
  Wire.endTransmission();

  Wire.requestFrom(DS1307_ADDRESS, 7);

  second = bcdToDec(Wire.read());
  minute = bcdToDec(Wire.read());
  hour = bcdToDec(Wire.read() & 0b111111); //24 hour time
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

}

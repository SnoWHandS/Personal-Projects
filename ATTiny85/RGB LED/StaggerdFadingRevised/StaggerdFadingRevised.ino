/*
 Fading
 
 This example shows how to fade an LED using the analogWrite() function.
 
 The circuit:
 * LED attached from digital pin 9 to ground.
 
 Created 1 Nov 2008
 By David A. Mellis
 modified 30 Aug 2011
 By Tom Igoe
 
 http://arduino.cc/en/Tutorial/Fading
 
 This example code is in the public domain.
 
 */


int bluePin = 0;    // LED connected to digital pin 0
int redPin = 1;
int greenPin = 2;
int delayTime = 50;

void setup()  { 
  // nothing happens in setup 
} 

void loop()  
{
 
 fadeRedBlue();
}

void fadeRedBlue()
{
  int redFadeValue = 0;
  int blueFadeValue = 255;
  
  while(redFadeValue <= 255 && blueFadeValue >= 0)
  {
    //fading red off
    redFadeValue +=5;
    //fading blue on
    blueFadeValue -=5;
    analogWrite(bluePin, blueFadeValue);
    analogWrite(redPin, redFadeValue);
    
    delay(delayTime);
  }// once completed red=255 (off) and blue =0 (on)
  
  while(redFadeValue >=0 && blueFadeValue <=255)
  {
    //fading red off
    redFadeValue -=5;
    //fading blue on
    blueFadeValue +=5;
    analogWrite(bluePin, blueFadeValue);
    analogWrite(redPin, redFadeValue);
    
    delay(delayTime);
  }
  
  
  
  
  
  // fade in from min to max in increments of 5 points:
  for(blueFadeValue = 255; blueFadeValue >= 0; blueFadeValue -=5) 
  {
    // sets the value (range from 0 to 255):
    analogWrite(bluePin, blueFadeValue); 
    analogWrite(redPin, redFadeValue);         
    // wait for 30 milliseconds to see the dimming effect    
    delay(30);                            
  } 

  // fade out from max to min in increments of 5 points:
  for(blueFadeValue = 0 ; blueFadeValue <= 255; blueFadeValue +=5) { 
    // sets the value (range from 0 to 255):
    analogWrite(bluePin, blueFadeValue); 
    analogWrite(redPin, redFadeValue); 
    delay(30);                            
  } 
}


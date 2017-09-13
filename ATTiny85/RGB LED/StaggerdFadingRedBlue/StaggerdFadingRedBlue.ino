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
int delayTime = 100;

int redFadeValue;
int blueFadeValue;

void setup()  
{ 
  blueFadeValue = 255;
  redFadeValue = 0;
} 

void loop()  
{
 
 fadeRedBlue();
}

void fadeRedBlue()
{

  
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
}


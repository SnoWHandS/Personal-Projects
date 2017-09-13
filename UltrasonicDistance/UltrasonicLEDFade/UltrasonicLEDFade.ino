/*
 * HCSR04Ultrasonic/examples/UltrasonicDemo/UltrasonicDemo.pde
 *
 * SVN Keywords
 * ----------------------------------
 * $Author: cnobile $
 * $Date: 2011-09-17 02:43:12 -0400 (Sat, 17 Sep 2011) $
 * $Revision: 29 $
 * ----------------------------------
 */

#include <Ultrasonic.h>
#include "LedControl.h"

LedControl lc=LedControl(12,11,10,4);
#define TRIGGER_PIN  7
#define ECHO_PIN     6

int ledPin = 9;

Ultrasonic ultrasonic(TRIGGER_PIN, ECHO_PIN);

void setup()
  {
  Serial.begin(9600);
  lc.shutdown(0,false);
  /* Set the brightness to a medium values*/
  lc.setIntensity(0,8);
  /* and clear the display */
  lc.clearDisplay(0);
  }

void loop()
  {
  float cmMsec, inMsec;
  long microsec = ultrasonic.timing();
  cmMsec = ultrasonic.convert(microsec, Ultrasonic::CM);
  inMsec = ultrasonic.convert(microsec, Ultrasonic::IN);
  Serial.print("MS: ");
  Serial.print(microsec);
  Serial.print(", CM: ");
  Serial.print(cmMsec);
  Serial.print(", IN: ");
  Serial.println(inMsec);
  delay(20);
  
  int fade = map(cmMsec, 0, 100, 1023, 0);
  
  analogWrite(ledPin, fade);
  
  }

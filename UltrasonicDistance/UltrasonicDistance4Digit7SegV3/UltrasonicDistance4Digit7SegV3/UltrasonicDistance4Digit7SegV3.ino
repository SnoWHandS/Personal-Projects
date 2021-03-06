#include <NewPing.h>
#include "LedControl.h"

LedControl lc=LedControl(12,11,10,4);
#define TRIGGER_PIN  7
#define ECHO_PIN     6
#define MAX_DISTANCE 300

int pizoPin = 9;


NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE);

void setup()
  {
    Serial.begin(9600);
    
    //setting up the display
    lc.shutdown(0,false);
    lc.setIntensity(0,8);
    lc.clearDisplay(0);
  }

void loop()
  {
    int avgUSec = sonar.ping_median(5); //Getting the average microseconds between pings
    
    int cm = sonar.convert_cm(avgUSec); //Converting the average mircoseconds to centimeters
    
    //Writing to Serial
    Serial.print("MS: ");
    Serial.print(avgUSec);
    Serial.print(", CM: ");
    Serial.println(cm);
  
    //writing to display
    lc.setDigit(0,1,cm/100,false);
    lc.setDigit(0,,(cm%100)/10,false);
    lc.setDigit(0,2,(cm%100)%10,false);
  
    int toneVal = map(cm, 0, 300, 2500, 100); // Sets the tone for the Pizo
    int delayVal = map(cm, 0, 300, 1000, 50); // Sets the delay between Pizo beeps
  
    tone(pizoPin, toneVal, 10);
    delay(delayVal); 
  }

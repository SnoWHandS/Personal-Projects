// ---------------------------------------------------------------------------
// While the NewPing library's primary goal is to interface with ultrasonic sensors, interfacing with
// the Timer2 interrupt was a result of creating an interrupt-based ping method. Since these Timer2
// interrupt methods were built, the library may as well provide the functionality to use these methods
// in your sketches.  This shows how simple it is (no ultrasonic sensor required).  Keep in mind that
// these methods use Timer2, as does NewPing's ping_timer method for using ultrasonic sensors.  You
// can't use ping_timer at the same time you're using timer_ms or timer_us as all use the same timer.
// ---------------------------------------------------------------------------

#include <NewPing.h>
#include "LedControl.h"

LedControl lc=LedControl(12,11,10,4);
/*
 * Pin 12 is connected to the DATA IN-pin of the first MAX7221
 * Pin 11 is connected to the CLK-pin of the first MAX7221
 * Pin 10 is connected to the LOAD(/CS)-pin of the first MAX7221   
*/
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
    lc.setDigit(0,2,(cm%100)/10,false);
    lc.setDigit(0,3,(cm%100)%10,false);
    
    /*int toneVal = map(cm, 0, 250, 2500, 100); // Sets the tone for the Pizo
    int delayVal = map(cm, 0, 250, 1000, 50); // Sets the delay between Pizo beeps
  
    tone(9, delayVal, 10);*/
    
    delay(20); 
  }

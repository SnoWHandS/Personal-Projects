#include "BasicStepperDriver.h"
#include <Arduino.h>
#include <Encoder.h>

// Motor steps per revolution. Most steppers are 200 steps or 1.8 degrees/step
#define MOTOR_STEPS 200


// All the wires needed for full functionality
#define DIR 8
#define STEP 9


// Since microstepping is set externally, make sure this matches the selected mode
// 1=full step, 2=half step etc.
#define MICROSTEPS 1


// 2-wire basic config, microstepping is hardwired on the driver
BasicStepperDriver stepper(MOTOR_STEPS, DIR, STEP);
Encoder stepperEnc(5, 6);

long oldPosition  = -999;

void setup() {
  Serial.begin(9600);
  stepper.begin(15, MICROSTEPS);
}

void loop() {
  long newPosition = stepperEnc.read();

  //Tick stepper 4 ticks in which-ever direction
  if (newPosition != oldPosition) {
  //if the rotary encoder moves once CW
    if(newPosition < oldPosition){
      Serial.println("CW");
      stepper.move(1*MICROSTEPS);
    }
  //if the rotary encoder moves once CCW
    else if(newPosition > oldPosition){
      Serial.println("CCW");
      stepper.move(-1*MICROSTEPS);
    }
    oldPosition = newPosition;
  }
}

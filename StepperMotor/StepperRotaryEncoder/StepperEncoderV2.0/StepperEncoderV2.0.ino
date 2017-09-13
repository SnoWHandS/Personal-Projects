#include "BasicStepperDriver.h"
#include <Arduino.h>

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

int clkPin = 5;
int dataPin = 6;

boolean previous_clk_pin_state = false;

void setup() {
  Serial.begin(9600);
  stepper.begin(15, MICROSTEPS);
  pinMode(clkPin, INPUT);
  pinMode(dataPin, INPUT);
}

void loop() {
  boolean clk_pin_state = digitalRead(clkPin);
    if(clk_pin_state != previous_clk_pin_state){
      
      if(digitalRead(dataPin) !=  clk_pin_state){
        Serial.println("CW");
        stepper.move(1*MICROSTEPS);
      }
      else{
        Serial.println("CCW");
        stepper.move(-1*MICROSTEPS);
      }
    }
    previous_clk_pin_state = clk_pin_state;
}

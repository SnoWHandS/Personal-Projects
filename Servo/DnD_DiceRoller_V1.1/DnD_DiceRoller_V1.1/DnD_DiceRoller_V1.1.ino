/*
Actuates a servo to throw a DnD dice of the users choice. 
Switch on pin 2
Servo on pin 9 (9g hobby servo)
*/


#include <Servo.h>

Servo myservo;  // create servo object to control a servo

boolean trigger;  //true or false flag for if the switch was TRIGGERED, if not then no dice rollings


void setup() {
  myservo.attach(9);  // attaches the servo on pin 9 rto the servo object
  myservo.write(0);   //set to home
  delay(300);         //because mechanics are slower than electronics
  myservo.detach();   //stop the servo from burning up energy
  pinMode(2, INPUT); // sets up pin 10 as a input so we don't do a blowing
}

void loop() {
  trigger = digitalRead(2);
  if(trigger){
    fire();
  }
  delay(50);
}

void fire(){
   myservo.attach(9);               //begin burning up energy in the servo
   myservo.write(120);              // tell servo to go to position 120°
   delay(300);                      //because mechanics are slower than electronics
   myservo.write(0);                // tell servo to go to position 0°
   delay(300);                      //because mechanics are slower than electronics
   myservo.detach();                //stop the servo from burning up energy
}


/*
Actuates a servo to throw a DnD dice of the users choice. 
Switch on pin 2
Servo on pin 9 (9g hobby servo)
*/

#include <Servo.h>

Servo myservo;  // create servo object to control a servo
int pos;  //position indicator


void setup() {
  myservo.attach(9);  // attaches the servo on pin 9 rto the servo object
  pinMode(2, INPUT_PULLUP); // sets up pin 2 as a input so we don't do a blowing
  attachInterrupt(2, triggered, LOW);
  Serial.begin(9600);
}

void loop() {
  myservo.write(pos);              // tell servo to go to position in °
  Serial.println(pos);
  delay(500);
  pos = 0;
}

void triggered(){
  pos = 120;
  
}


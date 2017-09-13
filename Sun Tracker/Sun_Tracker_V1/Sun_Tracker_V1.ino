#include <Servo.h>

Servo h_Servo;

int h_Pos = 90;
const int tol = 1;

// LDR pin connections
int ldrlt = 0; //LDR top left
int ldrrt = 1; //LDR top rigt
int ldrld = 2; //LDR down left
int ldrrd = 3; //ldr down rigt

void setup() {
  // put your setup code here, to run once:
  h_Servo.attach(9);
  pinMode(ldrlt, INPUT);
  pinMode(ldrrt, INPUT);
  pinMode(ldrld, INPUT);
  pinMode(ldrrd, INPUT);
}

void loop() {
  int lt = analogRead(ldrlt); // top left
  int rt = analogRead(ldrrt); // top right
  int ld = analogRead(ldrld); // down left
  int rd = analogRead(ldrrd); // down rigt

  int avl = (lt + ld) / 2; // average value left
  int avr = (rt + rd) / 2; // average value right

  int dhoriz = avl - avr;// check the diffirence og left and rigt

if(-1*tol > dhoriz || dhoriz > tol){
  if(avl > avr){
    h_Pos = --h_Pos;
    if(h_Pos<0){
      h_Pos = 0;
    }
  }
  else if(avl < avr){
    h_Pos = ++h_Pos;
    if(h_Pos>180){
      h_Pos = 180;
    }
      
  }
  else if (avl == avr)
  {
    // nothing
  }

  h_Servo.write(h_Pos);
}
  delay(30);
  /*
  for (h_Pos = 0; h_Pos <= 180; h_Pos++){
    h_Servo.write(h_Pos);
    delay(15);
  }

   for (h_Pos = 180; h_Pos >= 0; h_Pos--){
    h_Servo.write(h_Pos);
    delay(15);
  }*/
}

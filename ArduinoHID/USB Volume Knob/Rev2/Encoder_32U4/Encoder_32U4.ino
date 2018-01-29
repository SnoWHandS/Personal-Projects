#include "HID-Project.h"

boolean previous_clk_pin_state = false;
const int clk_pin = 3;
const int data_pin = 2;
const int btn_pin = 7;
const int touch_pin = 15;

boolean clk_pin_state = true;
boolean data_pin_state = true;
boolean virtual_keyboard_state = false;
int upCount = 0;
int downCount =0;

void setup() {
  // put your setup code here, to run once:
  //pinMode(clk_pin, INPUT);
  //pinMode(data_pin, INPUT);
  pinMode(btn_pin, INPUT);
  pinMode(touch_pin, INPUT);
  Serial.begin(9600);
  Consumer.begin();
}

void loop() {
    //Check encoder for incrementation
    clk_pin_state = digitalRead(clk_pin);
    data_pin_state = digitalRead(data_pin);
   if(virtual_keyboard_state){
     if(clk_pin_state != previous_clk_pin_state){
  
      if(data_pin_state != clk_pin_state){
        downCount++;
        if(downCount>=2){
        Consumer.write(MEDIA_VOLUME_DOWN);
        Serial.println("Incr down");  
        downCount =0;
        }
      }
      else{
        upCount++;
        if(upCount>=2){
        Consumer.write(MEDIA_VOLUME_UP);
        Serial.println("Incr up");
        upCount =0;
        }
      }  
    }
    previous_clk_pin_state = clk_pin_state;
    if(!digitalRead(touch_pin)){
      Serial.println("touch detected");
      Consumer.write(MEDIA_VOLUME_MUTE);
      delay(250);
    }
  }
  boolean btn_state = digitalRead(btn_pin);
  if(!btn_state){
    if(!virtual_keyboard_state){
      virtual_keyboard_state = true;
      Serial.println("btn true");
    }
    else{
      virtual_keyboard_state = false;
      Serial.println("btn false");
    }
    delay(250);
  }
}

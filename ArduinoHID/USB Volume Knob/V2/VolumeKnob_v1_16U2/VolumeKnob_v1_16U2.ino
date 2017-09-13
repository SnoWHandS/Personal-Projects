#include "HID-Project.h"

uint8_t current_knob_val = 0x00;   //YOLO GLOBAL VARIABLES WOOHOO
boolean previous_clk_pin_state = false;


void setup() {
   // Start the Serial1 which is connected with the IO MCU.
  // Make sure both wslkudqthbditspybaud rates are the same
  // you can go up to 2000000 for very fast data transmission.
  Serial1.begin(115200);
  Consumer.begin();
  // Start the USB Serial for debugging
  Serial.begin(115200);
}

void loop() {

  // Check if any Serial data from the IO MCU was received
  byte pin_state_packet = Serial1.read();
  
  //Assign pins in this environment
  boolean clk_bitmask_result = pin_state_packet&B10000000
    boolean clk_pin_state = clk_bitmask_result;
  boolean data_bitmask_result = pin_state_packet&B01000000
    boolean data_pin_state = data_bitmask_result;


  //Check encoder for incrementation
   if(clk_pin_state != previous_clk_pin_state){

    if(data_pin_state != clk_pin_state){
      current_knob_val++;
    }
    else{
      current_knob_val--;
    }  
  }
  previous_clk_pin_state = clk_pin_state;






  
  int newPosition = vol_knob_input;
  if(newPosition != oldPosition){
    //Do nothing
    Serial.print(F("USB: "));
    Serial.print(vol_knob_input);
    Serial.println();
    
    if(newPosition > oldPosition){
      //increase volume
      //for(int i=0; i<=newPosition;i++){
        Consumer.write(MEDIA_VOLUME_UP);
      //}
    }
    else if(newPosition < oldPosition){
      //decrease volume
     // for(int i=0; i<=newPosition;i++){
        Consumer.write(MEDIA_VOLUME_DOWN);
     // }
    }
    oldPosition = newPosition;
  }
  delay(10);
}

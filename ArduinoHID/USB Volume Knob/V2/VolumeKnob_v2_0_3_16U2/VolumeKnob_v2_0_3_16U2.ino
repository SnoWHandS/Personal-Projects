#include "HID-Project.h"

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
  //Serial.println(pin_state_packet);
  
  //Assign pins in this environment
  boolean clk_bitmask_result = pin_state_packet&B00000001;
    boolean clk_pin_state = clk_bitmask_result;
  boolean data_bitmask_result = pin_state_packet&B00000010;
    boolean data_pin_state = data_bitmask_result;
  boolean btn_bitmask_result = pin_state_packet&B00000100;
    boolean btn_pin_state = btn_bitmask_result;  
  Serial.print("clk: "+(String)clk_pin_state);
  Serial.print("data: "+(String)data_pin_state);
  Serial.print("btn: "+(String)btn_pin_state);
  Serial.println();

  //check for mute
  if(btn_pin_state == false){
    Serial.println("mute toggled");
    Consumer.write(MEDIA_VOLUME_MUTE);
  }

  //Check encoder for incrementation
   if(clk_pin_state != previous_clk_pin_state){

    if(data_pin_state != clk_pin_state){
      Consumer.write(MEDIA_VOLUME_UP);
    }
    else{
      Consumer.write(MEDIA_VOLUME_DOWN);
    }  
  }
  previous_clk_pin_state = clk_pin_state;
}

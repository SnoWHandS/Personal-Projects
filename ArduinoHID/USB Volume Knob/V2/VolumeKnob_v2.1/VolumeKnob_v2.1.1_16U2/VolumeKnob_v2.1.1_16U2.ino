#include "HID-Project.h"
#include "Keyboard.h"

boolean previous_clk_pin_state = false;
boolean previous_muteBtn_pin_state = true;
boolean previous_hotkey1_pin_state = true;
boolean previous_hotkey2_pin_state = true;


void setup() {
   // Start the Serial1 which is connected with the IO MCU.
  // Make sure both baud rates are the same
  // you can go up to 2000000 for very fast data transmission.
  Serial1.begin(2000000);
  Consumer.begin();
  Keyboard.begin();
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
  boolean muteBtn_bitmask_result = pin_state_packet&B00000100;
    boolean muteBtn_pin_state = muteBtn_bitmask_result;
  boolean hotkey1_bitmask_result = pin_state_packet&B00001000;
    boolean hotkey1_pin_state = hotkey1_bitmask_result;
  boolean hotkey2_bitmask_result = pin_state_packet&B00010000;
    boolean hotkey2_pin_state = hotkey2_bitmask_result;
  Serial.print("clk: "+(String)clk_pin_state);
  Serial.print("data: "+(String)data_pin_state);
  Serial.print("muteBt: "+(String)muteBtn_pin_state);
  Serial.println();


  //Check encoder for incrementation
   if(clk_pin_state != previous_clk_pin_state){

    if(data_pin_state != clk_pin_state){
      Consumer.write(MEDIA_VOLUME_UP);
    }
    else{
      Consumer.write(MEDIA_VOLUME_DOWN);
    }  
  }
  if(!muteBtn_pin_state){
    if(previous_muteBtn_pin_state != muteBtn_pin_state){
      Consumer.write(MEDIA_VOLUME_MUTE);
      Serial.println("mute written");  
      delay(10);  
    }
  }
  if(!hotkey1_pin_state){
    if(previous_hotkey1_pin_state != hotkey1_pin_state){
      Keyboard.begin();  
      Keyboard.press(KEY_LEFT_SHIFT);
      Keyboard.press('`');
      Keyboard.releaseAll();
      Keyboard.end();
    }
  }
  if(!hotkey2_pin_state){
    if(previous_hotkey2_pin_state != hotkey2_pin_state){ 
      Keyboard.begin(); 
      Keyboard.press(KEY_LEFT_CTRL);
      Keyboard.press(KEY_LEFT_SHIFT);
      Keyboard.press('`');
      Keyboard.releaseAll();
      Keyboard.end();
    }
  }

  previous_hotkey1_pin_state = hotkey1_pin_state;
  previous_hotkey2_pin_state = hotkey2_pin_state;
  previous_clk_pin_state = clk_pin_state;
  previous_muteBtn_pin_state = muteBtn_pin_state;
  delay(4);   //Native delay of serial communication for Arduino Uno is 4.1ms
}

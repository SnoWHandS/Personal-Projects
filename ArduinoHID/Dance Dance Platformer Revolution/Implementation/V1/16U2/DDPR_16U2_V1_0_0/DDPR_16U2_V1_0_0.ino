/* Authors:
 *  Dillon Heald
 *  Tamara Nieuwoudt
 *  2017
 * 
 * Dance Dance Platformer Revolution controller
 * Important note: Computer hosting game must be plugged into the wall socket
 * of the building to ensure best controller response.
 * 
 * This is the code loaded onto the 16U2 MCU for interconnection 
 */
#include "Keyboard.h"
#include "HID.h"

void setup() {
  Serial1.begin(9600);

  // Sends a clean report to the host. This is important because
  // the 16u2 of the Uno/Mega is not turned off while programming
  // so you want to start with a clean report to avoid strange bugs after reset.
  Keyboard.begin();
  Serial.begin(9600);
}

void loop() {
  //read in the data packet
  byte input_data_packet = Serial1.read();
  //interpret button presses
  boolean w_bitmask_result =    input_data_packet&B00000001;
    boolean w_pin_state = w_bitmask_result;
  boolean a_bitmask_result =    input_data_packet&B00000010;
    boolean a_pin_state = a_bitmask_result;
  boolean s_bitmask_result =    input_data_packet&B00000100;
    boolean s_pin_state = s_bitmask_result;
  boolean d_bitmask_result =    input_data_packet&B00001000;
    boolean d_pin_state = d_bitmask_result;
  boolean btn1_bitmask_result = input_data_packet&B00010000;
    boolean btn1_pin_state = btn1_bitmask_result;
  boolean btn2_bitmask_result = input_data_packet&B00100000;
    boolean btn2_pin_state = btn2_bitmask_result;

  Serial.write(input_data_packet);
  //
  //If a button is pressed send it to USB
  if(input_data_packet>=1){
    if(w_pin_state){
      Keyboard.press('w');
    }
    if(a_pin_state){
      Keyboard.press('a');
    }
    if(s_pin_state){
      Keyboard.press('s');
    }
    if(d_pin_state){
      Keyboard.press('d');
    }
    if(btn1_pin_state){
      Keyboard.press(' ');
    }
    if(btn2_pin_state){
      Keyboard.press('p');
    }
      Keyboard.releaseAll();
  }
  delay(1000);
  //else dont write to keyboard
}

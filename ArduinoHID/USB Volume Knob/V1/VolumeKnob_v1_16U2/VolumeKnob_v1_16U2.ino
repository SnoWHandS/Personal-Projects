#include "HID-Project.h"
int oldPosition  = 0;

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
  int vol_knob_input = Serial1.read();
  //long vol_knob_long = (long)c;

  
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

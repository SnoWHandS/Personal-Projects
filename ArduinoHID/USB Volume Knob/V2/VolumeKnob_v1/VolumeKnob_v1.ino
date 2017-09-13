#include "HID-Project.h"
long oldPosition  = -999;

void setup() {
   // Start the Serial1 which is connected with the IO MCU.
  // Make sure both baud rates are the same
  // you can go up to 2000000 for very fast data transmission.
  Serial1.begin(115200);
  Consumer.begin();
  // Start the USB Serial for debugging
  Serial.begin(115200);
}

void loop() {

  // Check if any Serial data from the IO MCU was received
  char c = Serial1.read();
  Serial.print(F("USB: "));
  Serial.print(c);
  
  long newPosition = c;
  if(newPosition == oldPosition){
    //Do nothing
  }
  else if(newPosition > oldPosition){
    //increase volume
    Consumer.write(MEDIA_VOLUME_UP);
  }
  else if(newPosition < oldPosition){
    //decrease volume
    Consumer.write(MEDIA_VOLUME_DOWN);
  }

  oldPosition = newPosition;
}

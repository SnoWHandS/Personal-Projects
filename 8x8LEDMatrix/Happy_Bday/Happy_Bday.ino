#include "LedControl.h"

LedControl lc=LedControl(12,11,10,6);

void setup() {
  int devices=lc.getDeviceCount();
  
  for(int address=0;address<devices;address++) {
    lc.shutdown(address,false);
    lc.setIntensity(address,8);
    lc.clearDisplay(address);
  }
}
void Object() 
{  //half of an A and full Y on bottom left most display
  lc.setColumn(0,0,B00010010);
  lc.setColumn(0,1,B00010010);
  lc.setColumn(0,2,B11111100);
  lc.setColumn(0,3,B00000110);
  lc.setColumn(0,4,B00001000);
  lc.setColumn(0,5,B11110000);
  lc.setColumn(0,6,B00001000);
  lc.setColumn(0,7,B00000110);
  
  lc.setColumn(1,0,B00010000);
  lc.setColumn(1,1,B11111111);
  lc.setRow(1,0,B01111010);
  lc.setRow(1,7,B01111000);
  lc.setColumn(1,5,B011111
}

void loop(){
    Object();
}

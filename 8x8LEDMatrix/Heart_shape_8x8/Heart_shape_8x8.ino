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
  void Object() {
    
    lc.setRow(1,0,B00011111);
    lc.setRow(1,1,B00111111);
    lc.setRow(1,2,B01111111);
    lc.setRow(1,3,B11111111);
    lc.setRow(1,4,B11111111);
    lc.setRow(1,5,B01111111);
    lc.setRow(1,6,B00111111);
    lc.setRow(1,7,B00011111);
    
    lc.setRow(2,4,B00000001);
    lc.setRow(2,5,B00000011);
    lc.setRow(2,6,B00000111);
    lc.setRow(2,7,B00001111);
    
    lc.setRow(0,0,B00001111);
    lc.setRow(0,1,B00000111);
    lc.setRow(0,2,B00000011);
    lc.setRow(0,3,B00000001);
   
    lc.setRow(3,4,B11110000);
    lc.setRow(3,0,B11111100);
    lc.setRow(3,1,B11111100);
    lc.setRow(3,2,B11111100);
    lc.setRow(3,3,B11111000);
    
    lc.setRow(4,0,B11111100);
    lc.setRow(4,1,B11111100);
    lc.setRow(4,2,B11111000);
    lc.setRow(4,3,B11110000);
    lc.setRow(4,4,B11110000);
    lc.setRow(4,5,B11111000);
    lc.setRow(4,6,B11111100);
    lc.setRow(4,7,B11111100);
    
    lc.setRow(5,3,B11110000);
    lc.setRow(5,4,B11111000);
    lc.setRow(5,5,B11111100);
    lc.setRow(5,6,B11111100);
    lc.setRow(5,7,B11111100);
  }
  void Text() {
    lc.setColumn(5,0,B11111011);
    lc.setRow(5,0,B11111110);
    lc.setRow(5,5,B01111100);
    lc.setColumn(5,6,B10000011);
    
    lc.setRow(4,0,B10000010);
    lc.setRow(4,1,B01111100);
    lc.setRow(4,3,B00000110);
    lc.setRow(4,4,B00011000);
    lc.setRow(4,5,B01100000);
    lc.setRow(4,6,B10000000);
    lc.setRow(4,7,B01100000);
    
    lc.setRow(3,0,B00011000);
    lc.setRow(3,1,B00000110);
    lc.setRow(3,3,B11111110);
    lc.setColumn(3,0,B00011111);
    lc.setColumn(3,3,B10011110);
    lc.setColumn(3,6,B01011111);
    
    lc.setColumn(2,7,B10000001);
    lc.setColumn(2,6,B01000010);
    lc.setColumn(2,5,B00100100);
    lc.setRow(2,3,B11111000);
    lc.setRow(2,4,B11111000);
    
    lc.setRow(1,1,B01111110);
    lc.setRow(1,6,B01111110);
    lc.setColumn(1,7,B00111100);
    lc.setColumn(1,0,B00111100);
    
    lc.setRow(0,1,B01111111);
    lc.setRow(0,6,B01111111);
    lc.setColumn(0,0,B00111100);
  }
    
  
  void loop(){
    Object();
    delay(1500);
    lc.clearDisplay(0);
    lc.clearDisplay(1);
    lc.clearDisplay(2);
    lc.clearDisplay(3);
    lc.clearDisplay(4);
    lc.clearDisplay(5);
    delay(500);
    Text();
    delay(1500);
    lc.clearDisplay(0);
    lc.clearDisplay(1);
    lc.clearDisplay(2);
    lc.clearDisplay(3);
    lc.clearDisplay(4);
    lc.clearDisplay(5);
    
    
  }

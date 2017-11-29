/*
 * 
 * A source file to play around with the features of the ESP32 WiFi LoRa
 * Special thanks to @shifttymike for the awesome Birthday present!
 * Check him out @ https://github.com/shifttymike
 * 
 * Author: Dillon Heald
 */

#include <Wire.h>  // Only needed for Arduino 1.6.5 and earlier
#include "SSD1306.h" // alias for `#include "SSD1306Wire.h"`


//OLED pins to ESP32 GPIOs via this connecthin:
//OLED_SDA -- GPIO4
//OLED_SCL -- GPIO15
//OLED_RST -- GPIO16

//Create/init SSD1306 object
SSD1306  display(0x3c, 4, 15);

void setup() {

  pinMode(16,OUTPUT);
  digitalWrite(16, LOW);    // set GPIO16 low to reset OLED
  delay(50); 
  digitalWrite(16, HIGH); // while OLED is running, must set GPIO16 in high
  
  Serial.begin(115200);
  Serial.println();
  Serial.println();


  // Initialising the UI will init the display too.
  display.init();

  display.flipScreenVertically();
  display.setFont(ArialMT_Plain_10);

/*
  pinMode(16,OUTPUT);
  digitalWrite(16, LOW);    // set GPIO16 low to reset OLED
  delay(50); 
  digitalWrite(16, HIGH); // while OLED is running, must set GPIO16 in high

  // Initialising the UI will init the display too.
  display.init();
  display.flipScreenVertically(); //because why not?
  display.setFont(ArialMT_Plain_10);  //No comica sans allowed
*/
}

void loop() {
  // clear the display
  display.clear();

  //Draw a thing
  drawSomething();
  
  // write the buffer to the display
  display.display();

  //So the micro doesn't do a frighten, Casual 100FPS #MicroMasterRace
  delay(10);


}

void drawSomething(){
  //make a rectangle                  // displayWidth - 2*xDis, displayHeight - 2*yDis    
  display.drawRect(39, 7, 50, 50);   //(leftTop x, LeftTop y, distance from x, distance from y) - start at 1
  //make dot at center
  display.setPixel(64, 32);           //(x coordinate, y coordinate) - start at 1
  //Circle inside square (hopefully)
  display.setColor(WHITE);
  display.drawCircle(64, 32, 24);     //(xCenter, yCenter, Radius)
}

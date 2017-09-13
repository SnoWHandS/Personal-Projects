#include <Keyboard.h>
#define HYSTERESIS 12
#define SENSITIVITY 0.5

const int beginPin = 6;
const int potPin = 0;
float previousPos = 127;
void setup() {
  pinMode(beginPin, INPUT);
  pinMode(potPin, INPUT);
}

void loop() {
  if(digitalRead(beginPin)){
    Keyboard.begin();
    Keyboard.press(KEY_LEFT_GUI);
    Keyboard.press('r');
    Keyboard.releaseAll();
    delay(100);
    Keyboard.println("shutdown -s -t 30 -c \"Your harddrive will be formatted upon reboot\" ");
    Keyboard.write(KEY_RETURN);
    while(digitalRead(beginPin)){}
    delay(50);
    Keyboard.end();
  }

    
  
}

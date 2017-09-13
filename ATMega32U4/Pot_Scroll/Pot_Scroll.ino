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
  while(digitalRead(beginPin)){
    float currentPos = analogRead(potPin);
    if(previousPos+HYSTERESIS < currentPos){
      //step to right
      Keyboard.write(KEY_LEFT_ARROW);
      previousPos += SENSITIVITY;
    }
    if(previousPos-HYSTERESIS > currentPos){
      //step to left
      Keyboard.write(KEY_RIGHT_ARROW);
      previousPos -= SENSITIVITY;
    }
  }
  
  

  
  
}

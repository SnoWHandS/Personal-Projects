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
    Keyboard.println("YOU ARE GETTING HACKED");
    Keyboard.write(KEY_RETURN);
    Keyboard.println("ALL YOUR FILES ARE BELONG TO US");
    Keyboard.write(KEY_RETURN);
    Keyboard.println("BANK ACCOUNT DETAILS FOUND");
    Keyboard.write(KEY_RETURN);
    Keyboard.println("WEBCAM ACCESS GRANTED");
    Keyboard.write(KEY_RETURN);
    Keyboard.println("NUDES FOLDER UPLOADED");
    while(digitalRead(beginPin)){}
    delay(50);
    Keyboard.end();
  }

    
  
}

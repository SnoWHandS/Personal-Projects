// Controlling a servo position using a potentiometer (variable resistor) 
// by Michal Rinott <http://people.interaction-ivrea.it/m.rinott> 

#include <Servo.h> 
 
Servo myservo;  // create servo object to control a servo 
 
int potpin = 1;  // analog pin used to connect the potentiometer
int val;    // variable to read the value from the analog pin
int buttonPin = 5;

int button = 0;
 
void setup() 
{ 
  myservo.attach(6);  // attaches the servo on pin 9 to the servo object 
  pinMode(button, INPUT);
} 
 
void loop() 
{  
    for(val = 0; val<=180; val++)
    {
      myservo.write(val);
      delay(15);
      
      button = digitalRead(buttonPin);
      if(button == HIGH)
      {
        analogControl();
      }
    }
    
     for(val = 180; val>=1; val--)
    {
      myservo.write(val);
      delay(15);
      
      button = digitalRead(buttonPin);
      if(button == HIGH)
      {
        analogControl();
      }
    }
    
} 

void analogControl()
{
    val = analogRead(potpin);            // reads the value of the potentiometer (value between 0 and 1023) 
    val = map(val, 0, 1023, 0, 179);     // scale it to use it with the servo (value between 0 and 180) 
    myservo.write(val);                  // sets the servo position according to the scaled value 
    delay(15);                           // waits for the servo to get there
}

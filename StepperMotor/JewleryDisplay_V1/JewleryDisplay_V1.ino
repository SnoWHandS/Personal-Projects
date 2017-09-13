#include <Ultrasonic.h>
#define TRIGGER_PIN  7
#define ECHO_PIN     6
Ultrasonic ultrasonic(TRIGGER_PIN, ECHO_PIN);

int motorPin1 = 2;
int motorPin2 = 3;
int motorPin3 = 4;
int motorPin4 = 5;
int delayTime = 10;
int stepCounter = 0;
int currentPosition = 0;

int controlPin = 8;

void setup() 
{
  Serial.begin(9600);
  pinMode(motorPin1, OUTPUT);//coil1
  pinMode(motorPin2, OUTPUT);//coil1
  pinMode(motorPin3, OUTPUT);//coil2
  pinMode(motorPin4, OUTPUT);//coil2
  pinMode(controlPin, INPUT);
}

void loop()
{
  //driveClockwise(100);
  //driveCounterClockwise(100);
  
  /*while(digitalRead(controlPin) == LOW)
  {
    driveClockwise(stepCounter);
    stepCounter++;
    Serial.println(stepCounter);
  }  */
  
  applyTurns(checkDistance());
}

int checkDistance()
{
   float cmMsec;
   long microsec = ultrasonic.timing();
   cmMsec = ultrasonic.convert(microsec, Ultrasonic::CM);
   
   int intCmSec = (int) cmMsec;
   
   return intCmSec;
}

void printDistance(int value)
{
 Serial.println(value);
 delay(50);
}

void applyTurns(int distance)
{
  int mappedDistance;
   if(distance > 30)
   {
     return;
   }
   else
   {
     mappedDistance = map(distance, 0, 30, 0, 15);
   }
   
   if(mappedDistance > currentPosition)
   {
     driveCounterClockwise(mappedDistance - currentPosition);
     currentPosition = mappedDistance;
   }
   //else if(mappedDistance < currentPosition)
   //{
   //  driveClockwise(
   //}
   
   Serial.println('MappedDist:'+mappedDistance+'CurrentPos'+currentPosition);
   
   
}


void driveCounterClockwise(int steps)
{
  for(int currentStep = 0; currentStep<steps; currentStep++)
  {
    digitalWrite(motorPin1, LOW);
    digitalWrite(motorPin2, HIGH);//2
    digitalWrite(motorPin3, LOW);
    digitalWrite(motorPin4, HIGH);//1
    delay(delayTime);
  
    digitalWrite(motorPin1, LOW);
    digitalWrite(motorPin2, HIGH);//2
    digitalWrite(motorPin3, HIGH);
    digitalWrite(motorPin4, LOW);//1
    delay(delayTime);
  
    digitalWrite(motorPin1, HIGH);
    digitalWrite(motorPin2, LOW);//2
    digitalWrite(motorPin3, HIGH);
    digitalWrite(motorPin4, LOW);//1
    delay(delayTime);
  
    digitalWrite(motorPin1, HIGH);
    digitalWrite(motorPin2, LOW);//2
    digitalWrite(motorPin3, LOW);
    digitalWrite(motorPin4, HIGH);//1
    delay(delayTime);
  }
}

void driveClockwise(int steps)
{
  for(int currentStep = 0; currentStep<steps; currentStep++)
  {
    digitalWrite(motorPin1, HIGH);//1
    digitalWrite(motorPin2, LOW);
    digitalWrite(motorPin3, LOW);
    digitalWrite(motorPin4, HIGH);//2
    delay(delayTime);
  
    digitalWrite(motorPin1, HIGH);//2
    digitalWrite(motorPin2, LOW);
    digitalWrite(motorPin3, HIGH);//1
    digitalWrite(motorPin4, LOW);
    delay(delayTime);
  
    digitalWrite(motorPin1, LOW);
    digitalWrite(motorPin2, HIGH);//1
    digitalWrite(motorPin3, HIGH);//2
    digitalWrite(motorPin4, LOW);
    delay(delayTime);
  
    digitalWrite(motorPin1, LOW);
    digitalWrite(motorPin2, HIGH);//2
    digitalWrite(motorPin3, LOW);
    digitalWrite(motorPin4, HIGH);//1
    delay(delayTime);
  }
}

//mitsumi servo
void phaseTestFwd() {
  Serial.println("1");
  digitalWrite(motorPin1, HIGH);//1
  digitalWrite(motorPin2, LOW);
  digitalWrite(motorPin3, LOW);
  digitalWrite(motorPin4, HIGH);//2
  delay(delayTime);

  Serial.println("2");
  digitalWrite(motorPin1, HIGH);//2
  digitalWrite(motorPin2, LOW);
  digitalWrite(motorPin3, HIGH);//1
  digitalWrite(motorPin4, LOW);
  delay(delayTime);

  Serial.println("3");
  digitalWrite(motorPin1, LOW);
  digitalWrite(motorPin2, HIGH);//1
  digitalWrite(motorPin3, HIGH);//2
  digitalWrite(motorPin4, LOW);
  delay(delayTime);

  Serial.println("4");
  digitalWrite(motorPin1, LOW);
  digitalWrite(motorPin2, HIGH);//2
  digitalWrite(motorPin3, LOW);
  digitalWrite(motorPin4, HIGH);//1
  delay(delayTime);


}
void phaseTestBack() {
  Serial.println("8");
  digitalWrite(motorPin1, LOW);
  digitalWrite(motorPin2, HIGH);//2
  digitalWrite(motorPin3, LOW);
  digitalWrite(motorPin4, HIGH);//1
  delay(delayTime);

  Serial.println("7");
  digitalWrite(motorPin1, LOW);
  digitalWrite(motorPin2, HIGH);//2
  digitalWrite(motorPin3, HIGH);
  digitalWrite(motorPin4, LOW);//1
  delay(delayTime);

  Serial.println("6");
  digitalWrite(motorPin1, HIGH);
  digitalWrite(motorPin2, LOW);//2
  digitalWrite(motorPin3, HIGH);
  digitalWrite(motorPin4, LOW);//1
  delay(delayTime);

  Serial.println("5");
  digitalWrite(motorPin1, HIGH);
  digitalWrite(motorPin2, LOW);//2
  digitalWrite(motorPin3, LOW);
  digitalWrite(motorPin4, HIGH);//1
  delay(delayTime);
}

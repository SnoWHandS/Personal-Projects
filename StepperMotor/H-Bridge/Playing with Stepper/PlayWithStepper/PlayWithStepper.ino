int motorPin1 = 2;
int motorPin2 = 3;
int motorPin3 = 4;
int motorPin4 = 5;
int delayTime = 10;

void setup() {
  Serial.begin(9600);
  pinMode(motorPin1, OUTPUT);//coil1
  pinMode(motorPin2, OUTPUT);//coil1
  pinMode(motorPin3, OUTPUT);//coil2
  pinMode(motorPin4, OUTPUT);//coil2
}

void loop(){
  for(int i = 0 ; i < 100; i++)
    phaseTestFwd();
  for(int i = 0 ; i < 100; i++)
    phaseTestBack();
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

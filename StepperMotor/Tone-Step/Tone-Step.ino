int stepperDriverPin = 6;
void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  Serial.println("F = 500, 2 second duration");
  tone(stepperDriverPin, 500, 2000);
  delay(2000);
  
  Serial.println("F = 1000, 2 second duration");
  tone(stepperDriverPin, 1000, 2000);
  delay(2000);
}

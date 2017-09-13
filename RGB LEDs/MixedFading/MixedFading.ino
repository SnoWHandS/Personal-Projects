
int red = 3;
int blue = 5;
int green = 6;
int delayTime = 50;

void setup()
{
  pinMode(red, OUTPUT);
  pinMode(blue, OUTPUT);
  pinMode(green, OUTPUT);
}

void loop()
{
  Serial.begin(9600);
  fadeRedBlue();
}

void fadeRedBlue()
{
  int redVal = 0;
 for(int i = 255; i>=0 && redVal<=255; i--)
 {
   Serial.println(redVal);
   Serial.println(i);
   redVal = redVal + i;
   analogWrite(blue, i);
   analogWrite(red, redVal);
   delay(delayTime);
 }
}

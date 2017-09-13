
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
  fadeRed();
  delay(200);
  fadeBlue();
  delay(200);
  fadeGreen();
  delay(200);
}

void fadeRed()
{
 for(int i = 255; i>=0; i--)
 {
   analogWrite(red, i);
   delay(delayTime);
 }
 for(int i = 0; i<=255; i++)
 {
   analogWrite(red, i);
   delay(delayTime);
 }
}

void fadeBlue()
{
 for(int i = 255; i>=0; i--)
 {
  analogWrite(blue, i);
  delay(delayTime);
 }
 for(int i = 0; i>=255; i++)
 {
  analogWrite(blue, i);
  delay(delayTime);
 }
}

void fadeGreen()
 {
  for(int i = 255; i>=0; i--)
 {
  analogWrite(green, i);
  delay(delayTime);
 }
  for(int i = 0; i<=255; i++)
 {
  analogWrite(green, i);
  delay(delayTime);
 } 
}


int red = 3;
int redVal = 0;
int blue = 5;
int blueVal = 0;
int green = 6;
int greenVal = 0;
int delayTime = 5;

void setup()
{
  Serial.begin(9600);
  pinMode(red, OUTPUT);
  pinMode(blue, OUTPUT);
  pinMode(green, OUTPUT);
}

void loop()
{
  beginFade();
}

void beginFade()
{
  Serial.println(redVal);
  fadeRed();
  if(redVal = 85)
  {
    fadeBlue();
  }
  if(redVal = 170)
  {
    fadeGreen();
    redVal = 0;
  }
}

void fadeRed()
{
 for(int i = 255; i>=0; i--)
 {
   redVal = i;
   analogWrite(red, i);
   delay(delayTime);
 }
 for(int i = 0; i<=255; i++)
 {
   redVal = i;
   analogWrite(red, i);
   delay(delayTime);
 }
}

void fadeBlue()
{
 for(int i = 255; i>=0; i--)
 {
  blueVal = i;
  analogWrite(blue, i);
  delay(delayTime);
 }
 for(int i = 0; i>=255; i++)
 {
  blueVal = i;
  analogWrite(blue, i);
  delay(delayTime);
 }
}

void fadeGreen()
{
  for(int i = 255; i>=0; i--)
 {
   greenVal = i;
  analogWrite(green, i);
  delay(delayTime);
 }
  for(int i = 0; i>=255; i++)
 {
  greenVal = i;
  analogWrite(green, i);
  delay(delayTime);
 } 
}

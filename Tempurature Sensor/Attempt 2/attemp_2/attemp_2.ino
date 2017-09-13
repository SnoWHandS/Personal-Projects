
float kelvin, celsius;

void setup()
{
  Serial.begin(9600); 
}

void loop()
{
  kelvin = analogRead(0) * 0.004882812 * 100;
  celsius = kelvin - 273.15;
  Serial.print("Analog:");
  Serial.print(analogRead(0));
  Serial.print("Celsius: ");
  Serial.println(celsius);                  
  Serial.print("Kelvin: ");
  Serial.println(kelvin);
  Serial.println();
  delay(1000);
}

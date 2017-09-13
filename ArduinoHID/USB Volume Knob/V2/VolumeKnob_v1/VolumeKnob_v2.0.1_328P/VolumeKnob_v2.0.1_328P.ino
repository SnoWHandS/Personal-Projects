int clk_pin = 5;
int data_pin = 6;

void setup() {
  Serial.begin(115200);
  pinMode(clk_pin, INPUT);
  pinMode(data_pin, INPUT);
}

void loop() {

  //Read pins
  int clk_pin_state = digitalRead(clk_pin);
  int data_pin_state = digitalRead(data_pin);
  
  //create binary packet of pin states and convert packet to byte
  byte compiled_raw_data = B0;
  if(clk_pin_state == 0 && data_pin_state ==0){
    compiled_raw_data = B00;
  }
  else if(clk_pin_state == 1 && data_pin_state ==0){
    compiled_raw_data = B10;
  }
  else if(clk_pin_state == 1 && data_pin_state ==1){
    compiled_raw_data = B11;
  }
  else if(clk_pin_state == 0 && data_pin_state ==1){
    compiled_raw_data = B01;
  }
  byte pin_state_packet = compiled_raw_data;
  
  //transmit packet
  Serial.write(pin_state_packet);
  
}

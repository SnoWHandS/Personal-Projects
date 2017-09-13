int clk_pin = 7;
int data_pin = 8;
int btn_pin = 12;

void setup() {
  Serial.begin(115200);
  pinMode(clk_pin, INPUT);
  pinMode(data_pin, INPUT);
  pinMode(btn_pin, INPUT);
}

void loop() {

  //Read pins
  int clk_pin_state = digitalRead(clk_pin);
  int data_pin_state = digitalRead(data_pin);
  int btn_pin_state = digitalRead(btn_pin);
  
  //create binary packet of pin states and convert packet to byte
  byte compiled_raw_data = clk_pin_state + (2*data_pin_state) + (4*btn_pin_state);

  byte pin_state_packet = compiled_raw_data;
  
  //transmit packet
  Serial.write(pin_state_packet);
  
}

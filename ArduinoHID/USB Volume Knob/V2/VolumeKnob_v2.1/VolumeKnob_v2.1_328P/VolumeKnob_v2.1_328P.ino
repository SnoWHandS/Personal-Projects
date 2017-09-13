int clk_pin = 5;
int data_pin = 6;
int muteBtn_pin = 9;
int hotkey1 = 4;
int hotkey2 = 3;


void setup() {
  Serial.begin(2000000);
  pinMode(clk_pin, INPUT);
  pinMode(data_pin, INPUT);
  pinMode(muteBtn_pin, INPUT);
  pinMode(hotkey1, INPUT);
  pinMode(hotkey2, INPUT);
}

void loop() {

  //Read pins
  int clk_pin_state = digitalRead(clk_pin);
  int data_pin_state = digitalRead(data_pin);
  int mute_pin_state = digitalRead(muteBtn_pin);
  int hotkey1_state = digitalRead(hotkey1);
  int hotkey2_state = digitalRead(hotkey2);
  
  //create binary packet of pin states and convert packet to byte
  byte compiled_raw_data = clk_pin_state + (2*data_pin_state) + (4*mute_pin_state) + (8*hotkey1_state) + (16*hotkey2_state);
  
  byte pin_state_packet = compiled_raw_data;
  
  //transmit packet
  Serial.write(pin_state_packet);
  
}

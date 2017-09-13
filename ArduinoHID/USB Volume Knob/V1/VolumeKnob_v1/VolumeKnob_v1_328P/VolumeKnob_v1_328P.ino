
const int MAX_KNOB_VAL = 255;
const int MIN_KNOB_VAL = 0;

uint8_t current_knob_val = 0x00;   //YOLO GLOBAL VARIABLES WOOHOO
boolean previous_clk_pin_state = true;

int clk_pin = 5;
int data_pin = 6;

void setup() {
  Serial.begin(115200);
  pinMode(clk_pin, INPUT);
  pinMode(data_pin, INPUT);
  previous_clk_pin_state = digitalRead(clk_pin);
}

void loop() {
  boolean clk_pin_state = digitalRead(clk_pin);
  if(clk_pin_state != previous_clk_pin_state){

    if(digitalRead(data_pin) != clk_pin_state){
      current_knob_val++;
    }
    else{
      current_knob_val--;
    }  
  }
  previous_clk_pin_state = clk_pin_state;

  if(current_knob_val >= MAX_KNOB_VAL){
    current_knob_val = MAX_KNOB_VAL;
  }
  if(current_knob_val <= MIN_KNOB_VAL){
    current_knob_val = MIN_KNOB_VAL;
  }
  
  Serial.write(current_knob_val);
  delay(10);
}


boolean previous_clk_pin_state = false;
const int clk_pin = 3;
const int data_pin = 2;

boolean clk_pin_state = true;
boolean data_pin_state = true;

void setup() {
  // put your setup code here, to run once:
  //pinMode(clk_pin, INPUT);
  //pinMode(data_pin, INPUT);

  Serial.begin(9600);
}

void loop() {
    //Check encoder for incrementation
    clk_pin_state = digitalRead(clk_pin);
    data_pin_state = digitalRead(data_pin);
   if(clk_pin_state != previous_clk_pin_state){

    if(data_pin_state != clk_pin_state){
      //Consumer.write(MEDIA_VOLUME_DOWN);
      Serial.println("Incr down");
    }
    else{
      //Consumer.write(MEDIA_VOLUME_UP);
      Serial.println("Incr up");
    }  
  }
  previous_clk_pin_state = clk_pin_state;
}

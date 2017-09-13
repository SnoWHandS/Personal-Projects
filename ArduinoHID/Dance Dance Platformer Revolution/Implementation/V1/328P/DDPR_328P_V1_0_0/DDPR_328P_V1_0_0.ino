/* Authors:
 *  Dillon Heald
 *  Tamara Nieuwoudt
 *  2017
 * 
 * Dance Dance Platformer Revolution controller
 * Important note: Computer hosting game must be plugged into the wall socket
 * of the building to ensure best controller response.
 */

#include <CapacitiveSensor.h>

CapacitiveSensor   w = CapacitiveSensor(4,0);        // 10M resistor between pins 4 & 0, pin 0 is sensor pin, add a wire and or foil
CapacitiveSensor   a = CapacitiveSensor(4,1);        // 10M resistor between pins 4 & 1, pin 1 is sensor pin, add a wire and or foil
CapacitiveSensor   s = CapacitiveSensor(4,2);        // 10M resistor between pins 4 & 2, pin 2 is sensor pin, add a wire and or foil
CapacitiveSensor   d = CapacitiveSensor(4,7);        // 10M resistor between pins 4 & 7, pin 7 is sensor pin, add a wire and or foil
int btn1 = 8;
int btn2 = 12;

long w_max = 99999;
long a_max = 99999;
long s_max = 99999;
long d_max = 99999;

long w_min = 0;
long a_min = 0;
long s_min = 0;
long d_min = 0;

long w_trigger = 2000;
long a_trigger = 2000;
long s_trigger = 2000;
long d_trigger = 2000;

boolean w_state = 0;
boolean a_state = 0;
boolean s_state = 0;
boolean d_state = 0;
boolean btn1_state = 0;
boolean btn2_state = false;

    long w_read = w.capacitiveSensor(30);
    long a_read = a.capacitiveSensor(30);
    long s_read = s.capacitiveSensor(30);
    long d_read = d.capacitiveSensor(30);

void setup() {
   w.set_CS_AutocaL_Millis(0xFFFFFFFF);     // turn off autocalibrate on channel 1 - just as an example
   Serial.begin(115200);
   
  //Calibrate sensors
    //Assign min and max for each sensor

    pinMode(btn1, INPUT);
    pinMode(btn2, INPUT);
}

void loop() {
    w_read = w.capacitiveSensor(30);
    a_read = a.capacitiveSensor(30);
    s_read = s.capacitiveSensor(30);
    d_read = d.capacitiveSensor(30);
    btn1_state = digitalRead(btn1);
    btn2_state = digitalRead(btn2);
  //Determine buttons pressed

  
  if(w_read>=w_trigger){
    w_state = true;
  }
  else{
    w_state = false;
  }

  //A state
  if(a_read>=a_trigger){
    a_state = true;
  }
  else{
    a_state = false;
  }
  
  //S state
  if(s_read>=s_trigger){
    s_state = true;
  }
  else{
    s_state = false;
  }
  
  //D state
  if(d_read>=d_trigger){
    d_state = true;
  }
  else{
    d_state = false;
  }*/
  
  //Create data packet       bit 0       bit 1         bit 2           bit 3      bit 4(0 = pushed)  bit 5 (0 = pushed)
  byte button_data_packet = w_state + (2*a_state) + (4*s_state) + (8*d_state) + (16*!btn1_state) + (32*!btn2_state);
  //Transmit data packet
  Serial.write(button_data_packet);
  delay(5000);
   
}

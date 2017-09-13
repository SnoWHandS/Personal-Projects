#include <Keypad.h>
#include "LedControl.h"
LedControl lc=LedControl(12,11,10,4);
int i = 0;    // digit selector
char code[4];

const byte ROWS = 4; //four rows
const byte COLS = 4; //four columns
//define the cymbols on the buttons of the keypads
char hexaKeys[ROWS][COLS] = 
{
  {'1','2','3','A'},
  {'4','5','6','B'},
  {'7','8','9','C'},
  {'*','0','#','D'}
};

byte rowPins[ROWS] = {5, 4, 3, 2}; //connect to the row pinouts of the keypad
byte colPins[COLS] = {9, 8, 7, 6}; //connect to the column pinouts of the keypad

//initialize an instance of class NewKeypad
Keypad customKeypad = Keypad( makeKeymap(hexaKeys), rowPins, colPins, ROWS, COLS); 

void setup()
{
  Serial.begin(9600);
  lc.shutdown(0,false);
  /* Set the brightness to a medium values*/
  lc.setIntensity(0,8);
  /* and clear the display */
  lc.clearDisplay(0);
  
}
  
void loop()
{
  
  char customKey = customKeypad.getKey();
  if (customKey)
  {
    Serial.println(customKey);
    displayValue(customKey);
    i = chooseSegment(i, customKey);
    storeValue(customKey, i);    
  }
  
  
}

void displayValue(char customKey)
{
  int keypadInt = (int(customKey) - 48);
  lc.setDigit(0,i, keypadInt, false);
}

int chooseSegment(int i, char customKey)
{
  int state = customKey;
  
  if(customKey)       //Change digit holder up
  {
    i++;
    if(i > 3)
    {
     i = 3; 
    }
  }
  if(state == 42)       //Clears display and sets carrige to first digit
  {
    lc.clearDisplay(0);
    i = 0;
  }
  
  if(state == 35)
  {
    
  }
  return i;  
}

char storeValue(char customKey,int i)
{  
  code[i] = customKey;
  Serial.println(code);
  return *code;  
}


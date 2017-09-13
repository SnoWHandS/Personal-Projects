#include <SPI.h>
#include <MFRC522.h>

#define SS_PIN 10
#define RST_PIN 9
MFRC522 mfrc522(SS_PIN, RST_PIN);        // Create MFRC522 instance.

void setup()
{
  Serial.begin(9600);                  //Begin serial communication between Microcontroller and PC
  SPI.begin();                         //Initialise the SPI communication bus
 mfrc522.PCD_Init();                   // Initialise the RFID scanner
}

void loop()
{
  
  //Creates an instance of the Factory key on the tag
  MFRC522::MIFARE_Key key;
  for(byte i = 0; i<6; i++)
  {
   key.keyByte[i] = 0xFF; 
  } 
  
  // restart if RFID EEPROM is not present
  if(! mfrc522.PICC_IsNewCardPresent())
  {
    return;
  }
  //checks if the card is readable and select card
  if(! mfrc522.PICC_ReadCardSerial())
  {
   return; 
  }
  
  //Dumping the User ID
  dumpUserID();
  //Dumping PICC type
  dumpPICCType();
  
  
  //defining second sector on EPPROM
  
 byte sector = 1;                 //first sector = 0, second = 1
 
 //Sector 1 contains block 4 - 7 
  byte valueBlockA = 4;
  byte trailerBlock = 7;
  byte status;
  //Authenticate using keyblock A
  
  status = mfrc522.PCD_Authenticate(MFRC522::PICC_CMD_MF_AUTH_KEY_A, trailerBlock, &key, &(mfrc522.uid));
  
  if(status != MFRC522::STATUS_OK)
  {
    Serial.print("Authentication failed for BlockA, Error code:");
    Serial.println(mfrc522.GetStatusCodeName(status));
    return;
  } 
  
  //Writing to block A
  Serial.println("Writing new value block");
      byte valueBlock[] = {1,2,3,4,  5,6,7,8, 9,10,255,12,  13,14,15,16,   valueBlockA,~valueBlockA,valueBlockA,~valueBlockA};
      
      
      //0xB,0xE,0xE,0xF, 0xF,0xA,0xC,0xE, 0xC,0xA,0xB,0xA,0xB,  valueBlockA,~valueBlockA,valueBlockA,~valueBlockA
      status = mfrc522.MIFARE_Write(valueBlockA, valueBlock, 17);
      if(status != MFRC522::STATUS_OK)
      {
        Serial.print("Authentication failed for BlockA, Error code:");
        Serial.println(mfrc522.GetStatusCodeName(status));
      }
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
  
    
}

void dumpUserID()
{
  Serial.print("Card User ID:");
  for(byte i = 0; i < mfrc522.uid.size; i++)
  {
   Serial.print(mfrc522.uid.uidByte[i] < 0x10 ? " 0 " : " ");
   Serial.print(mfrc522.uid.uidByte[i], HEX); 
  }
  Serial.println();
}

void dumpPICCType()
{
 byte piccType = mfrc522.PICC_GetType(mfrc522.uid.sak);
  Serial.print("PICC type: ");
  Serial.println(mfrc522.PICC_GetTypeName(piccType));
  
  //Verifying the PICC chip is of a Mifare type
  if(  piccType != MFRC522::PICC_TYPE_MIFARE_MINI
  &&   piccType != MFRC522::PICC_TYPE_MIFARE_1K
  &&   piccType != MFRC522::PICC_TYPE_MIFARE_4K)
  {
   return; 
  } 
}

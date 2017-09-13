/*Created by the mistro Dillon Heald with the aid of master Luke Edwards*/

#include <conio.h>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <ctype.h>
#include <string.h>

/* ----------------------------------------------------------------------------
 * Global Constants
 */
#define FILEPATH 20                       // Maximum length of file path and name
#define SIZE 100                          // max no of circuits

/* ----------------------------------------------------------------------------
 * Global Type
 */
enum Boolean {FALSE, TRUE};				  // Type for testing values

struct Components
{
      int r;
      float ind;
      float cap;
      float resFreq;
};                                 


/* ----------------------------------------------------------------------------
 * Prototypes
 */
 
//Void Prototypes:
void menu();
void description();
void calcResFreq(struct Components results[], int size);
void sortByRes(struct Components results[], int size);
int readComponents(struct Components results[], int size);
void displayResults(struct Components results[], int size);
void saveFile(struct Components results[], int size);
void clrscr();
void pause();

/* ----------------------------------------------------------------------------
 * Main
 */
 
main()
{
// do
// {
   menu();
   
  // printf("\n\nWould you like to do further calculations?  ");
    
//}
 //while (toupper(getch()) == 'Y');
 
 return 0;
}

/* ----------------------------------------------------------------------------
 * menu
 */
void menu()
{
 // Menu Options
 enum Options {DESCRIBE = 49, READ, CALCRES, SORTRES, DISPRESLT};
 
 int size = 0;
 struct Components results[SIZE] = {0, 0, 0, 0};
 
 // Define and initialize variables
 static int loop = TRUE;
 
  do
  {
        //Displays Menu to user
        clrscr();
	printf("\n ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป\n");
    printf(" บ               RESONANT FREQUENCY CALCULATOR                  บ\n");
    printf(" \314ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ\271\n");
    printf(" บ                          Options                             บ\n");
    printf(" บ                                                              บ\n");
    printf(" บ 1. Description of Application                                บ\n");
    printf(" บ                                                              บ\n");
    printf(" บ 2. Read data from File                                       บ\n");
    printf(" บ                                                              บ\n");
    printf(" บ 3. Calculate Resonant Frequency                              บ\n");
    printf(" บ                                                              บ\n");
    printf(" บ 4. Sort Results by Resonant Frequency                        บ\n");
    printf(" บ                                                              บ\n");
    printf(" บ 5. Display and Save Results to File                          บ\n");
    printf(" บ                                                              บ\n");
    printf(" บ 6. Exit the Application                                      บ\n");
    printf(" ศออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออผ\n\n\n");

	printf("Please enter the NUMBER of your choice: ");
	
    fflush(stdin);                     // Clear input buffer of any legacy characters
    
    switch(getch())
    {
                   case DESCRIBE:      clrscr();
                                       description();
                                       break;
                   
                   case READ:          clrscr();
                                       size = readComponents(results, size);
                                       break;
                   
                   case CALCRES:       clrscr();
                                       calcResFreq(results, size);
                                       break;
                                  
                   case SORTRES:       clrscr();
                                       sortByRes(results, size);
                                       break;
                            
                   case DISPRESLT:     clrscr();
                                       displayResults(results, size);
                                       break;
                                 
                   default: loop = FALSE;
    puts("\n\n\nThank you for using our software, pleae email dillon.heald@gmail.com\nwith regard to any problems or suggestions.\n");
    pause();        
    }
   }
   while(loop);
}
 
/* ----------------------------------------------------------------------------
 * description
 */
void description()
{
clrscr();
     printf("\n ษออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออป\n");
     printf(" บ               RESONANT FREQUENCY CALCULATOR                  บ\n");
     printf(" \314ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ\271\n");
     printf ("\nDescription\n");
     printf ("-----------\n");
     printf ("\nThis application is used to calculate the Resonant Frequency in ");
     printf ("series RLC \ncircuits. The user must upload the information via a text file.");
     printf ("\n\nThe RLC values and the calculated resonant frequency can be ");
     printf ("displayed or \nalternatively written to a text file.");
     printf ("\n\nThe user also has the option of sorting the values according ");
     printf ("to the resonant \nfrequency.");
pause();
}

/* ----------------------------------------------------------------------------
 * calculate resonant frequency menu
 */
void calcResFreq(struct Components results[], int size)
{
 int count = 0;
 if(results[count].r == 0 || results[count].ind == 0 || results[count].cap == 0)
 {
   printf("\nFile not loaded!");
   pause();
 }
 else
 {
     for(count = 0; count < size; count++)
     {
       results[count].resFreq = 1/(2*M_PI*sqrt((results[count].ind/1000)*(results[count].cap/1000000))); 
     }
   printf("\nResonant frequencies successfully calculated!\n");
   pause();    
 }
}

/* ----------------------------------------------------------------------------
 * Sort by resonant frequency function
 */
void sortByRes(struct Components results[], int size)
{
     int counter = 0;
     int pass;
     struct Components temp;
     
     if(results[counter].resFreq == 0)
     {
       printf("\nResonant Frequency has not been calculated yet!");
       pause();                      
     }
     else
     {     
      for(pass = 1; pass < size; ++pass)
       {
        for(counter = 0; counter < size - 1; ++counter)
        {
          if(results[counter].resFreq  > results[counter + 1].resFreq )
          {
            temp = results[counter];
            results[counter] = results[counter + 1];
            results[counter + 1]= temp;                            
          }
         }      
        }
       printf("\nData has successfully been sorted in ascending order of Resonant Frequency\n\n");
       pause();
      }
}
/* ----------------------------------------------------------------------------
 * Read components function
 */
int readComponents(struct Components results[], int size)
{     
 FILE *fPtr;

 char fileName[FILEPATH];
 
 printf("\nPlease enter the name of the file you wish to import followed by .txt\n\n");
 scanf("%s", &fileName);
 
 if((fPtr = fopen(fileName, "r")) == NULL)
 {
  printf("\nfile could not be opened\n");    
 }
 else
 {
  while(!feof(fPtr))
  {
   fscanf(fPtr,"%d", &results[size].r);
   fscanf(fPtr,"%f", &results[size].ind);
   fscanf(fPtr,"%f", &results[size].cap);
   size++;                                
  }
  fclose(fPtr);
  printf("\nResults successfully stored!\n\n");
  
    
 }
 pause();
 return size;
}

/* ----------------------------------------------------------------------------
 * Display results function
 */
void displayResults(struct Components results[], int size)
{
  int recordCount = 0;
  
  printf("%6c%16s%21cF%24s\n", 234, "mH", 230,"Hz");
  printf("\ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ\n");
  for(recordCount = 0; recordCount < size; recordCount++)
  {
   printf("%6d%17.2f%22.2f%24.0f\n",results[recordCount].r, results[recordCount].ind, results[recordCount].cap, results[recordCount].resFreq);               
  }
  if(results[0].r != 0)
  {
   printf("\nWould you like to save these results to a text file?\n\n");
   
   fflush(stdin);
   if(toupper(getch()) == 'Y')
   {
    clrscr();    
    saveFile(results, size);       
   }
  }
}

/* ----------------------------------------------------------------------------
 * Save File funciton
 */
void saveFile(struct Components results[], int size)
{
     char outFileName[FILEPATH];
     int fileCount = 0;
     printf("Please enter the name of the file you wish to save these results to\nfollowed by the extension .txt\n\n");
     scanf("%s",&outFileName);
     
     FILE *fPtr;
     if((fPtr = fopen(outFileName, "w")) == NULL)
     {
             printf("\nYOU DO SOMETHING WRONG! DELETING SYSTEM32.dll");
             pause();
     }
     else
     {                  
         fprintf(fPtr,"%7s%15s%21sF%24s\n", "Ohms", "mH", "u","Hz");
         fprintf(fPtr,"\________________________________________________________________________________\n");
         for(fileCount = 0; fileCount < size; fileCount++)
           {
            fprintf(fPtr,"%6d%17.2f%22.2f%24.0f\n",results[fileCount].r, results[fileCount].ind, results[fileCount].cap, results[fileCount].resFreq);           
           }
         fclose(fPtr);
         printf("\nData successfully uploaded to %s\n\n",outFileName);
         
     }
   pause();  
}

/* ----------------------------------------------------------------------------
 * pauses output
 */
void pause()
{
     system("pause");
}
/* ----------------------------------------------------------------------------
 * clears the screen
 */
void clrscr()
{
     system("cls");     
}

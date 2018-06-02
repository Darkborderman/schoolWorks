#include "Arduino.h"
#include "LTimer.h"

#define S0     16
#define S1     15
#define S2     14
#define S3     13
#define OUT    17

LTimer timer0(LTIMER_0);
int     g_array[3];     // 儲存 RGB 值
int     g_flag = 0;     // RGB 過濾順序 R:0 G:1 B:2
float   g_SF[3];        // 儲存白平衡計算後之 RGB 補償係數

float RGB[3]={0,0,0};
int finish=0;

//initialize color sensor
void TCS_Init()
{
  pinMode(S0, OUTPUT);
  pinMode(S1, OUTPUT);
  pinMode(S2, OUTPUT);
  pinMode(S3, OUTPUT);
  pinMode(OUT, INPUT);
  // OUTPUT FREQUENCY SCALING 2%
  digitalWrite(S0, LOW);
  digitalWrite(S1, HIGH);
}

void setup()
{
  // initialization
  TCS_Init();
  Serial.begin(9600);
  // start the execution
  timer0.begin();
  timer0.start(500, LTIMER_REPEAT_MODE, TCS_Callback, NULL); 
  delay(2000);
}

//callback function for timer0, use it to call color sensor detection
void TCS_Callback(void *usr_data)
{
  int frequency=0;
  frequency = pulseIn(OUT, LOW);
  switch(g_flag)
  {
    case 0: 
      TCS_WB(LOW, LOW);              // Red
      break;
    
    case 1:
      if(!finish)
      {
        Serial.print("->Frequency R=");
        Serial.println(frequency);
      }
      g_array[0] = frequency;
      TCS_WB(HIGH, HIGH);            // Green
      break;
    
    case 2:
      if(!finish)
      {
        Serial.print("->Frequency G=");
        Serial.println(frequency);
      }
      g_array[1] = frequency;
      TCS_WB(LOW, HIGH);             // Blue
      break;
    
    case 3:
      if(!finish)
      {
        Serial.print("->Frequency B=");
        Serial.println(frequency);
      }
      g_array[2] = frequency;
      TCS_WB(HIGH, LOW);             // Clear(no filter)   
      break;
  }

  g_flag++;
}

// 白平衡
void TCS_WB(int Level0, int Level1)
{
  digitalWrite(S2, Level0);
  digitalWrite(S3, Level1); 
}

//Judge RGB color intensity
//it will be executed after finish compensation
void AdjustColor(int* garray)
{
  int maxium=0,mapColor[3],temp[3],minium=8192;
  for(int i=0;i<3;i++)
  {
    //set the maxium
    if(garray[i]>=8192) garray[i]=8192;
    
    //calculate the result enchanced by coefficient
    temp[i]=garray[i]*RGB[i];
  }
  //get the maxium value, used in map function
  for(int i=0;i<3;i++) maxium=max(maxium,temp[i]);
  
  //map the color into 0-255
  for(int i=0;i<3;i++) mapColor[i]=map(garray[i],0,maxium,255,0);
  
  Serial.println("AdjustColor:");
  for(int i=0;i<3;i++) Serial.println(mapColor[i]);

  maxium=0;
  for(int i=0;i<3;i++)
  {
    maxium=max(maxium,mapColor[i]);
    minium=min(minium,mapColor[i]);
  }
  //if color is different enough then judge which color
  int range=40;
  if(mapColor[0]-mapColor[1]>=range&&mapColor[0]-mapColor[2]>=range)
  {
    Serial.println("---Red---");
  }
  else if(mapColor[1]-mapColor[2]>=range&&mapColor[1]-mapColor[0]>=range)
   {
    Serial.println("---Green---");
   }
    
  else if(mapColor[2]-mapColor[1]>=range&&mapColor[2]-mapColor[0]>=range)
  {
    Serial.println("---Blue---");
  }
}

void loop(){

g_flag = 0; //重置flag

  if(!finish)
  {
    int temp[3];
    for(int i=0; i<3; i++)
    {
      temp[i]=int(g_array[i] * g_SF[i]);
      Serial.println(temp[i]);
      //if color fall in the acceptable range, then we can take it as final RGB
      if(temp[i]>=253&&temp[i]<=257) RGB[i]=g_SF[i];
    }
    // 計算補償係數
    Serial.println("The compensation coefficient of RGB is: ");
    for(int i=0; i<3; i++)
    {
      g_SF[i] = 255.0/ g_array[i];
      Serial.println(g_SF[i]);
    }
    //all 3 RGB are correct
    if(RGB[0]&&RGB[1]&&RGB[2]) finish=1;
  }
  if(finish)
  {
    Serial.println("---correct compensation cofficient RGB---");
    for(int i=0;i<3;i++) Serial.println(RGB[i]);
    AdjustColor(g_array);
  }
  delay(2000);
}




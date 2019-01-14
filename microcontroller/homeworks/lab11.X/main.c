#include "setting_hardaware/setting.h"
#include <stdlib.h>
#include "stdio.h"
#include "string.h"
// using namespace std;
#define C4 262
#define F4 349
#define G4 392
#define A4 440
#define B4 494
#define C5 523
#define D5 587
#define F5 698
#define G5 783
#define E5 659

int tone[2][8] = { {250,250,0,0,500,500,0,0},
                    {250,250,500,500,250,250,500,500}
                    } ;
int tone_index=0;
int tempo[2] = {1};
int count = 0;
int index=0;

int mode0=1;
int mode1=0;
int mode2=0;
int mode3=1;

int isPlaySound=1;

int light_length=3;
int light_counter=0;

char str[12];

void Mode2() { // Output Voltage 
    ClearBuffer();
    int digital = 0;
    float voltage = 0.0;

        digital=ADC_Read(0);
        voltage = digital* ((float)5/1023); // 5v / 2^10-1  (10bits)
        // TODO
        memset(str,0,12);
        sprintf(str,"%lf",voltage);
        UART_Write_Text(str);
        UART_Write_Text("V");
        
        // Output the voltage on CLI.
        // The voltage must have the second digit after the decimal point.
        for(int i = 0 ; i < 10000 ; i++) ; // a delay time

    ClearBuffer();
}

void PlaySound(int track){
    mode3=1;
    UART_Write_Text("play");
    if(track==1) tone_index=0;
    if(track==2) tone_index=1;
    ClearBuffer();
    isPlaySound=1;
}
void StopSound(){
    mode3=0;
    UART_Write_Text("stop");
    ClearBuffer();
    isPlaySound=0;
}
void BlinkLight(int number,int length){
    
    UART_Write_Text("enter");
    ClearBuffer();
    light_length=length*2;
    TRISDbits.RD0=1;
    TRISDbits.RD1=1;
    TRISDbits.RD2=1;
    TRISDbits.RD3=1;
    
    if(number==4){
        TRISDbits.RD0=0;
        TRISDbits.RD1=0;
        TRISDbits.RD2=0;
        TRISDbits.RD3=0;
    }
    else if(number==3){
        TRISDbits.RD0=0;
        TRISDbits.RD1=0;
        TRISDbits.RD2=0;
    }
    else if(number==2){
        TRISDbits.RD0=0;
        TRISDbits.RD1=0;
    }
    else if(number==1){
        TRISDbits.RD0=0;
    }

}

//sorry I can't do that
void breathe(){
    mode2=1;
}

void main(void) 
{
    PR2=0;
    TRISCbits.RC2 = 0;
    SYSTEM_Initialize() ;
    
    T2CONbits.TMR2ON = 1;
    T2CONbits.T2CKPS = 1;
    CCP1CONbits.CCP1M = 12;
    while(1) {
        
        //reset mode
        if(strstr(GetString(),"q")!=NULL){
            ClearBuffer();
            mode1=0;
            mode2=0;
            mode3=0;
            mode0=1;
        }
        //breathe light(mode 2)
        else if(strstr(GetString(),"breath")!=NULL) breathe();
        
        //play song (mode 3)
        else if(strstr(GetString(),"music")){
            if(strstr(GetString(),"music 1")!=NULL) PlaySound(1);
            else if(strstr(GetString(),"music 2")!=NULL) PlaySound(2);
        }
        //blink the light(mode 1)
        else if(strstr(GetString(),"blink")){
            mode1=1;
            if(strstr(GetString(),"blink 1")!=NULL){
                if(strstr(GetString(),"blink 1 1")!=NULL)BlinkLight(1,1);
                else if(strstr(GetString(),"blink 1 2")!=NULL)BlinkLight(1,2);
                else if(strstr(GetString(),"blink 1 3")!=NULL) BlinkLight(1,3);
                else if(strstr(GetString(),"blink 1 4")!=NULL) BlinkLight(1,4);
            }
            else if(strstr(GetString(),"blink 2")!=NULL) {
                if(strstr(GetString(),"blink 2 1")!=NULL) BlinkLight(2,1);
                else if(strstr(GetString(),"blink 2 2")!=NULL) BlinkLight(2,2);
                else if(strstr(GetString(),"blink 2 3")!=NULL) BlinkLight(2,3);
                else if(strstr(GetString(),"blink 2 4")!=NULL) BlinkLight(2,4);
            }
            else if(strstr(GetString(),"blink 3")!=NULL){
                if(strstr(GetString(),"blink 3 1")!=NULL) BlinkLight(3,1);
                else if(strstr(GetString(),"blink 3 2")!=NULL) BlinkLight(3,2);
                else if(strstr(GetString(),"blink 3 3")!=NULL) BlinkLight(3,3);
                else if(strstr(GetString(),"blink 3 4")!=NULL) BlinkLight(3,4);
            }
            else if(strstr(GetString(),"blink 4")!=NULL){
                if(strstr(GetString(),"blink 4 1")!=NULL) BlinkLight(4,1);
                else if(strstr(GetString(),"blink 4 2")!=NULL) BlinkLight(4,2);
                else if(strstr(GetString(),"blink 4 3")!=NULL) BlinkLight(4,3);
                else if(strstr(GetString(),"blink 4 4")!=NULL) BlinkLight(4,4);
            }
            
        }
        
        else if(strstr(GetString(),"s")!=NULL&&mode3==1){ StopSound();}
        else if(strstr(GetString(),"p")!=NULL){ PlaySound(tone_index+1); }
        
    }
    return;
}

void __interrupt() tc_int(void)
{
    if(PIR2bits.TMR3IF){
        PIR2bits.TMR3IF=0;
    }
    if(PIR1bits.TMR1IF){
        //handle sound and blight light
        light_counter++;
        count++;
        if(count==tempo[0]){
            count=0;
            index++;
            CCPR1L=10;
            PR2 = tone[tone_index][index];
            if(index==7) index=0;
            if(isPlaySound==0){
                PR2 = 0;
            }
        }
        if(light_counter%light_length<(light_length/2)){
            LATDbits.LATD0=1;
            LATDbits.LATD1=1;
            LATDbits.LATD2=1;
            LATDbits.LATD3=1;
        }
        else{
            LATDbits.LATD0=0;
            LATDbits.LATD1=0;
            LATDbits.LATD2=0;
            LATDbits.LATD3=0;
        }
        
        TMR1 = 30000; //0.25sec
        PIR1bits.TMR1IF =0;
    }
}

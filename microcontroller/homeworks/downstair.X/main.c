#include "setting_hardaware/setting.h"
#include <stdlib.h>
#include "stdio.h"
#include "string.h"
#include <math.h>

#define playerWidth 10
#define playerHeight 10
#define plateWidth 30
#define plateHeight 10

#pragma config WDT = OFF
#pragma config LVP = OFF

void sendData(void);
void createPlate(int index);
void destroyPlate(int index);

typedef struct Square{
    int x,y;
}Square;

Square player,plate[5];
int plateNumber=0;
int onplate=0;
int life=3;

void main(void) 
{    
    //open TRISB for PORTB interrupt input
    TRISB=0xff;
    
    //RD0&RD1 for bottom,RD2&RD3 for LED display
    TRISDbits.RD0=1;
    TRISDbits.RD1=1;
    TRISDbits.RD2=0;
    TRISDbits.RD3=0;
    //TRISC for LED display
    TRISC=0;
    
    
    player.x=30;
    player.y=10;
    for(int i=0;i<=4;i++){
        plate[i].x=0;
        plate[i].y=0;
    }

    UART_Initialize();
    OSCILLATOR_Initialize();
    INTERRUPT_Initialize();
    
    createPlate(0);
    while(1) {
        LATDbits.LATD3=0;
        //display life
        LATC=life;
        //do nothing
        if(life==0) return;
    }
    return;
    
}

// old version: 
// void interrupt high_priority Hi_ISR(void)
void __interrupt(high_priority) Hi_ISR(void)
{ 
    //button click
    if(INTCONbits.RBIF==1)
    {
        if(PORTDbits.RD0==1){
            if(player.x>20) player.x-=5;
        }
        if(PORTDbits.RD1==1){
            if(player.x<140) player.x+=5;
        }
        LATDbits.LATD3=1;        
        
        INTCONbits.RBIF=0;
        //LATDbits.LATD3=0;        
        
        
    }
    //clock tick, change frame and move everything 
    if(PIR1bits.TMR1IF==1){
        //showing frame and reset stuff
        PIR1bits.TMR1IF=0;
        TMR1=0;
        if(LATDbits.LATD2==1) LATDbits.LATD2=0;
        else LATDbits.LATD2=1;
        //move everything
        for(int i=0;i<=plateNumber-1;i++){
            plate[i].y-=1;
            if(player.y+playerHeight==plate[i].y){
                if(player.x+playerWidth>=plate[i].x&&player.x<=plate[i].x+plateWidth){
                    player.y-=1;
                    onplate=1;
                }
            }
        }
        //detect player is on plate or not
        if(onplate==0){
            player.y+=1;
        }
        onplate=0;
        //check plate destroy or create
        for(int i=0;i<=plateNumber-1;i++){
            if(plate[i].y<=0){
                destroyPlate(i);
                createPlate(i);
            }
        }
        //player dead
        if(player.y<=0||player.y>=110){
            player.x=0;
            player.y=20;
            life--;
        }
        //sendData();
        LATDbits.LATD3=0;        
    }
    if(INTCONbits.INT0IF==1){
        INTCONbits.INT0IF=0;
        sendData();
    }
    return ;
}
void sendData(){
    //send data format
    //B:123 123
    //231 132
    //12 3
    //end
    {
        char data[10];
        ClearBuffer();
        snprintf(data,10,"0:%d %d\r",player.x,player.y);
        UART_Write_Text(data);
        ClearBuffer();
    }
    for(int i=0;i<=plateNumber-1;i++){
        char data[10];
        ClearBuffer();
        snprintf(data,10,"%d:%d %d\r",i+1,plate[i].x,plate[i].y);
        UART_Write_Text(data);
        ClearBuffer();
    }
}

void createPlate(int index){
    int x=rand()%(120-plateWidth);
    int y=(rand()%40)+61;
    plate[index].x=x;
    plate[index].y=y;
    plateNumber+=1;
}
void destroyPlate(int index){
    plate[index]=plate[plateNumber-1];
    plateNumber-=1;
}
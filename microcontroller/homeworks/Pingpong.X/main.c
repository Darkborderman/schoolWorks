#include "setting_hardaware/setting.h"
#include <stdlib.h>
#include "stdio.h"
#include "string.h"
#include <math.h>

#define PlayerWidth 10
#define PlayerHeight 30
#define BallWidth 10
#define BallHeight 10

#define Player1X 10
#define Player2X 140

#pragma config WDT = OFF
#pragma config LVP = OFF

void sendData(void);

typedef struct Ball{
    int x,y;
    int hvelo,vvelo;
}Ball;

typedef struct Player{
    int y;
}Player;

Ball ball;
Player player1,player2;
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
    
    //ball and player value initialize
    ball.x=40;
    ball.y=20;
    player1.y=20;
    player2.y=20;
    
    ball.hvelo=1;
    ball.vvelo=1;
    
    UART_Initialize();
    OSCILLATOR_Initialize();
    INTERRUPT_Initialize();
    
    while(1) {
        LATDbits.LATD3=0;
        //display life
        LATC=life;
        //do nothing
        if(life==0) return;
    }
    return;
    
}

void __interrupt(high_priority) Hi_ISR(void)
{ 
    //button click
    if(INTCONbits.RBIF==1)
    {
        if(PORTDbits.RD0==1){
            if(player1.y>5) player1.y-=5;
        }
        if(PORTDbits.RD1==1){
            if(player1.y<110) player1.y+=5;
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
        //detect ball is collide with player or not
        if(ball.x==Player1X+PlayerWidth&&(player1.y<=ball.y&&player1.y+PlayerHeight>=ball.y)){
            ball.hvelo*=-1;
        }
        if(ball.x==Player2X&&(player2.y<=ball.y&&player2.y+PlayerHeight>=ball.y)){
            ball.hvelo*=-1;
        }
        //detect ball is collide with wall or not
        if(ball.y<=0||ball.y+BallHeight>=120) ball.vvelo*=-1;
        //move everything
        ball.x+=ball.hvelo;
        ball.y+=ball.vvelo;

        //player dead
        if(ball.x<=0){
            ball.x=40;
            ball.y=20;
            ball.hvelo=1;
            ball.vvelo=1;
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
        snprintf(data,10,"0:%d %d\r",ball.x,ball.y);
        UART_Write_Text(data);
        ClearBuffer();
    }
    {
        char data[10];
        ClearBuffer();
        snprintf(data,10,"1:%d\r",player1.y);
        UART_Write_Text(data);
        ClearBuffer();
    }
        {
        char data[10];
        ClearBuffer();
        snprintf(data,10,"2:%d\r",player2.y);
        UART_Write_Text(data);
        ClearBuffer();
    }

}
#pragma config OSC = INTIO67
#pragma config WDT = OFF
#pragma config PBADEN = OFF
#pragma config LVP =OFF
#include <xc.h>
#define N 500u
#define C 523
#define D 587u
#define E 622u
#define F 698u
#define G 370u
#define A 415u
#define B 466u


int tone[98] = {E, N, E, N, E, N, 
                E, N, E, N, E, N, 
                E, N, G, N, C, N, D, N, E, N,
                F, N, F, N, F, N, F, N,
                F, N, E, N, E, N, E, N,
                E, N, D, N, D, N, C, N, D, N, G, N,
                E, N, E, N, E, N, 
                E, N, E, N, E, N, 
                E, N, G, N, C, N, D, N, E, N,
                F, N, F, N, F, N, F, N,
                F, N, E, N, E, N, E, N,
                G, N, G, N, F, N, D, N, C, N};
int tempo[98] = {2, 1, 2, 1, 4, 1,
                2, 1, 2, 1, 4, 1,
                2, 1, 2, 1, 2, 1, 2, 1, 4, 1,
                2, 1, 2, 1, 2, 1, 2, 1,
                2, 1, 2, 1, 2, 1, 2, 1,
                2, 1, 2, 1, 2, 1, 2, 1, 4, 1, 4, 1,
                2, 1, 2, 1, 4, 1,
                2, 1, 2, 1, 4, 1,
                2, 1, 2, 1, 2, 1, 2, 1, 4, 1,
                2, 1, 2, 1, 2, 1, 2, 1,
                2, 1, 2, 1, 2, 1, 2, 1,
                2, 1, 2, 1, 2, 1, 2, 1, 8, 1};
int count = 0;
int index=0;
void __interrupt() tc_int(void)
{
    if(PIR2bits.TMR3IF){
        PIR2bits.TMR3IF=0;
    }
    if(PIR1bits.TMR1IF){
        count++;
        CCPR1L++;
        if(count==tempo[index]){
            count=0;
            index++;
            PR2 = 62500/tone[index] -1;
            
        }
        if(index == 97)
            index = 0;
        TMR1 = 62410;
        PIR1bits.TMR1IF =0;
    }
}

void main(void) {
    OSCCONbits.IRCF = 4;
    INTCONbits.GIE =1;
    RCONbits.IPEN= 1;
    CCPR1L=0;
    
    TRISCbits.RC2 = 0;
    T2CONbits.TMR2ON = 1;
    T2CONbits.T2CKPS = 1;
    CCP1CONbits.CCP1M = 12;
    
    PIE1bits.TMR1IE =1;
    PIR1bits.TMR1IF =0;
    IPR1bits.TMR1IP =1;
    T1CONbits.RD16 = 1;
    T1CONbits.TMR1ON = 1; //open it
    T1CONbits.T1CKPS = 3; //prescaler 1L16
    T1CONbits.TMR1CS = 0;
    TMR1 = 62410; //0.2xec
    
    T3CONbits.TMR3ON=1;
    T3CONbits.RD16=1;
    T3CONbits.T3CKPS=3;
    T3CONbits.TMR3CS=0;
    PIE2bits.TMR3IE=1;
    PIR2bits.TMR3IF=0;
    IPR2bits.TMR3IP=1;
    TMR3=61629; //0.25sec
    
    while(1);
}
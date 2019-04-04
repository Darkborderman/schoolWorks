#include <xc.h>

void INTERRUPT_Initialize (void)
{
    //global interrupt
    RCONbits.IPEN = 1;      //enable Interrupt Priority mode
    INTCONbits.GIEH = 1;    //enable high priority interrupt
    INTCONbits.GIEL = 1;     //disable low priority interrupt
    //Timer0 interrupt
    PIR1bits.TMR1IF=0;
    PIE1bits.TMR1IE=1;
    IPR1bits.TMR1IP=1;
    T1CONbits.RD16=1;
    T1CONbits.TMR1ON=1;
    T1CONbits.TMR1CS=0;
    T1CONbits.T1CKPS=2;
    //PORTB interrupt
    INTCONbits.RBIF=0;
    INTCONbits.RBIE=1;
    //INT0 interrupt
    INTCONbits.INT0IE=1;
    INTCONbits.INT0IF=0;
    INTCON2bits.INTEDG0=0;
    
}


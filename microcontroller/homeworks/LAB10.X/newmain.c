#include"config.h"
#include <xc.h>

void adc_init(void);
void ccp2_init(void);
void tmr_init(void);
int result[8]={0};
int index=0;

void __interrupt(high_priority) Hi_ISR(void)
{
    //deal ccp2 interrupt and adc interrupt
    if(PIR1bits.ADIF){//AD conversion finish
        
        result[index]=ADRES;
        index++;
        if(index==8){
            NOP();
            index=0;
        }
        PIR1bits.ADIF=0;
    }
    else if(PIR2bits.CCP2IF){ //special event triger
        TMR3=0;
        PIR2bits.CCP2IF=0;
    }
    return ;
}

void main(void) {
    //change OSC if you want
    //    OSCCONbits.IRCF = ??;
    adc_init();
    ccp2_init();
    tmr_init();
    while(1);
    return;
}

void adc_init(void){
    //datasheet p232 TABLE 19-2
    //Configure the A/D module
    //ADCON0
    
    //select analog channel
    ADCON0bits.CHS3=0;
    ADCON0bits.CHS2=1;
    ADCON0bits.CHS1=1;
    ADCON0bits.CHS0=1;
    
    //set TRIS
    TRISEbits.RE2=1;
    
    
    //Turn on A/D module
    ADCON0bits.ADON=1;
    //ADCON1 //set refer voltage
    ADCON1bits.VCFG=0;
    ADCON1bits.PCFG3=0;
    ADCON1bits.PCFG2=1;
    ADCON1bits.PCFG1=1;
    ADCON1bits.PCFG0=1;
    
    //ADCON2
    //A/D Conversion Clock
    ADCON2bits.ADCS=4;
    
    //Acquisition Time
    ADCON2bits.ACQT=1;
    
    //left or right justified
    ADCON2bits.ADFM=1;
    //Configure A/D interrupt(optional)
    //enable Interrupt Priority mode
    RCONbits.IPEN= 1;
    INTCONbits.GIE =1;

}

void ccp2_init(void){

    //Configure CCP2 mode,ref datasheet p139
    OSCCONbits.IRCF = 4;
    CCP2CONbits.CCP2M0 = 1;
    CCP2CONbits.CCP2M1=1;
    CCP2CONbits.CCP2M2 = 0;
    CCP2CONbits.CCP2M3=1;
    //configure CCP2 interrupt
    PIR2bits.CCP2IF=0;
    PIE2bits.CCP2IE=1;
    IPR2bits.CCP2IP=1;
   
    //configure CCP2 comparator value
    
    CCPR2=31250;
}

void tmr_init(void){

    PIR2bits.TMR3IF=0;
    PIE2bits.TMR3IE=1;
    IPR2bits.TMR3IP=1;

    T3CONbits.T3CCP2=0;
    T3CONbits.T3CCP1=1;
    T3CONbits.T3CKPS=0;
    T3CONbits.TMR3CS=0;
    T3CONbits.TMR3ON=1;
    
    //set up timer3, ref datasheet p135
    //no need to turn up timer3 interrupt
}
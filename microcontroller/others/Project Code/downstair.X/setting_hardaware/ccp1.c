#include <xc.h>

void CCP1_Initialize() {
    TRISCbits.TRISC2=0;	// RC2 pin is output.
    CCP1CON=9;		// Compare mode, initialize CCP1 pin high, clear output on compare match
    PIR1bits.CCP1IF=0;
    IPR1bits.CCP1IP = 1;
}

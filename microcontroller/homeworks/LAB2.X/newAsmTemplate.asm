LIST p=18f4520
#include<p18f4520.inc>
CONFIG OSC=INTIO67
CONFIG WDT=OFF

org 0x00

Initial:
    clrf WREG
    clrf TRISC
    clrf TRISD 
    clrf TRISE
    
    

    LFSR FSR0,110H
    LFSR FSR1,130H
    LFSR FSR2,150H

    movlw 0x07
    addwf TRISD ;7-0
    movlw 0x01
    addwf TRISE
    clrf WREG

    incf TRISC ;1-7

loop:

    movff TRISC,INDF0
    movff TRISD,INDF1

    addwf POSTINC0,0
    addwf POSTINC1,0

    movff WREG,POSTINC2
    clrf WREG

    incf TRISC
    decfsz TRISD
    goto loop
end
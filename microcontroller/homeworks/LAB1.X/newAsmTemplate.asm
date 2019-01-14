LIST p=18f4520
#include<p18f4520.inc>
CONFIG OSC=INTIO67
CONFIG WDT=OFF
org 0x58

clrf WREG
movlw 0x04
    
nop
nop
addlw 0x04
    
org 0x44
    
Initial:

    
    
start:
clrf WREG
clrf TRISD

addwf TRISD

loop:
    decfsz TRISD
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    nop
    goto loop

    
addlw 0x06

end
LIST p=18f4520
#include<p18f4520.inc>
CONFIG OSC=INTIO67
CONFIG WDT=OFF

org 0x00

;NAND
clrf LATA
clrf LATB
clrf LATC
clrf LATD
clrf WREG
movlw 0xB5
andlw 0x7C
xorlw 0xFF
addwf LATD,1

;NOR
movlw 0x96
iorlw 0x69
xorlw 0xFF
addwf LATC,1

Initial:
    clrf WREG
    clrf LATA
	LAB3:
	incf WREG
	addwf LATA,1
	bov Rotate
	bra LAB3
    nop
    goto Initial
    
Rotate:
    clrf WREG
    movlw 0x8F
    movwf LATB,0
    rlcf LATB,1,0
    nop

end
#include "p18f4520.inc"
CONFIG  OSC = INTIO67
CONFIG  WDT = OFF
CONFIG  LVP = OFF
  

org 0x00
goto INIT

;Delay d'200' d'180' delay 1sec
;calculate:
;decfsz ==true cost 2 cycle(skip bra as nop)
;decfsz ==false cost 1 cycle
;bra cost 2 cycle
;2+(2+7*199+9)*179+(2+7*199+8)=252721
;2 is inst. after local LOOP2
;(2+7*199+9)
;2 to assign value
;7*199 loop
;9 is 200th loop
;(2+7*199+8) is 180th loop
 
;it can also abbrivated as
;2+(2+7*200+2)*180-1=252721
;Note that 252721 is inst. cycle
;our clock is 1M machine cycle=250K inst. cycle

L1 EQU 0x14
L2 EQU 0x15
Delay MACRO num1,num2
    local LOOP1
    local LOOP2
    movlw num2
    movwf L2
    LOOP2:
	movlw num1
	movwf L1
	LOOP1:
	    NOP
	    NOP
	    NOP
	    NOP
	    DECFSZ L1,1
	    GOTO LOOP1
    DECFSZ L2,1
    GOTO LOOP2
ENDM

ISR:
    org 0x08
    clrf LATD
    bsf PORTD,0,0
    Delay d'200', d'180'
    bcf PORTD,0,0
    bsf PORTD,1,0
    Delay d'200', d'180'
    bcf PORTD,1,0
    bsf PORTD,2,0
    Delay d'200', d'180'
    bcf PORTD,2,0
    bsf PORTD,3,0
    Delay d'200', d'180'
    bcf PORTD,3,0
    
    bcf INTCON,INT0IF
    
    retfie
INIT:
    clrf PORTB
    clrf LATB
    clrf TRISB
    bsf TRISB,0
    
    movlw 0x0f
    movwf ADCON1

    clrf TRISD
    clrf PORTD
    clrf LATD
    
    bsf INTCON, INT0IE
    bcf INTCON, INT0IF
    bsf INTCON, GIE
    bcf INTCON2,INTEDG0
Main:
    NOP
    bra Main

end
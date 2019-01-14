LIST p=18f4520
#include<p18f4520.inc>
CONFIG OSC = INTIO67
CONFIG WDT = OFF
    
   ORG 0X00

L1 EQU 0x14
L2 EQU 0x15
DELAY MACRO num1,num2
 local LOOP1
 local LOOP2
 MOVLW d'200'
 MOVWF L2
 LOOP2:
    MOVLW d'200'
    MOVWF L1
    LOOP1:
	NOP
	NOP
	DECFSZ L1,1
	BRA LOOP1
    DECFSZ L2,1
    BRA LOOP2
 ENDM

INIT:
    CLRF LATA
    movlw  0xff
    movff WREG,TRISA
    CLRF LATD
    CLRF TRISD
    CLRF WREG

detect MACRO 
	clrf LATD
    clrf WREG
    btfsc PORTA,4    
    bsf WREG,0
    
    btfsc WREG,0
    goto S1
    
endm

change MACRO
DELAY d'200',d'90'
	rlcf LATD,1;
	
	btfss PORTA,4    
	bsf WREG,0
    
	btfsc WREG,0
	goto S1
    
endm
S1: 
	detect
    
    LIGHT:

	detect
	
	change
	
	change
	
	change
	
	change
	
	change
	
	change

	DELAY d'200',d'180'
	rlcf LATD,1;

	goto LIGHT

    END
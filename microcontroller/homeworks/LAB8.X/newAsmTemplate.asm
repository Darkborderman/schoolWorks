#include "p18f4520.inc"
CONFIG  OSC = INTIO67
CONFIG  WDT = OFF
CONFIG  LVP = OFF
  
org 0x00
    bra INIT
    
org 0x08
    bra ISR

ISR:

    bcf PIR1,TMR2IF
    movlw 0x00
    movwf TMR2
    
    incf LATD
    
    retfie
    
INIT:
    
    call INIT_IO
    call INIT_Timer1
    
    bsf RCON,IPEN
    bsf INTCON,GIEH
    
Main:
    nop
    goto Main
    
INIT_IO:
    clrf TRISD
    clrf PORTD
    
    return
    
INIT_Timer2:
    movlw b'11111111'
    movwf T2CON
    movlw 0x0A
    movwf TMR2
    
    bsf IPR1,TMR2IP
    bsf PIR1,TMR2IF
    bsf PIE1,TMR2IE
    return
    
end
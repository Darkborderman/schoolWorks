#include "p18f4520.inc"
CONFIG  OSC = INTIO67
CONFIG  WDT = OFF
CONFIG  LVP = OFF
  
org 0x00
    bra INIT
        
HERE:

    ;incf CCPR1L
    movlw b'00010000'
    movwf CCPR1L
    bcf CCP1CON,4
    bsf CCP1CON,5
    
    return
    
INIT:
    
    call INIT_IO
    call INIT_Timer2
    
Main:
    nop
    btfsc PORTD,5
    call HERE
    goto Main
    
INIT_IO:
    
    bsf OSCCON,4
    bcf OSCCON,5
    bcf OSCCON,6
    movwf OSCCON
    
    movlw 0xFF
    movwf TRISD
    
    movlw 0x01
    movwf CCPR1L
    bcf CCP1CON,4
    bcf CCP1CON,5
    clrf TRISC
    clrf PORTC
    clrf LATC
    
    return
    
INIT_Timer2:
    
    movlw b'10000101'
    movwf T2CON
    movlw b'10011011'
    movwf PR2
    
    bcf PIR1,TMR2IF
    
    bsf CCP1CON,3
    bsf CCP1CON,2
    bcf CCP1CON,1
    bcf CCP1CON,0
    ;duty cycle
    bcf CCP1CON,4
    bcf CCP1CON,5
    
    bsf RCON,IPEN
    bsf INTCON,GIEH
    
    bsf IPR1,TMR2IP
    bsf PIR1,TMR2IF
    bsf PIE1,TMR2IE
    return    
    
end
LIST p=18f4520
    #include<p18f4520.inc>
    CONFIG OSC=INTIO67
    CONFIG WDT=OFF
    
    org 0x00
Initial:
    MOVLF macro lit,loca
	movlw lit
        addwf loca,1,0
    endm

    clrf TRISA
    clrf TRISB
    clrf TRISC
    
    clrf TRISE ;ctr
    movlw 0x10
    addwf TRISE,1,0
    clrf WREG
    movlw 0x01
    addwf TRISA,1,0
    movlw 0x02
    addwf TRISB,1,0
    
    rcall Fib
    
    nop
    nop

    rcall finish
    
Fib:
    clrf WREG
    clrf TRISC
    clrf TRISD
    addwf TRISA,0,0
    addwf TRISC
    clrf WREG
    addwf TRISB,0,0
    addwf TRISD
    
    addwf TRISA,0,0
    movwf TRISB
    clrf WREG
    addwf TRISD,0,0
    movwf TRISA
    
    movlw 0x20
    decfsz TRISE
    subwf PCL,1,0
    CLRF WREG
    
    return
    
finish:
    
    end
LIST p=18f4520
    #include<p18f4520.inc>
    CONFIG OSC=INTIO67
    CONFIG WDT=OFF
    
    org 0x00
    
    lab4_1:
	clrf WREG
	MOVLF macro lita,f
	endm
    lab4_2:
	clrf WREG
    LFSR FSR0, 100H
        
    movlw 0x06
    addwf 0x140,1,0
    movlw 0x05
    addwf 0x116,1,0
    movlw 0x04
    addwf 0x154,1,0
    rcall mclear
    nop
    rcall finish
    
    mclear:
    LFSR FSR1, 200H
    
    clrf WREG
    addwf 0x140,0,0
    addwf 0x222,1,0
    clrf WREG
    addwf 0x116,0,0
    addwf 0x223,1,0
    clrf WREG
    addwf 0x154,0,0
    addwf 0x224,1,0
    mulwf 0x140 ;store at PRODL
    movff PRODL,WREG
    mulwf 0x116
    
    clrf 0x140
    clrf 0x116
    clrf 0x154
    clrf WREG
    return
    
    finish:
     
    addwf 0x222,0,0
    addwf 0x140,1,0
    clrf WREG
    addwf 0x223,0,0
    addwf 0x116,1,0
    clrf WREG
    addwf 0x224,0,0
    addwf 0x154,1,0
    
    nop    
end


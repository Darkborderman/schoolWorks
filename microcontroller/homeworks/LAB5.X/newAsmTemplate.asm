#include "xc.inc"
GLOBAL _mult

PSECT mytext, local, class=CODE, reloc=2

_mult:
    
    clrf PROD
    clrf PRODH
    clrf PRODL
    clrf TRISC
    MOVFF 0x03,TRISB
    MOVFF 0x01,WREG
    
    ;;mult
    MOVFF WREG, TRISA
    MOVFF TRISC,WREG
    btfsc TRISB,0
    addwf PRODH
    MOVFF TRISA,WREG
    
    btfsc TRISB,0
    addwf PRODL
    rlncf TRISC
    btfsc WREG,7
    incf TRISC
    rlncf WREG
    bcf WREG,0
    btfsc STATUS, 4
    incf PRODH
    
    MOVFF WREG, TRISA
    MOVFF TRISC,WREG
    btfsc TRISB,1
    addwf PRODH
    MOVFF TRISA,WREG
    
    rlncf TRISC
    btfsc TRISB,1
    addwf PRODL
    btfsc WREG,7
    incf TRISC
    rlncf WREG
    bcf WREG,0
    btfsc STATUS, 4
    incf PRODH
    
    MOVFF WREG, TRISA
    MOVFF TRISC,WREG
    btfsc TRISB,2
    addwf PRODH
    MOVFF TRISA,WREG
    
    rlncf TRISC
    btfsc TRISB,2
    addwf PRODL
    btfsc WREG,7
    incf TRISC
    rlncf WREG
    bcf WREG,0
    btfsc STATUS, 4
    incf PRODH
    
    MOVFF WREG, TRISA
    MOVFF TRISC,WREG
    btfsc TRISB,3
    addwf PRODH
    MOVFF TRISA,WREG
    
    rlncf TRISC
    btfsc TRISB,3
    addwf PRODL
    btfsc WREG,7
    incf TRISC
    rlncf WREG
    bcf WREG,0
    btfsc STATUS, 4
    incf PRODH
    
    MOVFF WREG, TRISA
    MOVFF TRISC,WREG
    btfsc TRISB,4
    addwf PRODH
    MOVFF TRISA,WREG
    
    rlncf TRISC
    btfsc TRISB,4
    addwf PRODL
    btfsc WREG,7
    incf TRISC
    rlncf WREG
    bcf WREG,0
    btfsc STATUS, 4
    incf PRODH
    
    MOVFF WREG, TRISA
    MOVFF TRISC,WREG
    btfsc TRISB,5
    addwf PRODH
    MOVFF TRISA,WREG
    
    rlncf TRISC
    btfsc TRISB,5
    addwf PRODL
    btfsc WREG,7
    incf TRISC
    rlncf WREG
    bcf WREG,0
    btfsc STATUS, 4
    incf PRODH
    
    MOVFF WREG, TRISA
    MOVFF TRISC,WREG
    btfsc TRISB,6
    addwf PRODH
    MOVFF TRISA,WREG
    
    rlncf TRISC
    btfsc TRISB,6
    addwf PRODL
    btfsc WREG,7
    incf TRISC
    rlncf WREG
    bcf WREG,0
    btfsc STATUS, 4
    incf PRODH

    MOVFF WREG, TRISA
    MOVFF TRISC,WREG
    btfsc TRISB,7
    addwf PRODH
    MOVFF TRISA,WREG
    
    rlncf TRISC
    btfsc TRISB,7
    addwf PRODL
    btfsc WREG,7
    incf TRISC
    rlncf WREG
    bcf WREG,0
    btfsc STATUS, 4
    incf PRODH

    MOVFF PRODH,0x02
    MOVFF PRODL,0x01
    
    RETURN

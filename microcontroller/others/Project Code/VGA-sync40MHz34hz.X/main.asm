    LIST p=18f4520
#include <p18f4520.inc>
       
    CONFIG  OSC = HS         ; Oscillator Selection bits (Internal oscillator block, port function on RA6 and RA7)
    CONFIG  PWRT = OFF            ; Power-up Timer Enable bit (PWRT disabled)
    CONFIG  WDT = OFF             ; Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
    CONFIG  LVP = OFF             ; Single-Supply ICSP Enable bit (Single-Supply ICSP disabled)
    CONFIG  PBADEN = OFF          ; PORTB A/D Enable bit (PORTB<4:0> pins are configured as digital I/O on Reset)

    
PIN_SYNC_REG equ LATB
PIN_SYNC_TRIS equ TRISB
 
PIN_HSYNC_BIT equ 0
PIN_VSYNC_BIT equ 1

PIN_SIG_REG equ LATD
PIN_SIG_TRIS equ TRISD

PIN_RED_BIT equ 0
PIN_GREEN_BIT equ 1
PIN_BLUE_BIT equ 2

ARRAY_SIZE equ 6

ENUM_TYPE equ 0xff
ENUM_X equ 0xfe
ENUM_Y equ 0xfd
ENUM_LIMIT equ 0xf0
 
DATA_TYPE equ 0xf0
DATA_X equ 0xe0
DATA_Y equ 0xd0

ptr_recv equ 0x40
immedI equ 0x41
immedJ equ 0x42
immedK equ 0x43
space1 equ 0x44
print1 equ 0x45
space2 equ 0x46
print2 equ 0x47
space3 equ 0x48
line_count equ 0x49
ten equ 0x50
 
delay MACRO time;//3*time
    local lloop1
    movlw time
lloop1:
    decfsz WREG
    bra lloop1
 ENDM

delayf MACRO reg;//3+3*time
    local lloop2
    incf reg
lloop2:
    decfsz reg
    bra lloop2
 ENDM

init_compare MACRO
    clrf print1;1
    clrf space1;2
    clrf print2;3
    clrf space2;4
    clrf space3;5
    movlw ARRAY_SIZE;6
    movwf immedJ;7
    lfsr 0,DATA_TYPE;8~9
    lfsr 1,DATA_X;10~11
    lfsr 2,DATA_Y;12~13
 ENDM
 
compare MACRO
    local lloop3
    local lelse1
    local lendif1
    local lelse2
    local lendif2
lloop3:
    movf line_count,0;1
    subwf POSTINC2,0;2
    cpfsgt ten;3
	bra lelse1;4~5
    movf POSTINC0,0;5
    mullw 0x14;6
    addlw 0x0a;7
    tstfsz print1;8
	bra lelse2;9~10
    movwf print1;10
    movff POSTINC1,space1;11~12
    delay d'1';13~15
    bra lendif2;16~17
lelse2:
    movwf print2;11
    movff POSTINC1,space2;12~13
    movf space1,0;14
    addwf print1,0;15
    cpfslt space2;16
	subwf space2;17
lendif2:
    bra lendif1;18~19
lelse1:
    nop;6
    delay d'4';7~18
    nop;19
lendif1:
    decfsz immedJ;20;42;64;86;108;130
    bra lloop3;21~22
    movf space1,0;132
    addwf print1,0;133
    addwf space2,0;134
    addwf print2,0;135
    sublw d'113';136
    movwf space3;137
 ENDM
 
 org 0x00
    goto Initial
 org 0x08
    
lo_isr:
 org 0x18
    btfsc PIR1,RCIF;1
        bra UART;2~3
    retfie
UART:
    btfss RCSTA,OERR;4
        bra UART_wait;5~6
    bcf RCSTA,4;6
    nop;7
    nop;8
    bsf RCSTA,4;9
    bra UART_read;10~11
UART_wait:
    delay d'2';7~11
UART_read:
    movlw ENUM_LIMIT;12
    cpfslt RCREG;13
	bra UART_datatype;14~15
    movf RCREG,0;16
    lfsr 0,ptr_recv;17~18
    movf INDF0;19
    incf ptr_recv;20
    retfie
UART_datatype:
    subwf RCREG,0;16
    mullw 0x10;17
    movwf ptr_recv;19
    nop;20
    retfie
    
Initial:
    ;//bsf OSCTUNE,6
    bsf OSCCON, IRCF1
    bsf OSCCON, IRCF2
    bsf OSCCON, IRCF0
    
    bsf T3CON, RD16
    bcf T3CON, T3CCP2
    bsf T3CON, T3CCP1
    bcf T3CON, T3CKPS1
    bcf T3CON, T3CKPS0
    bcf T3CON, TMR3ON ; disabled
    
    bsf PIE2, TMR3IE
    bcf PIR2, TMR3IF
    bsf IPR2, TMR3IP
    bsf RCON,IPEN
    bsf INTCON, GIE
    bsf INTCON, PEIE
    
    ;UART
    bsf TRISC,6
    bsf TRISC,7
    bcf TXSTA,SYNC
    bsf BAUDCON,BRG16
    bsf TXSTA,BRGH
    
    movlw 0x00
    movwf SPBRGH
    movlw 0x13
    movwf SPBRG
    
    ;Serial enable
    bsf RCSTA,SPEN
    bsf PIR1,TXIF
    bcf PIR1,RCIF
    bsf TXSTA,TXEN
    bsf RCSTA,CREN
    
    bcf PIE1,TXIE
    bcf IPR1,TXIP
    bsf PIE1,RCIE
    bcf IPR1,RCIP
    
    
    bcf PIN_SYNC_TRIS, PIN_HSYNC_BIT
    bcf PIN_SYNC_TRIS, PIN_VSYNC_BIT
    bsf PIN_SYNC_REG, PIN_HSYNC_BIT
    bsf PIN_SYNC_REG, PIN_VSYNC_BIT
    
    movlw d'10'
    lfsr 0,DATA_TYPE;8~9
    lfsr 1,DATA_X;10~11
    lfsr 2,DATA_Y;12~13
clear_loop:
    clrf POSTINC0
    clrf POSTINC1
    clrf POSTINC2
    decfsz WREG
	bra clear_loop
    
    clrf    PIN_SIG_TRIS
    clrf    PIN_SIG_REG
    movlw 0x0A
    movwf ten
all:
    clrf    PIN_SYNC_REG;1
    delay   d'22';
    bsf PIN_SYNC_REG, PIN_HSYNC_BIT;49
    delay   d'166';50~400
    movlw   d'2';401
    
    movwf   LATB;1
    movlw   d'174';2
    movwf   immedI;3
    nop
    delay   d'21';4~48
    bsf PIN_SYNC_REG, PIN_HSYNC_BIT;49
    delay   d'166';50~400
    movlw   d'2';401
    
loop1:   
    bcf PIN_SYNC_REG, PIN_HSYNC_BIT;1
    init_compare;2~14
    incf line_count;15
    nop
    delay   d'17';16~48
    bsf PIN_SYNC_REG, PIN_HSYNC_BIT;49
    compare;50~186
    delayf space1;
    bsf PIN_SIG_REG,PIN_RED_BIT;186
    delayf print1;
    bcf PIN_SIG_REG,PIN_RED_BIT;187
    delayf space2;
    bsf PIN_SIG_REG,PIN_RED_BIT;188
    delayf print2;
    bcf PIN_SIG_REG,PIN_RED_BIT;189
    delayf space3;
    nop
    delay d'1';399~401
    
    bcf PIN_SYNC_REG, PIN_HSYNC_BIT;1
    init_compare;2~14
    incf line_count;15
    nop
    delay   d'17';16~48
    bsf PIN_SYNC_REG, PIN_HSYNC_BIT;49
    compare;50~185
    delayf space1;
    bsf PIN_SIG_REG,PIN_RED_BIT;186
    delayf print1;
    bcf PIN_SIG_REG,PIN_RED_BIT;187
    delayf space2;
    bsf PIN_SIG_REG,PIN_RED_BIT;188
    delayf print2;
    bcf PIN_SIG_REG,PIN_RED_BIT;189
    delayf space3;
    nop
    delay d'1';399~401
    
    bcf PIN_SYNC_REG, PIN_HSYNC_BIT;1
    init_compare;2~14
    incf line_count;15
    nop
    delay   d'17';16~48
    bsf PIN_SYNC_REG, PIN_HSYNC_BIT;49
    compare;50~185
    delayf space1;
    bsf PIN_SIG_REG,PIN_RED_BIT;186
    delayf print1;
    bcf PIN_SIG_REG,PIN_RED_BIT;187
    delayf space2;
    bsf PIN_SIG_REG,PIN_RED_BIT;188
    delayf print2;
    bcf PIN_SIG_REG,PIN_RED_BIT;189
    delayf space3;
    nop
    decfsz  immedI;399
    bra	loop1;400~401
    
    clrf    PIN_SYNC_REG;1
    delay   d'21';2~46
    clrf line_count;47
    nop;48
    nop
    bsf PIN_SYNC_REG, PIN_HSYNC_BIT;49
    delay   d'165';50~400
    ;may interrupt here
    nop
    nop
    bra all;401
    
    end



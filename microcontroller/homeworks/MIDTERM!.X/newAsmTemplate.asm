LIST p=18f4520
#include<p18f4520.inc>

; CONFIG1H
  CONFIG  OSC = INTIO67         ; Oscillator Selection bits (Internal oscillator block, port function on RA6 and RA7)
  CONFIG  FCMEN = OFF           ; Fail-Safe Clock Monitor Enable bit (Fail-Safe Clock Monitor disabled)
  CONFIG  IESO = OFF            ; Internal/External Oscillator Switchover bit (Oscillator Switchover mode disabled)

; CONFIG2L
  CONFIG  PWRT = OFF            ; Power-up Timer Enable bit (PWRT disabled)
  CONFIG  BOREN = SBORDIS       ; Brown-out Reset Enable bits (Brown-out Reset enabled in hardware only (SBOREN is disabled))
  CONFIG  BORV = 3              ; Brown Out Reset Voltage bits (Minimum setting)

; CONFIG2H
  CONFIG  WDT = OFF             ; Watchdog Timer Enable bit (WDT disabled (control is placed on the SWDTEN bit))
  CONFIG  WDTPS = 32768         ; Watchdog Timer Postscale Select bits (1:32768)

; CONFIG3H
  CONFIG  CCP2MX = PORTC        ; CCP2 MUX bit (CCP2 input/output is multiplexed with RC1)
  CONFIG  PBADEN = OFF          ; PORTB A/D Enable bit (PORTB<4:0> pins are configured as digital I/O on Reset)
  CONFIG  LPT1OSC = OFF         ; Low-Power Timer1 Oscillator Enable bit (Timer1 configured for higher power operation)
  CONFIG  MCLRE = ON            ; MCLR Pin Enable bit (MCLR pin enabled; RE3 input pin disabled)

; CONFIG4L
  CONFIG  STVREN = ON           ; Stack Full/Underflow Reset Enable bit (Stack full/underflow will cause Reset)
  CONFIG  LVP = OFF             ; Single-Supply ICSP Enable bit (Single-Supply ICSP disabled)
  CONFIG  XINST = OFF           ; Extended Instruction Set Enable bit (Instruction set extension and Indexed Addressing mode disabled (Legacy mode))

; CONFIG5L
  CONFIG  CP0 = OFF             ; Code Protection bit (Block 0 (000800-001FFFh) not code-protected)
  CONFIG  CP1 = OFF             ; Code Protection bit (Block 1 (002000-003FFFh) not code-protected)
  CONFIG  CP2 = OFF             ; Code Protection bit (Block 2 (004000-005FFFh) not code-protected)
  CONFIG  CP3 = OFF             ; Code Protection bit (Block 3 (006000-007FFFh) not code-protected)

; CONFIG5H
  CONFIG  CPB = OFF             ; Boot Block Code Protection bit (Boot block (000000-0007FFh) not code-protected)
  CONFIG  CPD = OFF             ; Data EEPROM Code Protection bit (Data EEPROM not code-protected)

; CONFIG6L
  CONFIG  WRT0 = OFF            ; Write Protection bit (Block 0 (000800-001FFFh) not write-protected)
  CONFIG  WRT1 = OFF            ; Write Protection bit (Block 1 (002000-003FFFh) not write-protected)
  CONFIG  WRT2 = OFF            ; Write Protection bit (Block 2 (004000-005FFFh) not write-protected)
  CONFIG  WRT3 = OFF            ; Write Protection bit (Block 3 (006000-007FFFh) not write-protected)

; CONFIG6H
  CONFIG  WRTC = OFF            ; Configuration Register Write Protection bit (Configuration registers (300000-3000FFh) not write-protected)
  CONFIG  WRTB = OFF            ; Boot Block Write Protection bit (Boot block (000000-0007FFh) not write-protected)
  CONFIG  WRTD = OFF            ; Data EEPROM Write Protection bit (Data EEPROM not write-protected)

; CONFIG7L
  CONFIG  EBTR0 = OFF           ; Table Read Protection bit (Block 0 (000800-001FFFh) not protected from table reads executed in other blocks)
  CONFIG  EBTR1 = OFF           ; Table Read Protection bit (Block 1 (002000-003FFFh) not protected from table reads executed in other blocks)
  CONFIG  EBTR2 = OFF           ; Table Read Protection bit (Block 2 (004000-005FFFh) not protected from table reads executed in other blocks)
  CONFIG  EBTR3 = OFF           ; Table Read Protection bit (Block 3 (006000-007FFFh) not protected from table reads executed in other blocks)

; CONFIG7H
  CONFIG  EBTRB = OFF           ; Boot Block Table Read Protection bit (Boot block (000000-0007FFh) not protected from table reads executed in other blocks)


; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; Setting file register address.
COUNT EQU 0X100	    
DIVISORH EQU 0X110   
DIVISORL EQU 0X111
REMAINDERH EQU 0X120
REMAINDERL EQU 0X121
QUOTIENT EQU 0x0130 ; 

#define Button1Flag 0X160, 0 ; You can use it or not.
#define Button2Flag 0X170, 0 ; You can use it or not.
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; 
; Teacher assistent will provide input data.
Input1H EQU 0x0F 
Input1L EQU 0x7C 
Input2  EQU 0x6F ; 0xF7C/0x6F = 0x23 ... 0x4F
; ;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
  
  
ORG 0X00  
bra Init
ORG 0X08 ; setting interrupt service routine 
bra isr	
	
rrcf4time macro origf, destf ; rotate your orginal register to destination for 4 times
			     ; Clear your destination first.
endm

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
;our clock is 4M machine cycle=1M inst. cycle


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

	
Init:	bsf OSCCON, IRCF2 ; Internal Oscillator Frequency is set 4Mhz
	bsf OSCCON, IRCF1 ; Don't remove 3 lines !!!
	bcf OSCCON, IRCF0 

	
Divide MACRO dividedH,dividedL,divisor  ; divde 
    clrf LATA ;use as counter
    local countQuo
    local countRemain
    clrf WREG
    movlw dividedL
    countQuo:
    subwf divisor
    incf LATA
    btfsc STATUS,4
    decf dividedH
    btfsc STATUS,4
    goto countRemain
    
    goto countQuo
    
    countRemain:
    decf LATA
        
    nop
    nop
    
endm
    
    ; You can write macro of divide, or not.
	; Input1 is Dividend, Input2 is Division. 
	; For example, 0xFFC / 0x11h =  0xFF0...0xC.
	; 0xFFC: Dividend (0xF: DividendH, 0xFC: DividendL). 
	; 0X11: Division.  0XFF0: Quotient. 0xc: Remainder
	; You must push result values to QUOTIENT(0X130), REMAINDERL(0x121) before you shift values.
Transfer:  
	; rotate register	
	; transfer values to specified file registers.
	; you can design a better method you think.
	
	
mainLoop: 
    clrf TRISA
    clrf WREG
    clrf TRISD
    clrf PORTD
    clrf LATD
    
    bsf INTCON, INT0IE
    bcf INTCON, INT0IF
    bsf INTCON, GIE
    bcf INTCON2,INTEDG0
    bsf INTCON, INT1IE
    bcf INTCON, INT1IF
    bcf INTCON2,INTEDG1
    
    ;move value for quo
    LFSR FSR0,133H
    LFSR FSR1,134H
    
    movlw 0x84
    clrf TRISA
    addwf TRISA
    
    clrf WREG
    btfsc TRISA,0
    bsf WREG,0
    btfsc TRISA,1
    bsf WREG,1
    btfsc TRISA,2
    bsf WREG,2
    btfsc TRISA,3
    bsf WREG,3
    
    movwf INDF0
    ;movff WREG,0x133
    clrf WREG
    btfsc TRISA,4
    bsf WREG,0
    btfsc TRISA,5
    bsf WREG,1
    btfsc TRISA,6
    bsf WREG,2
    btfsc TRISA,7
    bsf WREG,3
   
    movwf INDF1
    ;movff WREG,0x134
    
    ;move value for remain
    LFSR FSR0,123H
    LFSR FSR1,124H

    movlw 0x84
    clrf TRISA
    addwf TRISA
    
    clrf WREG
    btfsc TRISA,0
    bsf WREG,0
    btfsc TRISA,1
    bsf WREG,1
    btfsc TRISA,2
    bsf WREG,2
    btfsc TRISA,3
    bsf WREG,3
    
    movwf INDF0
    ;movff WREG,0x123
    
    clrf WREG
    btfsc TRISA,4
    bsf WREG,0
    btfsc TRISA,5
    bsf WREG,1
    btfsc TRISA,6
    bsf WREG,2
    btfsc TRISA,7
    bsf WREG,3
   
    movwf INDF1
    ;movff WREG,0x124
    setf LATD
    
    bra mainLoop
    
q_blink: 	
    ; Designing Quotient_blink for Subroutine
    ; controll by INT0
    LFSR FSR0,133H
    LFSR FSR1,134H
    
    clrf LATD
    Delay d'200',d'180'
    Delay d'200',d'180'
    
    movf INDF0,0
    clrf LATD
    addwf LATD
    ;movff 0x133,LATD
    Delay d'200',d'180'
    Delay d'200',d'180'
    Delay d'200',d'180'
    Delay d'200',d'180'
    
    clrf LATD
    Delay d'200',d'180'
    Delay d'200',d'180'
    
    movf INDF1,0
    clrf LATD
    addwf LATD
    ;movff 0x134,LATD
    Delay d'200',d'180'
    Delay d'200',d'180'
    Delay d'200',d'180'
    Delay d'200',d'180'
    
    return 
r_blink: 	
    ; Designing Remainder_blink for Subroutine
    ; controll by INT1
    LFSR FSR0,123H
    LFSR FSR1,124H
    
    Delay d'200',d'180'
    Delay d'200',d'180'
    
    movf INDF0,0
    clrf LATD
    addwf LATD
    Delay d'200',d'180'
    Delay d'200',d'180'
    Delay d'200',d'180'
    Delay d'200',d'180'
    
    clrf LATD
    Delay d'200',d'180'
    Delay d'200',d'180'
    
    movf INDF1,0
    clrf LATD
    addwf LATD
    Delay d'200',d'180'
    Delay d'200',d'180'
    Delay d'200',d'180'
    Delay d'200',d'180'
    
    return	
isr:
    btfsc INTCON,INT0IF
    rcall q_blink
    bcf INTCON,INT0IF
    btfsc INTCON,INT1IF
    rcall r_blink
    bcf INTCON,INT1IF

    retfie
END
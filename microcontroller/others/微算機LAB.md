微算機LAB
===
## New Project
1. Family: Pic18 / Device: PIC18F4520
2. Tools: PICkit3
3. Compiler: mpasm
4. Encodeing: UTF-8
5. 記得路徑不能有中文!!!

---
## New Source File
- Choose AssemblyFile.asm

---
## Tips
1. Set Main Project, then build and run
2. Always "Clean and build"
3. Always set a "Breakpoint" to avoid infinite processing
4. SFRs is useful

---

## Instruction Set
- A word instruction is a 16-bits word

---

## 40-pin
![](https://i.imgur.com/wDl6LxU.png)


---
## Logical Instructions
- ADDWF REG, d, a
    - d: 0 for WREG(default), 1 for specific REG
    - a: 0 for Access Bank(default), 1 for BSR to select Bank 
- ANDLW
    - AND literal with W(with one operand)
    - EX. ANDLW 05fh
- ANDWF
    - AND W with f(with two operands)
    - EX. ANDWF REG, 0, 0
- IORLW
    - Inclusive OR literal with W(with one operand)
    - EX. IORLW 35h
- IORWF
    - Inclusive OR W with f(with two operands)
    - EX. IORWF RESULT, 0, 1
- XORLW
    - Exclusive OR literal with W(with one operand)
    - EX. XORLW 0AFh
- XORWF
    - Exclusive OR W with f(with two operands)
    - EX. XORWF REG, 1, 0
- BSF
    - Bit set f(with two operand) 
    - BSF FLAG_REG, 7, 1(0000 1010 -> 1000 1010)
- BTFSS
    - Bit test file, skip if set(with two operands)
    - BTFSS FLAG, 1, 0
     (FLAG<1> = 0 -> PC = address(FALSE), 
      FLAG<1> = 1 -> PC = address(TRUE))
- BCF
    - Bit clear f(with two operands) 
    - BCF FLAC_REG, 7, 0(1100 0111 -> 0100 0111)
- BTFSC
    - Bit test file, skip if clear
    - BTFSC FLAG, 1, 0
     (FLAG<1> = 0 -> PC = address(TRUE), 
      FLAG<1> = 1 -> PC = address(FALSE)) 
- RLCF
    - Rotate left f through Carry(with two operands)
    - RLCF REG, 0, 0
      (REG = 1110 0110 -> 1110 0110, 
       C = 0 -> 1, 
       W = 0000 0000 -> 1100 1100)
- RLNCF
    - Rotate left f No Carry(with two operands)
    - RLCF REG, 1, 0
      (REG = 1110 0110 -> 1100 1101)
- RRCF
    - Rotate right f through Carry(with two operands)
    - RLCF REG, 0, 0
      (REG = 1110 0110 -> 1110 0110, 
       C = 0 -> 0, 
       W = 0000 0000 -> 0111 0011)
- RRNCF
    - Rotate right f No Carry(with two operands)
    - RLCF REG, 0, 0
      (REG = 1110 0110 -> 1110 0110,
      W = 0000 0000 -> 1110 1011)
---
## Control Operations
- BC
    - Branch if Carry
    - BC 5
      (if Carry = 1, PC = address(HERE + 12),
       if Carry = 0, PC = address(HERE + 2))
- BN(Branch if Negative)
- BNC(Branch if Not Carry)
- BNN(Branch if Not Negative)
- BNOV(Branch if Not Overflow)
- BNZ(Branch if Not Zero)
- BOV(Branch if Overflow)
- BZ(Branch if Zero)
- GOTO
- NOP

---

## LAB 8 - Timer
![](https://i.imgur.com/oayxYxd.jpg)
![](https://i.imgur.com/xv33vbm.jpg)
![](https://i.imgur.com/jzFR6mq.jpg)
![](https://i.imgur.com/lOY89QH.jpg)
![](https://i.imgur.com/JeCJWI0.jpg)
![](https://i.imgur.com/aKncQfY.jpg)
![](https://i.imgur.com/PbEiY6Z.jpg)
![](https://i.imgur.com/aMHEceF.jpg)
![](https://i.imgur.com/8Xo0uo1.jpg)
![](https://i.imgur.com/tWfT8td.jpg)
![](https://i.imgur.com/4G9QZfq.jpg)


```
#pragma config OSC = INTIO67
#pragma config WDT = OFF
#pragma config PBADEN = OFF
#pragma config LVP =OFF
#include <xc.h>
void LED0(void);
void LED1(void);
void LED2(void);
void LED3(void);
void turnoff(void);
volatile int count = 0;
void main(void) {
    TRISD =0;
    LATD =0;
    T2CON = 0x7f;
    RCONbits.IPEN= 1;
    PIE1bits.TMR2IE =1;
    PIR1bits.TMR2IF =0;
    IPR1bits.TMR2IP =1;
    INTCONbits.GIE =1;
    PR2 = 0xf3;
    while(1);
    return;
}

void __interrupt() tc_int(void)
{
    if(TMR2IE && TMR2IF){
        count++;
    }
    if(count == 8){ // 2 sec
        LED0();
    }
    if(count == 16){
        LED1();
    }
    if(count == 24){
        LED2();
    }
    if(count == 32){
        LED3();
    }
    if(count == 40){
        turnoff();
    }
    if(count == 44){
        count = 7;
    }
    TMR2 = 0x00;
    PIR1bits.TMR2IF =0;
}
void LED0(void){
    LATDbits.LATD0 =1;
}
void LED1(void){
    LATDbits.LATD1 =1;   
}
void LED2(void){
    LATDbits.LATD2 =1;
}
void LED3(void){
    LATDbits.LATD3 =1;
}
void turnoff(void){
    LATD = 0;
}
```


---
## LAB 9 - CCP

### CCP
- PIC18F4520有兩個CCP，分別為16-bit
- 分別有CCPxCON當作control reg, CCPRx當作data reg
- Data reg有CCPRxL(8bit) & CCPRxH(8bit)
- 40pin中的CCP1當作Enhanced CCP



### CCP1CON
![](https://i.imgur.com/SYpfeaW.png)
![](https://i.imgur.com/fY2emHN.png)


### Timer
- Timer1 & Timer3可以運作Capture或者Compare
- Timer2 可以用來給PWM用


### T3CON
- bit 6, 3(T3CCP)用來設定Timer3 & Timer1要用哪個mode
![](https://i.imgur.com/N9NklRU.png)

### Capture & Compare
- 利用CCPxM3~CCPxM0來設定 (CCPxCON<3:0>)
- 當Capture或Compare發生時，若此時的CCPxIE開啟，會立起CCPxIF
- 此時Timer必須run在Timer mode/Synchronized Counter mode, 若為Asynchronized Counter mode則不會運作
- 利用T3CON來設定Timer

- Capture: 須設定成input
![](https://i.imgur.com/yRAXvuF.png)
![](https://i.imgur.com/XWJIBEr.png)
利用CCP1當作input(例如說button)，然後當按鈕按下立起flag，把TMR1/3中的值放入CCPR1中
- Compare: 須設定成output
![](https://i.imgur.com/Acfs99F.png)
![](https://i.imgur.com/BX0L6ic.png)
設定好CCPR1/2跟TMR1/3比較，相同時立起flag

### PWM
![](https://i.imgur.com/YT881sU.png)
![](https://i.imgur.com/vZWOEC0.png)
- duty cycle越小，燈越暗


![](https://i.imgur.com/9yr34F2.png)
- 利用PR2來設定PWM period(間距比較大)

![](https://i.imgur.com/6ipX0sJ.png)
- 利用CCPRxL跟CCPxCON<5:4>來設定PWM duty cycle(間距比較小)

![](https://i.imgur.com/67B3Fcr.png)
1. 先設定好PR2, CCPR1L, CCP1CON<5:4>, 並把CCP1當作output
2. 設定T2CON跟reset TMR2
3. 當TMR2 = PR2, 把電位設為高，reset TMR2，並把CCPR1L放入CCPR1H
4. 當TMR2 = CCPR1H, 把電位設為Low, 回去3

### 步進馬達(SG90)
![](https://i.imgur.com/84LgzS9.png)
![](https://i.imgur.com/i3Kwj2I.png)
- -90度~90度，共180度

```
#pragma config OSC = INTIO67
#pragma config WDT = OFF
#pragma config PBADEN = OFF
#pragma config LVP =OFF
#include <xc.h>
volatile int init = 75;
void main(void) {
    TRISDbits.RD0 = 1;
    TRISCbits.RC2 = 0;
    T2CONbits.TMR2ON = 1;
    T2CONbits.T2CKPS = 3;
    OSCCONbits.IRCF = 3;
    CCP1CONbits.CCP1M = 12;
    PR2 = 155;
    CCP1CONbits.DC1B = 3;
    CCPR1L = 18;
    while(1){
       if(PORTDbits.RD0 == 0){
           --init;
           CCPR1L = init / 4;
           CCP1CONbits.DC1B = init % 4;
       }
    }
    return;
}

```

---

## LAB10 - ADC
- range: 範圍0~5V/0~3.3V
- resolution: 解析度bits
- ex. range = [0, 5V], resolution = 10 bits
      result = [0, 1023]
- Sampling Theorem => 區樣B hz需要取樣2B次 
- Sample & Hold => 將類比數值暫時儲存以利計算

### ADC演算法
![](https://i.imgur.com/DS21Myl.png)
- 利用累加累進法，判斷數值是否小於等於輸入電壓

### ADC pins
- 13 inputs (AN0~AN12)
- 10-bit A/D converter
- REG
![](https://i.imgur.com/skObsYO.png)

### ADCON0
![](https://i.imgur.com/Mwpb3eC.png)
- CHS3:CHS0 : 選擇類比輸入訊號pin
- GO/DONE : 開啟關閉ADC轉換
- ADON : 啟動ADC模組

### ADCON1
![](https://i.imgur.com/ra63Pjk.png)
- VCFG1:VCFG0 : 設定電壓來源
0 => VSS(12):VDD(11)
1 => AN3(5):AN2(4)
- PCFG3:PCFG0 : 設定那些腳位為A，哪些為D
![](https://i.imgur.com/KiYKBzG.png)
* 重開機時，PBADEN = 1，PCFG = 0000，PBADEN = 0，PCFG = 0111

### ADCON2
![](https://i.imgur.com/idZANSn.png)
- ADFM
![](https://i.imgur.com/oLT59Ss.png)
- ACQT : 轉換時間
- ADCS : 轉換clock
![](https://i.imgur.com/jpafhP9.png)

### TAD(time per bit in ADC)
- 10-bit轉換需要11 TAD
- TAD越短越好，但是不能小於某範圍
![](https://i.imgur.com/OOpn5H9.png)
![](https://i.imgur.com/UuMclDe.png)
![](https://i.imgur.com/br5xTMU.png)
- TAD > 0.7 us(最短工作時間) -> 設定ADCS
- xTAD > 2.4 us(溫度太高的極端情況) -> 設定ACQT

### ADC 總結
![](https://i.imgur.com/SqPCAQf.png)

### ADC補充:可用CCP2啟動
- CCP2M = 1011，ADCON0.ADON = 1
- 當CCP2模組被trigger，啟動ADC
- Timer1 or 3 會被reset
- 利用Timer來決定一秒採樣幾次

```
#include <xc.h>
#pragma config OSC  = INTIO67,WDT=OFF,LVP=OFF
#pragma PBADEN = 1 //set AN0~AN12 as analog input

void adc_init(void);
void ccp2_init(void);
void tmr_init(void);

int result[8] = {0};
int count = 7;

void __interrupt(high_priority) Hi_ISR(void)
{
    //deal ccp2 interrupt and adc interrupt
    if(PIR1bits.ADIF){//AD conversion finish
        PIR1bits.ADIF = 0;
        result[count] = ADRES;
    }
    else if(PIR2bits.CCP2IF){ //special event triger
        TMR3 = 0;
        PIR2bits.CCP2IF = 0;
        if(count == 7) {
            count = 0;
            NOP();
        }
        else
            ++count;
    }
    return;
}

void main(void) {
    //change OSC if you want
    //OSCCONbits.IRCF = 4;
    //    OSCCONbits.IRCF = ??;
    adc_init();
    ccp2_init();
    tmr_init();
    while(1);
    return;
}

void adc_init(void){
    //datasheet p232 TABLE 19-2
    //Configure the A/D module
    //ADCON0
    //select analog channel
    ADCON0bits.CHS = 7;
    //set TRIS
    TRISEbits.RE2 = 1;
    //Turn on A/D module
    ADCON0bits.ADON = 1;
    //ADCON1 //set refer voltage
    ADCON1bits.VCFG = 0;
    ADCON1bits.PCFG = 0;
    //ADCON2
    //A/D Conversion Clock
    ADCON2bits.ADCS = 3;
    //Acquisition Time
    ADCON2bits.ACQT = 1;
    //left or right justified
    ADCON2bits.ADFM = 1;
    //Configure A/D interrupt(optional)
    PIE1bits.ADIE = 1;
    PIR1bits.ADIF = 0;
    IPR1bits.ADIP = 1;
    INTCONbits.GIE = 1;
    //enable Interrupt Priority mode
    RCONbits.IPEN = 1;

}

void ccp2_init(void){
    //Configure CCP2 mode,ref datasheet p139
    CCP2CONbits.CCP2M = 11;
    //configure CCP2 interrupt
    IPR2bits.CCP2IP = 1;
    PIR2bits.CCP2IF = 0;
    PIE2bits.CCP2IE = 1;
    //configure CCP2 comparator value
    CCPR2 = 31250;
}

void tmr_init(void){
    //set up timer3, ref datasheet p135
    T3CONbits.TMR3CS = 0;
    T3CONbits.RD16 = 1;
    T3CONbits.TMR3ON = 1;
    T3CONbits.T3CKPS = 0;
    T3CONbits.T3CCP1 = 1;
    T3CONbits.T3CCP2 = 0;
    //no need to turn up timer3 interrupt
}
```

---

## LAB11 - UART(Universal Asynchronous Receiver Transmitter)

### 利用 Non-Return-to-Zero(NRZ)
- Baud Rate Generator
- Asynchronous Transmitter
- Asynchronous Receiver

### TSR 
- 資料傳輸的核心
- TRMT(read-only)，TSR為空時為1，TSR有值時為0

### TXREG
- 將資料放入TSR中
- TXREG會等收到STOP bit之後才把下一筆資料傳入TSR中
- 資料傳輸至TSR後，若清空TXREG，會立起TXIF，如果TXIE有開啟，就會發生interrupt
- 接下來如果有資料開始傳入TXREG，TXIF會被clear
- TXIF = 0 => 資料正在寫入TXREG
- TXIF = 1 => 資料傳輸至TSR，TXREG被清空


### RX9D & RCREG
- 接收完資料的話，RCIF會是1
- 有兩個queue(?)，若此時傳遞其他東西進去會overflow，OERR立起

### RSR
- RSR傳至RCREG清空後，有資料再進入RSR，FERR立起

### Baud Rate
- 單位時間內傳輸符號的個數，越高傳得越多

#### BRG: 
- 8-bit : SPBRG
- 16-bit : SPBRGH:SPBRG

#### BRGH(TXSTA) & BRG16(BAUDCON)
- 非同步時，控制baud rate
- 同步時，BRGH可以忽略

![](https://i.imgur.com/vXxJ9hc.png)
- 只會用到sync = 0
- Desired Baud Rate跟Calaulated Baud Rate不能差距太大
  (CBR - DBR) / DBR < 3%

### PIN SETTING
![](https://i.imgur.com/uOscYAa.png)
- INTCON.GIE = 1, PIE1.TXIE = 1, PIR1.TXIF = 1(資料為空), PIR1.RCIF = 0(資料還沒傳送到)
- RCSTAA.SPEN = 1(開啟傳輸)
- RCSTA.ADDEN，如果要利用9th bit來偵測address或者放值 = 1，單純8bit傳輸 = 0
- RCSTA.RX9 = 1, 有錯誤時可利用RCSTA.CREN來清除錯誤狀態
- TXSTA.TXEN = 1(開啟傳輸)
- TXSTA.SYNC = 0
- TXSTA.BRGH = 0
- BAUDCON.BRG16 = 0

### RX/TX
![](https://i.imgur.com/NbJ7ibR.png)
![](https://i.imgur.com/9l3xbDE.jpg)
- 線的TX接pic RX, 線的RX接pic TX

### demo
1. 裝置管理員找COM number
2. ![](https://i.imgur.com/OEDjNsy.png)




```
#include "setting_hardaware/setting.h"
#include <stdlib.h>
#include "stdio.h"
#include "string.h"
// using namespace std;

char str[10];

void Mode1() // print "Hello world"
{
    ClearBuffer();
    // TODO 
    // Output the result on Command-line Interface.
    UART_Write_Text("Hello ");
    UART_Write_Text("World!");

    ClearBuffer();
}

void Mode2() { // Output Voltage 
    ClearBuffer();
    int digital = 0;
    float voltage = 0.0;
    for(int i = 0; i < 10; ++i) // TODO design a condition. Return to main function when the while loop is over.
    {
        digital=ADC_Read(0);
        voltage = digital* ((float)5/1023); // 5v / 2^10-1  (10bits)
        // TODO
        // Output the voltage on CLI.
        memset(str, 0, 10);
        sprintf(str, "%lf", voltage);
        UART_Write_Text(str);
        UART_Write_Text("V");
        // The voltage must have the second digit after the decimal point.
        for(int i = 0 ; i < 10000 ; i++) ; // a delay time
    }
    
    ClearBuffer();
}

void main(void) 
{
    
    SYSTEM_Initialize() ;
    while(1) {
        // TODO 
        // "clear" > clear UART Buffer()
        if(strstr(GetString(), "clear") != NULL)
            ClearBuffer();
        else if(strstr(GetString(), "mode1") != NULL)
            Mode1();
        // "mode1" > start Mode1 function as above
        else if(strstr(GetString(), "mode2") != NULL)
            Mode2();
        // "mode2" > start Mode2 function as above*/
    }
    return;
    
}

// old version: 
// void interrupt high_priority Hi_ISR(void)
void __interrupt(high_priority) Hi_ISR(void)
{
    if(PIR1bits.CCP1IF == 1) {
        RC2 ^= 1;
        PIR1bits.CCP1IF = 0;
        TMR3 = 0;
    }
    return ;
}
```
---

## test maybe
It will sing the X'mas song In B tone
each interrupt interval is 0.1s
Using 1MHz OSC 
Using Timer1 for counting time 
Using Timer2 for PWM generating

```
#pragma config OSC = INTIO67
#pragma config WDT = OFF
#pragma config PBADEN = OFF
#pragma config LVP =OFF
#include <xc.h>
#define N 500u
#define C 247u
#define D 277u
#define E 311u
#define F 330u
#define G 370u
#define A 415u
#define B 466u


int tone[98] = {E, N, E, N, E, N, 
                E, N, E, N, E, N, 
                E, N, G, N, C, N, D, N, E, N,
                F, N, F, N, F, N, F, N,
                F, N, E, N, E, N, E, N,
                E, N, D, N, D, N, C, N, D, N, G, N,
                E, N, E, N, E, N, 
                E, N, E, N, E, N, 
                E, N, G, N, C, N, D, N, E, N,
                F, N, F, N, F, N, F, N,
                F, N, E, N, E, N, E, N,
                G, N, G, N, F, N, D, N, C, N};
int tempo[98] = {2, 1, 2, 1, 4, 1,
                2, 1, 2, 1, 4, 1,
                2, 1, 2, 1, 2, 1, 2, 1, 4, 1,
                2, 1, 2, 1, 2, 1, 2, 1,
                2, 1, 2, 1, 2, 1, 2, 1,
                2, 1, 2, 1, 2, 1, 2, 1, 4, 1, 4, 1,
                2, 1, 2, 1, 4, 1,
                2, 1, 2, 1, 4, 1,
                2, 1, 2, 1, 2, 1, 2, 1, 4, 1,
                2, 1, 2, 1, 2, 1, 2, 1,
                2, 1, 2, 1, 2, 1, 2, 1,
                2, 1, 2, 1, 2, 1, 2, 1, 8, 1};
int count = 0;
int index=0;
void __interrupt() tc_int(void)
{
    count++;
    if(count==tempo[index]){
        count=0;
        index++;
        PR2 = 62500/tone[index] -1;
    }
    if(index == 97)
        index = 0;
    TMR1 = 62410;
    PIR1bits.TMR1IF =0;

}

void main(void) {
    TRISCbits.RC2 = 0;
    T2CONbits.TMR2ON = 1;
    T2CONbits.T2CKPS = 1;
    OSCCONbits.IRCF = 4;
    CCP1CONbits.CCP1M = 12;
    
    RCONbits.IPEN= 1;
    PIE1bits.TMR1IE =1;
    PIR1bits.TMR1IF =0;
    IPR1bits.TMR1IP =1;
    INTCONbits.GIE =1;
    T1CONbits.RD16 = 1;
    T1CONbits.TMR1ON = 1;
    T1CONbits.T1CKPS = 3;
    T1CONbits.TMR1CS = 0;
    TMR1 = 62410;
    while(1);
}


```
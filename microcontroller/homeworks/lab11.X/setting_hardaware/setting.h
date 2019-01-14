#ifndef SETTING_H
#define	SETTING_H
#include <xc.h>
#include <pic18f4520.h>
//#include "pin_manager.h"
//#include "tmr2.h"
//#include "tmr1.h"
#include "uart.h"
#include "ccp1.h"
#include "adc.h"
#include "interrupt_manager.h"
#include "pin_manager.h"

void SYSTEM_Initialize(void);
void OSCILLATOR_Initialize(void);


#endif
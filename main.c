#include "main.h"

int main(void){
	volatile int i;
	// stop watchdog timer
	STOP_WATCHDOG_TIMER;
	// set up bit 0 of P1 as output
	P1_BIT0_OUTPUT;
	// intialize bit 0 of P1 to 0
	P1OUT = 0x00;

	for(;;){
		// toggle bit 0 of P1
		TOGGLE_BIT0;
		// delay for a while
		for(i=0; i<0x6000; i++);
	}
	return 0;
}

#include "xparameters.h"
#include "xil_printf.h"
#include "xil_types.h"
#include <stdio.h>
#include <sleep.h>

#define AXI_BASEADDR 0x40000000
int main() {

	u32* sdram = (u32*) AXI_BASEADDR;
	u32 x;
    int valid;

	xil_printf("\n\n\n\n\n\n\n\nHello World!\r\n");

	while (1) {
        xil_printf("Initializing RAM...\r\n");
        for (int n=0; n<0x10000; n++)
            sdram[n] = n;

        xil_printf("Validating RAM...\r\n");
        valid = 1;
        for (int n=0; n<0x10000; n++)
        {
            x = sdram[n];
            if(x != n)
            {
                xil_printf("Error: sdram[0x%x] = 0x%x\r\n", n, x);
                valid = 0;
                break;
            }
        }
        if(valid)
            xil_printf("RAM is valid!\r\n");

        usleep(100000);
    }

}


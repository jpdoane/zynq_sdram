#include <stdio.h>
#include "xil_printf.h"
#include <sleep.h>

#define SDRAM_BASEADDR   XPAR_M00_AXI_0_BASEADDR
#define SDRAM_SIZE       (1 << 24)

u32 ramval(u32 n) { return n ^ 0xFDB97531; }

int main()
{
    xil_printf("\n\n\n\n\rSDRAM check on AXI bus: 0x%x\n\r", SDRAM_BASEADDR);

    int valid;
	u32 x;
	u32* sdram = (u32*) SDRAM_BASEADDR;
    int Ncheck = SDRAM_SIZE/4;

    while (1) {
        xil_printf("Initializing [0x0-0x%x]...\r\n", Ncheck-1);
        for (int n=0; n < Ncheck; n++)
        {
            // xil_printf("writing 0x%x...\r\n", n);
            sdram[n] = ramval(n);
        }

        xil_printf("Checking [0x0-0x%x]...", Ncheck-1);
        valid = 1;
        for (int n=0; n<Ncheck; n++)
        {
            // xil_printf("reading 0x%x...\r\n", n);
            x = sdram[n];
            if(x != ramval(n))
            {
                xil_printf("[0x%x]: read 0x%x but expected 0x%x\r\n", n, x, ramval(n));
                valid = 0;
            }
            // else
            //     xil_printf("read 0x%x\r\n", n);

        }
        if(valid)
            xil_printf("Passed :)\r\n\n");
        else
            xil_printf("Failed :(\r\n\n");

        usleep(100000);
    }

    return 0;
}

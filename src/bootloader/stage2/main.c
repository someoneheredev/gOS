#include "stdint.h"
#include "stdio.h"

void _cdecl cstart_(uint16_t bootDrive)
{
    puts("C has loaded!\r\n");
    puts("gOS has loaded!\r\n");
    puts("Kernel has loaded!\r\n");

    printf("Formatted %% %c %s\r\n", 'a', "string");
    printf("Formatted %d %i %x %s %o %hd\r\n", 1234, 5678, 0xdead, "hello", 01234, (short)42);
    for (;;);
}
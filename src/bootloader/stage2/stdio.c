#include "stdio.h"
#include "x86.h"

void _cdecl putchar_(char c)
{
    x86_Video_WriteCharTeletype(c, 0);
}

void puts(const char* str)
{
    while(*str)
    {
        putchar_(*str);
        str++;
    }
}
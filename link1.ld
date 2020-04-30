SECTIONS 
{
    . = 0x50;

    /* same as .data : AT(0x100) */
    /* LMA is same as VMA by default*/
    .data :
    {
        *.o(.data)
        BYTE(0xcc)
    }

    v1 = .;
    /* LMA is different from VMA */
    .sec2 : AT(0x70)
    {
        LONG(.)
        BYTE(0xcf)
        LONG(.)
        LONG(ABSOLUTE(.))
        LONG(v1)
        BYTE(0xcf)
        *.o(.sec2)
        BYTE(0xcc)
    }

    v2 = .;
    .text : AT(0x90)
    {   
        BYTE(0xcc) 
        sample.o(.text)
        BYTE(0xcc)
    }


    .text : AT(0x110)
    {
        sample2.o(.text)
        BYTE(0xcc)
    }
    
    .rodata :
    {
        . = ALIGN(16);
        BYTE(0xcf)
        . = . + 50;
        BYTE(0xcf)
    }



}
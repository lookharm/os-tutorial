# 08

1. Write simple instructions that print string in 32-bit protected mode. 
[solution](./print_pm.asm)
    ```asm
    [bits 32]
    VIDEO_MEMORY equ 0xb8000
    WHITE_ON_BLACK equ 0x0f

    print_string_pm:
        ; code here...
        ;;;;;;;;;;;;;;

    print_string_pm_loop:
        ; code here...
        ;;;;;;;;;;;;;;

    print_string_pm_done:
        ; code here...
        ;;;;;;;;;;;;;;
    ```

2. Write simple segment descriptors: null descriptor, code descriptor, and data descriptor.
    - null descriptor: 8 zero bytes. [solution](./gdt_null.asm)
    - code descriptor: [solution](./gdt_code.asm)
        - base =0 x0 , limit =0 xfffff ,
        - 1 st flags : (present)1 (privilege)00 (descriptor type)1 -> 1001 b
        - type flags : (code)1 (conforming)0 (readable)1 (accessed)0 -> 1010 b
        - 2 nd flags : (granularity)1 (32 - bit default)1 (64 - bit seg)0 (AVL)0 -> 1100 b
    - data descriptor: [solution](./gdt_data.asm)
        - base =0x0 , limit =0xfffff ,
        - 1 st flags : ( present )1 ( privilege )00 ( descriptor type )1 -> 1001 b
        - type flags : ( code )0 ( expand down )0 ( writable )1 ( accessed )0 -> 0010 b
        - 2 nd flags : ( granularity )1 (32 - bit default )1 (64 - bit seg )0 ( AVL )0 -> 1100 b

    - hint: [Writing a Simple Operating System — from Scratch](https://www.cs.bham.ac.uk/~exr/lectures/opsys/10_11/lectures/os-dev.pdf#page=38&zoom=100,141,774)

3. Write a simple Global Descriptor Table. [solution](./gdt.asm)
    - GDT size: 16 bits
    - GDT address: 32 bits
    - Use the following template:
        ```asm
        gdt_start:

        gdt_null:
            dd 0x0
            dd 0x0

        gdt_code:
            dw 0xffff
            dw 0x0
            db 0x0
            db 10011010b
            db 11001111b
            db 0x0

        gdt_data:
            dw 0xffff
            dw 0x0
            db 0x0
            db 10010010b
            db 11001111b
            db 0x0
            
        gdt_end:

        gdt_descriptor:
            ; code here...

            ;;;;;;;;;;;;;;

        CODE_SEG equ gdt_code - gdt_start
        DATA_SEG equ gdt_data - gdt_start
        ```

4. Write a simple instructions that switch from 16-bit real mode to 32-bit protected mode by follwing these steps: [solution](./switch.asm)
    1. Disable interrupts
    2. Load our GDT
    3. Set a bit on the CPU control register cr0
    4. Flush the CPU pipeline by issuing a carefully crafted far jump
    5. Update all the segment registers
    6. Update the stack
    7. Call to a well-known label which contains the first useful code in 32 bits
    
    ```asm
    [bits 16]
    switch_to_pm:
        ; code here...
        ;1
        ;2
        ;3
        ;;;;;;;;;;;;;;
        
        jmp CODE_SEG:start_pm ;4

    [bits 32]
    start_pm:
        ; code here...
        mov ax, DATA_SEG ;5
        mov ds, ax
        ; ss
        ; ...

        ;6

        ;;;;;;;;;;;;;;


        call BEGIN_PM ;7
    ```
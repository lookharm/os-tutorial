[bits 16]
switch_to_pm:
    cli ;1

    lgdt [gdt_descriptor] ;2

    mov eax, cr0 ;3
    or eax, 0x1
    mov cr0, eax

    jmp CODE_SEG:start_pm ;4

[bits 32]
start_pm:
    mov ax, DATA_SEG ;5
    mov ds, ax
    mov ss, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov ebp, 0x900000 ;6
    mov esp, ebp

    call BEGIN_PM ;7
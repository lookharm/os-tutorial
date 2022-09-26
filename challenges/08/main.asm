[org 0x7c00]
    mov bp, 0x9000
    mov sp, bp
    
    mov bx, MSG_RM
    call print_string

    call switch_to_pm

    jmp $

%include "./print.asm"
%include "./gdt.asm"
%include "./print_pm.asm"
%include "./switch.asm"

BEGIN_PM:
    mov ebx, MSG_PM
    call print_string_pm

    jmp $

MSG_PM: db "32-bit protected mode", 0
MSG_RM: db "16-bit real mode", 0

times 510-($-$$) db 0
dw 0xaa55
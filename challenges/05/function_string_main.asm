[org 0x7c00]

mov bp, 0x8000
mov sp, bp

main:
    push HELLO
    call print
    mov sp, bp ; clear stack
    call println

jmp $

%include "function_string_print.asm"

HELLO: db 'HELLO', 0

times 510-($-$$) db 0x00
dw 0xaa55
[org 0x7c00]

mov bp, 0x8000
mov sp, bp

main:
    push 'A'
    call print

jmp $

%include "bootsector_function_char_print.asm"

X: db 'X'

times 510-($-$$) db 0x00
dw 0xaa55
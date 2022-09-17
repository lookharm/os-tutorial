mov ah, 0x0e

mov al, "2"
int 0x10
mov bx, 0x20
add bx, 0x7c00
mov al, [bx]
int 0x10

jmp $

the_secret:
    db "X"

times 510-($-$$) db 0x00
dw 0xaa55
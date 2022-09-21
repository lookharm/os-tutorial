[org 0x7c00]
    ; code here...

    mov bx, 0x9000

    mov ah, 0x02 ; read mode
    mov al, 0x01 ; read 1 sector
    mov cl, 0x02 ; start at 2nd sector
    mov ch, 0x00 ; cylinder 0
                 ; driver number = dl, it is seted by BIOS,
    mov dh, 0x00 ; head 0

    int 0x13
    jc disk_err
    
    cmp al, 0x01
    jne sectors_err

    mov ah, 0x0e
    mov al, [0x9000]
    int 0x10    
    
    ;;;;;;;;;;;;;;

jmp $

disk_err:
    mov ah, 0x0e

    mov al, "D"
    int 0x10
    mov al, "E"
    int 0x10

    jmp $

sectors_err:
    mov ah, 0x0e

    mov al, "S"
    int 0x10
    mov al, "E"
    int 0x10
    
    jmp $

times 510 - ($-$$) db 0
dw 0xaa55

db "A"
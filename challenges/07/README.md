# 07

1. Write a boot sector program that reads the first byte of the 2nd sector on the disk, and also checks error from the disk and sectors reading.
[solution](./segmentation_1.asm)
```asm
[org 0x7c00]
    ; code here...

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
```
hint: [INT 13,2 - Read Disk Sectors](https://stanislavs.org/helppc/int_13-2.html)
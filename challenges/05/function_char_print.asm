print:
    push bp
    mov bp, sp
    
start:
    mov al, [bp+4]
    mov ah, 0x0e
    int 0x10

done:
    pop bp
    ret
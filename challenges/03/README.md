# 03

1. Write a boot sector program that reveals "the_secret".
[solution 1](./memory1.asm) | [solution 2](./memory2.asm).
```asm
mov ah, 0x0e

; code here...

jmp $

the_secret:
    db "X"

times 510-($-$$) db 0x00
dw 0xaa55
```

2. Write a boot sector program that reveals "the_secret" (agin but with a defined "global offset").
[solution](./memory_org.asm)
```asm
[org 0x7c00]

; code here...

jmp $

the_secret:
    db "X"

times 510-($-$$) db 0x00
dw 0xaa55
```
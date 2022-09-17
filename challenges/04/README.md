# 04

Write a boot sector program that prints the characters "ABCD" within the stack in normal order ("ABCD") and reverse order("DCBA").
[solution](./stack.asm)
```asm
mov ah, 0x0e

mov bp, 0x8000
mov sp, bp

push "A"
push "B"
push "C"
push "D"

; code here...

jmp $
times 510-($-$$) db 0x00
dw 0xaa55
```
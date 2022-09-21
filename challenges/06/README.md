# 06

1. Write a boot sector program that reveals "the_secret" by using DS register.
[solution](./segmentation_1.asm)
```asm
mov ah, 0x0e

; code here...

jmp $

the_secret:
    db "X"

times 510-($-$$) db 0x00
dw 0xaa55
```

2. Write a boot sector program that reveals "the_secret" by using ES register.
[solution](./segmentation_2.asm)
```asm
mov ah, 0x0e

; code here...

;;;;;;;;;;;;;;

jmp $

the_secret:
    db "X"

times 510-($-$$) db 0x00
dw 0xaa55
```
# 05

1. Write a boot sector program that uses sub-routine to print the character 'X'. To call sub-routine, use stack to a pass parameter.
[solution](./function_char_main.asm)
```asm
[org 0x7c00]

mov bp, 0x8000
mov sp, bp

main:
    ; code main-routine here...

    ;;;;;;;;;;;;;;

jmp $

; include sub-routine here...

;;;;;;;;;;;;;;;;;;;;;;;;;;;;

X: db 'X'

times 510-($-$$) db 0x00
dw 0xaa55
```

2. Write a boot sector program that uses sub-routine to print the string 'HELLO'. To call sub-routine, use stack to a pass parameter.
[solution](./function_string_main.asm)
```asm
[org 0x7c00]

mov bp, 0x8000
mov sp, bp

main:
    ; code main-routine here...

    ;;;;;;;;;;;;;;

jmp $

; include sub-routine here...

;;;;;;;;;;;;;;;;;;;;;;;;;;;;

HELLO: db 'HELLO', 0

times 510-($-$$) db 0x00
dw 0xaa55
```

hint: [Calling Convention](https://www.cs.virginia.edu/~evans/cs216/guides/x86.html)
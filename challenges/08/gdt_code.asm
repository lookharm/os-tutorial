; base =0 x0 , limit =0 xfffff ,
; 1 st flags : (present)1 (privilege)00 (descriptor type)1 -> 1001 b
; type flags : (code)1 (conforming)0 (readable)1 (accessed)0 -> 1010 b
; 2 nd flags : (granularity)1 (32 - bit default)1 (64 - bit seg)0 (AVL)0 -> 1100 b

dw 0xffff
dw 0x0
db 0x0
db 10011010b
db 11001111b
db 0x0
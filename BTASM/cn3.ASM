INCLUDE lib1.asm
.MODEL small
.DATA
     m1 db 13,10, 'May tinh co FPU khong: $'
     co db 13,10, 'Co $'
     ko db 13,10, 'Khong $'
.CODE
public _FPU
_FPU proc
    mov ax, @data
    mov ds, ax
    CLRSCR
    HienString m1
    int 11h
    shr AL, 1
    jc L1
    HienString ko
    int 21h
    ret
L1: 
     HienString co
_FPU endp
END

INCLUDE LIB2.ASM
.MODEL small
.STACK 100h
.DATA
    msg db 13,10,'Giai thua cua 5 la: $'
.CODE
SUPERMAN:
    mov AX, @data
    mov ds, AX
    lea dx, msg
    mov ah, 09h
    int 21h
    call VAO_SO_N ; so nhap vao nam trong AX
    mov CX, AX
    mov AX, 1
L1:
    MUL CX
    loop L1
    mov BX, 10; so chia; so bi chia dang nam trong AX
    XOR CX, CX ; set CX = 0
HSN1:
    XOR DX, DX; set DX = 0
    DIV BX; AX: thuong; DX; so du
    ADD DX, 30h; chuyen gia tri trong DX sang ky tu 
    PUSH DX; --> Dua gia tri trong DX vao top cua stack
    INC CX; dem so lan dua so du cua phep chia vao Stack
    AND AX, AX
    jnz HSN1
HSN2:
    POP AX
    mov ah, 0eh
    int 10h
    loop HSN2
Exit:
    mov ah,4ch ; return to DOS
    int 21h
END SUPERMAN
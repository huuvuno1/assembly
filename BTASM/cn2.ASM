include lib1.asm
.model small
.data
M1 db 13,10,'          CHUC NANG TINH TRUNG BINH 2 SO'
   db 13,10,'          --------------***-------------'
   db 13,10,13,10,'     Vao so thu 1: $'
M2 db 13,10,'     Vao so thu 2: $ '
M3 db 13,10,'     TBC 2 so nguyen: $'
dautru db'-$'
M4 db '.5$'
M5 db 13,10,'     Co tiep tuc CT (c/k)?: $'
.CODE
 public _TBC2SO
_TBC2SO proc
  L0:
    CLRSCR
    HienString M1
    call VAO_SO_N
    mov bx,ax
    HienString M2
    call VAO_SO_N
    HienString M3
    add ax,bx
    and ax,ax
    jns L1
    HienString dautru
    neg ax
  L1:
    shr ax,1
    pushf
    call HIEN_SO_N
    popf
    jnc L2
    HienString M4
  L2:
    HienString M5
    mov ah,1
    int 21h
    cmp al,'c'
    jne Thoat
	  jmp L0
  Thoat:
    ret
_TBC2SO ENDP
include lib2.asm
 END

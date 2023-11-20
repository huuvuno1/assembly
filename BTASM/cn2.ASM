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
    and ax,ax ; Giá trị tổng là âm hay dương?
    jns L1 ; Tổng là dương thì nhảy đến L1
    HienString dautru
    neg ax ; đổi dấu số bị chia
  L1:
    shr ax,1 ; Chia đôi làm tròn dưới => shift right
    pushf ; Cất giá trị cờ vào stack (thực chất là giá trị cờ Carry)
    call HIEN_SO_N
    popf ; Lấy lại giá trị cờ từ stack (lấy lại trạng thái bit cờ Carry)
    jnc L2 ; Nếu Carry=0 (giá trị tổng là chẳn) thì nhảy
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

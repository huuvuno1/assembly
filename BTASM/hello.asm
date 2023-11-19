include lib1.asm
.model small
.stack 100h
.data
  ;ten_bien kieu_du_lieu gia_tri
  hell db 13,10,'Hello world$'
.code
hung:
  mov AX,@data
  mov DS,AX
  CLRSCR
  HienString hell
  call VAO_SO_N
  mov bx, ax

  hienstring hell
  call VAO_SO_N
  and bx, ax
  
  mov ax, bx
  call HIEN_SO_N

  mov ah,4ch ; return to DOS  
  int 21h
  include lib2.asm
end hung
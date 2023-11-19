include lib1.asm
.model small
.stack 100h
.data
  ;msg db 13, 10, 'Hello, World!$'

.code
MAIN:
  mov ax, @data
  mov ds, ax
  
  
  
EXIT:
  mov ax, 4c00h
  int 21h
include lib2.asm
include lib3.asm
END MAIN

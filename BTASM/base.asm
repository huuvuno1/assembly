include lib1.asm
.model small
.stack 100h
.data
  ;msg db 13, 10, 'Hello, World!$'
  tiep_tuc db 13, 10, 'Tiep tuc? (c/k): $'

.code
MAIN:
  mov ax, @data
  mov ds, ax
  CLRSCR
  
  
TIEP_TUC_LABEL:
  HienString tiep_tuc
  mov ah, 1
  int     21h
  cmp al, 'c'
  jne EXIT
  jmp MAIN

EXIT:
  mov ax, 4c00h
  int 21h
include lib2.asm
include lib3.asm
END MAIN

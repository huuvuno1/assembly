;-------------------------------
;   MACRO HIEN MOT XAU KY TU	|
; KET THUC BANG '$' RA MAN HINH	|
;-------------------------------
HienString MACRO xau
	push AX DX
	mov  DX,offset xau	; DX tro den dau xau
	mov  AH,9		; Chuc nang hien 1 xau ky tu 
	int  21h		; (ket thuc bang '$') len man hinh
	pop  DX AX
	ENDM
;--------------------
; MACRO XOA MAN HINH |
;--------------------
CLRSCR MACRO
	push AX
	mov  AH,0fh		; Chuc nang lay mode man hinh hien thoi
	int  10h		; va so mode nam o AL
	mov  AH,0		; Chuc nang dat mode cho man hinh
	int  10h		; so mode can dat nam o AL
	pop  AX
	ENDM
;-----------------------------
.MODEL small
.DATA
m1 db 13,10,'         CHUC NANG TAO LAP THU MUC'
   db 13,10,'         -----------***-----------'
   db 13,10,13,10,'     Vao ten TM can tao: $'
Err_MD db 13,10,'     Khong tao duoc TM!$'
Empt_MD db 13,10,'     Chua nhap ten thu muc! Hay nhap lai!$'
suc_MD db 13,10,'     TM da duoc tao!$'
buff     db 30
         db ?
dir_name db 30 dup(?)
tieptuc db 13,10,'     Co tiep tuc CT (c/k)? $'
.CODE
PUBLIC _TAOTM
_TAOTM PROC
      L0:
         CLRSCR
         HienString m1
         lea dx,buff
         call GET_DIR_NAME
         lea bx,dir_name
         mov al,[bx]
         and al,al
         jnz LX
         HienString Empt_MD
         mov ah,1
         int 21h
         jmp L0
     LX:
         lea dx,dir_name
         mov ah,39h 
         int 21h  ;chuc nang tao thu muc
         jnc L1
         HienString Err_MD
         jmp Exit
       L1:
         HienString suc_MD
       Exit:
         HienString tieptuc
         mov ah,1
         int 21h
         cmp al,'c'
         jne Thoat
         jmp L0
    Thoat:
          ret
_TAOTM ENDP
INCLUDE lib3.asm
END

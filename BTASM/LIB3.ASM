;----------------------------
;   Chuong trinh con nhan    |
;  ten tep vao tu ban phim   |
; Yeu cau : dx=offset buf    |
; Phai khai bao trong data : |
;   buff      db 50	     |
;	      db ?	     |
;   file_name db 50 dup(?)   |
;----------------------------
GET_FILE_NAME PROC
	push ax bx cx dx
	mov  ah,0ah	; Chuc nang nhan 1 xau tu
	int  21h	; ban phim va de vao buff
	mov  bx,dx	; bx tro den dau buf
	inc  bx		; bx tro den byte chua so luong ky tu da vao
	mov  cl,[bx]	; cl=so luong ky tu thuc te da vao
	xor  ch,ch	; ch=0 de cx=cl
	inc  bx		; bx tro den byte dau tien chua ky tu da vao
	add  bx,cx	; bx tro den byte chua 0dh (Enter)
	mov  [bx],ch	; Cho byte do bang \0
	pop  dx cx bx ax
	ret
GET_FILE_NAME ENDP

	  
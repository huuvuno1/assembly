INCLUDE lib1.asm
.MODEL small
;.STACK 100h
.DATA
dtt1  db 13,10,'   Hay vao ten tep can dat thuoc tinh: $'
dtt2  db 13,10,'          Vao thuoc tinh cho tep: '
        db 13,10,'          0. Khong dat thuoc tinh'
        db 13,10,'          1. Read Only'
        db 13,10,'          2. Hidden'
        db 13,10,'          3. Read Only+Hidden'
        db 13,10,'          4. System'
        db 13,10,'          5. Read Only+System'
        db 13,10,'          6. Hidden+System'
        db 13,10,'          7. Read Only+Hidden+System'
        db 13,10,'          8. Archive'
        db 13,10,'          9. Archive+Read Only'
        db 13,10,'         10. Archive+Hidden'
        db 13,10,'         11. Archive+Read Only+Hidden'
        db 13,10,'         12. Archive+System'
        db 13,10,'         13. Archive+Read Only+System'
        db 13,10,'         14. Archive+Hidden+System'
        db 13,10,'         15. Archive+Read Only+Hidden+System'
        db 13,10,13,10,'        -> Hay chon: $'
  Err_DTT db 13,10,'   Khong dat duoc thuoc tinh cho tep! $'
  Suc_DTT db 13,10,'   Tep da dat duoc thuoc tinh! $'
  buff          db 30
                   db ?
  file_name db 30 dup(?)
	  tieptuc      db 13,10,' Co tiep tuc CT (c/k) ? $'

.CODE
;PS:
;	  mov  ax,@data
;    mov  ds,ax

PUBLIC _THEM_THUOC_TINH
_THEM_THUOC_TINH PROC

L_DTT0:
  CLRSCR
  HienString dtt1	; Hiện thông báo dtt1		
  lea    dx,buff
  call   GET_FILE_NAME ; Vào tên tệp cần lấy thuộc tính 
  HienString dtt2	; Hiện thông báo dtt2
  call  VAO_SO_N     ; Chọn thuộc tính (từ 0 -> 15)
  mov   cx,ax		; Đặt thuộc tính vào CX
  cmp   cx,8
  jb       L_DTT1
  add    cx,24	
L_DTT1:	
	lea     dx,file_name	; Thuộc tính có trong CX 
	mov   al,1		; Đặt thuộc tính
	mov  ah,43h
	int    21h
	jnc   L_DTT2
	HienString Err_DTT; Hiện thông báo Err_DTT
	jmp  Exit_DTT
L_DTT2:
	HienString Suc_DTT; Hiện thông báo Suc_DTT
Exit_DTT:
  HienString tieptuc      ; Hiện thông báo tieptuc
  mov  ah,1                   ; Chờ 1 ký tự từ bàn phím
  int     21h                         
  cmp   al,'c'                 ; Ký tự vào có phải 'c'
  jne    Thoat_DTT      ; Không phải 'c' thì nhảy đế Thoat_DTT,
  jmp    L_DTT0	; còn đúng là 'c' thì nhảy về L_DTT0

Thoat_DTT:                     
;  mov  ah,4ch		; Về DOS
;  int     21h
  ret

INCLUDE lib2.asm		; lib2.asm chứa CT con VAO_SO_N
INCLUDE lib3.asm		; lib3.asm chứa CT con GET_FILE_NAME
END
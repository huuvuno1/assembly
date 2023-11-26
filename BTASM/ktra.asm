INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 ct1 db 13,10,' Hay vao ten tep : $'
 ct2 db 13,10,' Hay vao ten tep can copy den : $'
 ok db 13,10,' Ten tep hop le $'
 Err_O db 13,10,' Ten tep khong hop le !$'
 buff db 30
 db ?
 file_name db 30 dup(?)
 tieptuc db 13,10,' Co tiep tuc CT (c/k) ? $'
.CODE
 PS:
mov ax,@data
mov ds,ax
 CLRSCR
 L_CT0:
 HienString ct1 ; Hiện thông báo ct1
 lea dx,buff
 call GET_FILE_NAME ; Vào tên tệp cần copy đi
 lea dx,file_name ; Mở tệp đã có để đọc

 mov al,0
 mov ah,3dh
 int 21h
 jnc L_CT1
 HienString Err_O ; Hiện thông báo Err_O nếu mở tệp bị lỗi (CF=1)
 ;jmp Exit_CT
 jmp L_CT0
L_CT1:
  HienString ok
  jmp Exit_CT

 Exit_CT:
 Hienstring tieptuc ; Hiện thông báo tieptuc
 mov ah,1 ; Chờ 1 ký tự từ bàn phím
 int 21h
 cmp al,'c' ; Ký tự vào có phải 'c'
 jne Thoat_CT ; Không phải 'c' thì nhảy đế Thoat_CT,
 jmp L_CT0 ; còn đúng là 'c' thì nhảy về L_CT0
 Thoat_CT:
mov ah,4ch ; Về DOS
int 21h
INCLUDE lib3.asm ; lib3.asm chứa CT con GET_FILE_NAME
END PS
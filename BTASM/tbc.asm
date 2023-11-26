; yeu cau tinh trung binh cong 2 so am, neu so nguyen duong thi bat nhap lai
INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
M1      db 13,10,'Hay vao so thu 1: $'
M2      db 13,10,'Hay vao so thu 2: $'
M3      db 13,10,'Trung binh cong 2 so nguyen la : $'
dautru db '-$'
M4      db '.5$'
M5      db 13,10,'Co tiep tuc CT (c/k)? $'
M6      db 13,10,'Vui long nhap so am! $'
.CODE
PS:
	mov  ax,@data
	mov  ds,ax
	clrscr

NHAP:
	HienString M1	; Hiện thông báo M1 (‘Hay vao so thu 1 : ‘)
	call  VAO_SO_N	; Nhận giá trị số thứ 1
	
	and ax,ax		; Giá trị số thứ 1 là âm hay dương?
	jns  INTHONGBAO	; Nếu âm thì nhảy đến nhãn INTHONGBAO
	mov  bx,ax		; bx = giá trị số thứ 1
	

NHAP_SO_2:
	HienString M2	; Hiện thông báo M2 (‘Hay vao so thu 2 : ‘)
	call  VAO_SO_N	; Nhận giá trị số thứ 2
	jns  INTHONGBAO2

	HienString M3	; Hiện thông báo M3 (‘Trung binh cong 2 so nguyen la :’)
	add  ax,bx		; Tổng 2 số (ax=ax+bx)
	and  ax,ax		; Giá trị tổng là âm hay dương?
	jns   L1		; Tổng là dương thì nhảy đến L1
	HienString dautru	; còn âm thì hiện dấu ‘-‘
	neg  ax		; và đổi dấu số bị chia
    L1:
	shr   ax,1		; Chia đôi làm tròn dưới
	pushf			; Cất giá trị cờ vào stack (thực chất là giá trị cờ Carry)
	call  HIEN_SO_N	; Hiện giá trị trung bình cộng làm tròn dưới
	popf			; Lấy lại giá trị cờ từ stack (lấy lại trạng thái bit cờ Carry)
	jnc   L2		; Nếu Carry=0 (giá trị tổng là chẳn) thì nhảy
	HienString M4	; còn  Carry # 0 thì hiện thêm ‘.5’ lên màn hình
     L2:
	HienString M5	; Hiện thông báo M5 (‘Co tiep tuc CT (c/k)? ‘)
	mov  ah,1		; Chờ nhận 1 ký tự từ bàn phím
	int     21h
	cmp  al,'c'		; Ký tự vừa nhận có phải là ký tự ‘c’ ?
	jne    Exit		; Nếu không phải thì nhảy đến nhãn Exit (về DOS)
	jmp   PS		; Còn không thì quay về đầu (bắt đầu lại chương trình)
	 
	  
INTHONGBAO:
	HienString M6
	jmp  NHAP

INTHONGBAO2:
	HienString M6
	jmp  NHAP_SO_2


   Exit:
	mov  ah,4ch		; Về DOS
	int     21h
INCLUDE lib2.asm
	END PS

CÁC BÀI TẬP MẪU THUẦN TÚY
NGÔN NGỮ ASSEMBLY

Bài 1
;--------------------------------------------------------------------------
; a lũy thừa n (với a là số nguyên và n là số nguyên dương) |
;--------------------------------------------------------------------------
Khi chương trình chạy yêu cầu có dang :



INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
M1   db 13,10,'Hay vao a : $'
M2   db 13,10,'Hay vao n : $'
crlf   db 13,10,'$'
M3   db ' luy thua $'
M4   db ' la : $'
M5   db 13,10,'Co tiep tuc CT (c/k)? $'
.CODE
PS:
	mov  ax,@data
	mov  ds,ax
	clrscr
	HienString M1	; Hiện thông báo M1 (‘Hay vao a : ‘)
	call   VAO_SO_N	; Nhận giá trị a
	mov  bx,ax		; bx = a
	HienString M2	; Hiện thông báo M2 (‘Hay vao n : ‘)
	call   VAO_SO_N	; Nhận giá trị n
	mov  cx,ax		; cx = n
	HienString crlf	; Quay đầu dòng và xuống hàng
	mov  ax,bx		; ax=a
	call   HIEN_SO_N	; Hiện giá trị a lên màn hình
	HienString M3	; Hiện 2 chữ ‘ luy  thua ‘
	mov  ax,cx		; ax=n
	call   HIEN_SO_N	; Hiện giá trị n lên màn hình
	HienString M4	; Hiện chữ ‘ la : ‘
	mov  ax,1		; Gán ax=1
	and   cx,cx		; Liệu giá trị n (cx=n) có bằng 0 ?
	jz      HIEN		; Nếu bằng 0 thì nhảy đến nhãn HIEN
   LAP:			; còn không thì  thực hiện vòng lặp tính a lũy thừa n
	mul   bx		; ax=ax*bx
	loop  LAP
   HIEN:
	call   HIEN_SO_N	; Hiện giá trị a lũy thừa n (giá trị có trong ax)
	HienString M5	; Hiện thông báo M5 (‘Co tiep tục CT (c/k) ?’ )
	mov  ah,1		; Chờ nhận 1 ký tự từ bàn phím
	int     21h
	cmp  al,'c'		; Ký tự vừa nhận có phải là ký tự ‘c’ ?
	jne    Exit		; Nếu không phải thì nhảy đến nhãn Exit (về DOS)
	jmp   PS		; Còn không thì quay về đầu (bắt đầu lại chương trình)
   Exit:
	mov  ah,4ch		; Về DOS
	int     21h
INCLUDE lib2.asm
	END PS

Bài 2
;----------------------        
; n! (n từ 0 đến 7) |
;----------------------
Khi chương trình chạy yêu cầu có dang :




INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
M1   db 13,10,'Hay vao n : $'
M2   db 13,10,'Giai thua cua $'
M3   db ' la : $'
M4   db 13,10,'Co tiep tuc CT (c/k)? $'
.CODE
PS:
	mov  ax,@data
	mov  ds,ax
	clrscr
	HienString M1	; Hiện thông báo M1 (‘Hay vao n : ‘)
	call   VAO_SO_N	; Nhận 1 số vào từ bàn phím
	mov  cx,ax		; cx = n
	HienString M2	; Hiện thông báo M2 (‘Giai thua cua ‘)
	call   HIEN_SO_N	; Hiện giá trị n
	HienString M3	; Hiện thông báo M3 (‘ la : ‘)
	mov  ax,1		; ax=1
	cmp  cx,2		; Liệu n ≤ 2
	jb      HIEN		; Đúng là ≤ 2 thì nhảy đến nhãn HIEN
LAP:			; còn không thì thực hiện vòng lặp tính n!
	mul   cx		; ax=ax*cx
	loop  LAP
HIEN:
	call   HIEN_SO_N	; Hiện giá trị n! (có trong ax)
	HienString M4	; Hiện thông báo M4 (‘Co tiep tuc CT (c/k) ?’)
	mov  ah,1		; Chờ nhận 1 ký tự từ bàn phím
	int     21h
	cmp  al,'c'		; Ký tự vừa nhận có phải là ký tự ‘c’ ?
	jne    Exit		; Nếu không phải thì nhảy đến nhãn Exit (về DOS)
	jmp   PS		; Còn không thì quay về đầu (bắt đầu lại chương trình)
Exit:
	mov  ah,4ch		; Về DOS
	int     21h
INCLUDE lib2.asm
	END PS








Bài 3
;---------------------------------------
; Trung bình cộng 2 số nguyên |
;---------------------------------------
Khi chương trình chạy yêu cầu có dang :





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
.CODE
PS:
	mov  ax,@data
	mov  ds,ax
	clrscr
	HienString M1	; Hiện thông báo M1 (‘Hay vao so thu 1 : ‘)
	call  VAO_SO_N	; Nhận giá trị số thứ 1
	mov  bx,ax		; bx = giá trị số thứ 1
	HienString M2	; Hiện thông báo M2 (‘Hay vao so thu 2 : ‘)
	call  VAO_SO_N	; Nhận giá trị số thứ 2
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
   Exit:
	mov  ah,4ch		; Về DOS
	int     21h
INCLUDE lib2.asm
	END PS

Bài 4
;-----------------------------
; Tổng 1 dãy số nguyên |
;-----------------------------
Khi chương trình chạy yêu cầu có dang :








INCLUDE lib1.asm
.MODEL small
.DATA
M1 db 10,13,'Hay vao so luong thanh phan : $'
M2 db 10,13,'a[$'
M3 db ']= $'
M4 db 10,13,'Day so vua vao la : $'
M5 db '  $'
M6 db 10,13,'Tong day so nguyen la : $'
M7 db 13,10,'Co tiep tuc CT (c/k) ? $'
sltp dw ?
i     dw ?
a    dw 100 dup(?)
.CODE
PS:
	mov  ax,@data
	mov  ds,ax
	CLRSCR
	HienString M1	; Hiện thông báo M1 (‘Hay vao so luong thanh phan :’)
	call   VAO_SO_N	; Nhận số lượng thành phần
	mov  sltp,ax		; Cất giá trị số lượng thành phần vào biến sltp
; Vòng lặp nhận các số đưa vào mảng
	mov  cx,ax		; cx=số lượng thành phần (chỉ số vòng lặp LOOP)
	lea     bx,a		; bx là con trỏ offset của a[0]
	mov   i,0		; Gán giá trị biến nhớ i=0
    L1:
	HienString M2	; Hiện thông báo M2 (‘a[‘)
	mov  ax,i		; Hiện giá trị i
	call   HIEN_SO_N
	HienString M3	; Hiện thông báo M3 (‘] =’)
	call   VAO_SO_N	; Nhận các thành phần a[i]
	mov  [bx],ax		; Đưa giá trị a[i] vào mảng a do bx trỏ đến
	inc    i			; Tăng giá trị i lên 1
	add   bx,2		; bx trỏ đến thành phần tiếp theo của mảng a
	loop  L1
; Vòng lặp đưa các số của mảng lên màn hình
	HienString M4	; Hiện thông báo M4 (‘Day so vua vao la : ‘)
	mov  cx,sltp		; cx=số lượng thành phần (chỉ số vòng lặp)
	lea    bx,a		; bx trỏ đến a[0]
   L2:
	mov  ax,[bx]		; ax=a[i]
	call   HIEN_SO_N	; Hiện giá trị a[i] lên màn hình
	HienString M5	; Hiện 2 dấu cách (space)
	add    bx,2		; bx trỏ đến thành phần tiếp theo của mảng
	loop   L2
; Vòng lặp tính tổng
	HienString M6	; Hiện thông báo M6 (‘Tong day so nguyen la : ‘)
	mov  cx,sltp		; cx=số lượng thành phần của mảng (chỉ số vòng lặp)
	lea     bx,a		; bx trỏ đến a[0] (con trỏ offset)
	xor    ax,ax		; ax chứa tổng (lúc đầu bằng 0)
   ;--------------------------------------------------------------------------------------
   ; L3:	|
   ;       add    ax,[bx]	; ax=ax+a[i]	|
   ; 	add    bx,2	; bx trỏ đến thành phần tiếp theo của mảng a	|
   ;	loop   L3	|
   ;--------------------------------------------------------------------------------------
	call    HIEN_SO_N	; Hiện giá trị tổng
	HienString M7	; Hiện thông báo M7 (Co tiep tuc CT (c/k) ?’)
	mov  ah,1		; Chờ nhận 1 ký tự từ bàn phím
	int     21h
	cmp  al,'c'		; Ký tự vừa nhận có phải là ký tự ‘c’ ?
	jne    Exit		; Nếu không phải thì nhảy đến nhãn Exit (về DOS)
	jmp   PS		; Còn không thì quay về đầu (bắt đầu lại chương trình)
   Exit:
	mov  ah,4ch		; Về DOS
	int     21h
INCLUDE lib2.asm
	END PS

Chú ý : 
a) Tổng các thành phần âm của mảng
   L3:
	mov  dx,[bx]		; dx = a[i]
	and    dx,dx		; Dựng cờ dấu (S=1 thì dx chứa số âm, S=0 thì dx chứa số dương)
	jns     L4		; Nếu giá trị a[i] dương thì nhảy đến L4
	add    ax,[bx]		; còn giá trị a[i] âm thì cộng vào tổng nằm ở ax
   L4:
	add    bx,2		; bx trỏ đến thành phần tiếp theo của mảng a
	loop   L3
b) Tổng các thành phần dương của mảng
   L3:
	mov  dx,[bx]		; dx = a[i]
	and   dx,dx		; Dựng cờ dấu (S=1 thì dx chứa số âm, S=0 thì dx chứa số dương)
	js      L4		; Nếu giá trị a[i] âm thì nhảy
	add   ax,[bx]		; còn giá trị a[i] dương thì cộng vào tổng nằm ở ax
   L4:
	add   bx,2		; bx trỏ đến thành phần tiếp theo của mảng a
	loop  L3

c) Tổng các thành phần chẵn của mảng
   L3:
	mov  dx,[bx]		; dx = a[i]
	shr    dx,1		; Bit thấp nhất vào cờ Carry (C=1-> a[i] là lẻ, C=0 -> a[i] là chẵn)
	jc       L4		; Nếu giá trị a[i] là lẻ thì nhảy đến l4
	add    ax,[bx]		; còn giá trị a[i] là chẵn thì thì cộng vào tổng nằm ở ax
   L4:
	add    bx,2		; bx trỏ đến thành phần tiếp theo của mảng a

d) Tổng các thành phần lẻ của mảng
   L3:
	mov  dx,[bx]		; dx = a[i]
	shr    dx,1		; Bit thấp nhất vào cờ Carry (C=1-> a[i] là lẻ, C=0 -> a[i] là chẵn)
	jnc       L4		; Nếu giá trị a[i] là chẵn thì nhảy đến nhãn L4
	add    ax,[bx]		; còn giá trị a[i] là lẻ thì cộng vào tổng nằm ở ax
   L4:
	add    bx,2		; bx trỏ đến thành phần tiếp theo của mảng a

Bài 5
;---------------------------------------------
; Chia 2 số với số bị chia là nguyên	| 
;     còn số chia là nguyên dương	|
;     ( 2 chữ số sau dấu thập phân)	|
;---------------------------------------------
Khi chương trình chạy yêu cầu có dang :






INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
M1           db 10,13,'Hay vao so bi chia : $'
M2           db 10,13,'Hay vao so chia : $'
M3           db 10,13,'Thuong la : $ '
dautru      db '-$'
daucham  db '.$'
M4           db 10,13,'Co tiep tuc (c/k) ? $'
.CODE
PS:
	mov  ax,@data
	mov  ds,ax
	CLRSCR		; Xóa màn hình
	HienString M1	; Hiện thông báo M1 (‘Hay vao so bi chia : ‘)
	call   VAO_SO_N	; Nhận giá trị số bị chia
	mov  bx,ax		; bx = số bị chia
	HienString M2	; Hiện thông báo M2 (’Hay vao so chia : ‘)
	call   VAO_SO_N	; Nhận giá trị số chia (ax = số chia)
	xchg  ax,bx		; Đổi chéo (ax=số bị chia, bx=số chia)
	HienString M3	; Hiện thông báo M3 (‘Thuong la : ‘)
	and   ax,ax		; Dựng cờ dấu của số bị chia (dấu thương cùng dấu số bị chia)
	jns   CHIA1		; Nếu dấu số bị chia là dương thì nhảy đến nhãn CHIA1
	HienString dautru	; còn nếu số bị chia là âm thì hiện dấu ‘-‘ lên màn hình (dấu âm)
	neg   ax 		; Đổi dấu số bị chia (để thành số nguyên dương)
CHIA1:
	xor   dx,dx		; dx = 0
	div   bx		; dx:ax chia cho bx (ax=thương còn dx=dư)
	call  HIEN_SO_N	; Hiện giá trị của thương lên màn hình
	and  dx,dx		; Dựng cờ của phần dư (Z=1 thì dư=0, còn Z=0 thì dư≠0)
	jz     KT		; Dư bằng 0 thì nhảy đến kết thúc quá trình chia
	HienString daucham ; còn không thì hiện dấu chấm (‘.’) và tiếp tục chia
	mov  cx,2		; Số chữ số sau dấu thập phân
	mov  si,10		; si = 10
CHIA2:
	mov  ax,dx		; Đưa phần dư vào ax
	mul   si		; Nhân phần dư cho 10
	div   bx		; dx:ax chia cho bx
	call  HIEN_SO_N	; Hiện giá trị của thương lên màn hình
	and  dx,dx		; Dựng cờ của phần dư (Z=1 thì dư=0, còn Z=0 thì dư≠0)
	jz     KT		; Phần dư bằng 0 thì nhảy đến kết thúc quá trình chia
	loop CHIA2
    KT:
	HienString M4	; Hiện dòng nhắc M4 (‘Co tiep tuc CT (c/k) ?’)
	mov  ah,1		; Chờ nhận 1 ký tự từ bàn phím
	int     21h
	cmp  al,'c'		; Ký tự vừa nhận có phải là ký tự ‘c’ ?
	jne    Exit		; Nếu không phải thì nhảy đến nhãn Exit (về DOS)
	jmp   PS		; Còn không thì quay về đầu (bắt đầu lại chương trình)
   Exit:
	mov  ah,4ch		; Về DOS
	int     21h
INCLUDE lib2.asm
	END PS

Bài 6
;-----------------------------------------------------------------
; Tổng cấp số cộng khi biết n (số lượng thành phần)	|
;    d (công sai) và u1 (giá trị thành phần đầu tiên)		| 
;-----------------------------------------------------------------
Khi chương trình chạy yêu cầu có dang :






INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
M1  db 10,13,'Hay vao n : $'
M2  db 10,13,'Hay vao d : $'
M3  db 10,13,'Hay vao u1 : $ '
M4  db 10,13,’ Tong cap so cong la : $’      
M5  db 10,13,'Co tiep tuc (c/k) ? $'
.CODE
PS:
	mov  ax,@data
	mov  ds,ax
	CLRSCR		; Xóa màn hình
	HienString M1	; Hiện thông báo M1 (‘Hay vao n : ‘)
	call   VAO_SO_N	; Nhận giá trị n
	mov  cx,ax		; cx = n
	HienString M2	; Hiện thông báo M2 (’Hay vao d : ‘)
	call   VAO_SO_N	; Nhận giá trị d
	mov  bx,ax		; bx = d
	HienString M3	; Hiện thông báo M3 (’Hay vao u1 : ‘)
	call   VAO_SO_N	; Nhận giá trị u1
	mov  dx,ax		; dx = ax = u1 (ax = tổng = u1; dx =ui và lúc đầu bằng u1)
	dec   cx		; Giảm cx đi 1 (n-1)
    L1:
	add   dx,bx		; dx = ui 
	add   ax,dx		; ax  = tổng
	loop  L1
HienString M4	; Hiện thông báo M3 (‘Tong cap so cong la : ‘)
	call  HIEN_SO_N	; Hiện tổng cấp số cộng
	HienString M5	; Hiện dòng nhắc M4 (‘Co tiep tuc CT (c/k) ?’)
	mov  ah,1		; Chờ nhận 1 ký tự từ bàn phím
	int     21h
	cmp  al,'c'		; Ký tự vừa nhận có phải là ký tự ‘c’ ?
	jne    Exit		; Nếu không phải thì nhảy đến nhãn Exit (về DOS)
	jmp   PS		; Còn không thì quay về đầu (bắt đầu lại chương trình)
   Exit:
	mov  ah,4ch		; Về DOS
	int     21h
INCLUDE lib2.asm
	END PS

Bài 7
;-----------------------------------------------------------------
; Tổng cấp số nhân khi biết n (số lượng thành phần)	|
;    q (công bội) và u1 (giá trị thành phần đầu tiên)		| 
;-----------------------------------------------------------------
Khi chương trình chạy yêu cầu có dang :






INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
M1  db 10,13,'Hay vao n : $'
M2  db 10,13,'Hay vao q : $'
M3  db 10,13,'Hay vao u1 : $ '
M4  db 10,13,’ Tong cap so nhan la : $’      
M5  db 10,13,'Co tiep tuc (c/k) ? $'
.CODE
PS:
	mov  ax,@data
	mov  ds,ax
	CLRSCR		; Xóa màn hình
	HienString M1	; Hiện thông báo M1 (‘Hay vao n : ‘)
	call   VAO_SO_N	; Nhận giá trị n
	mov  cx,ax		; cx = n
	HienString M2	; Hiện thông báo M2 (’Hay vao q : ‘)
	call   VAO_SO_N	; Nhận giá trị q
	mov  bx,ax		; bx = q
	HienString M3	; Hiện thông báo M3 (’Hay vao u1 : ‘)
	call   VAO_SO_N	; Nhận giá trị u1
	mov  si,ax		; si = ax = u1 (si = tổng = u1; ax =ui và lúc đầu bằng u1)
	dec   cx		; Giảm cx đi 1 (n-1)
    L1:
	mul   bx		; ax = ax*bx = ui 
	add   si,ax		; si  = tổng
	loop  L1
HienString M4	; Hiện thông báo M3 (‘Tong cap so nhan la : ‘)
mov  ax,si		; Chuyển tổng từ si đến ax
	call  HIEN_SO_N	; Hiện tổng cấp số nhân
	HienString M5	; Hiện dòng nhắc M4 (‘Co tiep tuc CT (c/k) ?’)
	mov  ah,1		; Chờ nhận 1 ký tự từ bàn phím
	int     21h
	cmp  al,'c'		; Ký tự vừa nhận có phải là ký tự ‘c’ ?
	jne    Exit		; Nếu không phải thì nhảy đến nhãn Exit (về DOS)
	jmp   PS		; Còn không thì quay về đầu (bắt đầu lại chương trình)
   Exit:
	mov  ah,4ch		; Về DOS
	int     21h
INCLUDE lib2.asm
	END PS
	
Bài 8
;---------------------------
; Tính biểu thức   |
;---------------------------
Khi chương trình chạy yêu cầu có dang :





INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
M1  db 10,13,'Hay vao N : $'
M2  db 10,13,'Tong tu 1 den $'
M3  db 10,13,' la : $ '
M4  db 10,13,'Co tiep tuc (c/k) ? $'
.CODE
PS:
	mov  ax,@data
	mov  ds,ax
	CLRSCR		; Xóa màn hình
	HienString M1	; Hiện thông báo M1 (‘Hay vao N : ‘)
	call   VAO_SO_N	; Nhận giá trị N
	mov  cx,ax		; cx = N (chỉ số vòng lặp)
	HienString M2	; Hiện thông báo M2 (’Tong tu 1 den ‘)
	call   HIEN_SO_N	; Hiện giá trị N
	HienString M3	; Hiện thông báo M3 (’ la : ‘)
	dec   cx		; Giảm cx đi 1 (n-1)
    L1:
	add  ax,cx		; ax = ax+cx  
	loop  L1
	call  HIEN_SO_N	; Hiện giá trị biểu thức
	HienString M4	; Hiện dòng nhắc M4 (‘Co tiep tuc CT (c/k) ?’)
	mov  ah,1		; Chờ nhận 1 ký tự từ bàn phím
	int     21h
	cmp  al,'c'		; Ký tự vừa nhận có phải là ký tự ‘c’ ?
	jne    Exit		; Nếu không phải thì nhảy đến nhãn Exit (về DOS)
	jmp   PS		; Còn không thì quay về đầu (bắt đầu lại chương trình)
   Exit:
	mov  ah,4ch		; Về DOS
	int     21h
INCLUDE lib2.asm
	END PS


LIÊN KẾT NGÔN NGỮ BẬC CAO VỚI ASSEMBLY

Bài 1
;--------------------------------------------------------------------------
; a lũy thừa n (với a là số nguyên và n là số nguyên dương) |
;--------------------------------------------------------------------------
Phân công nhiệm vụ :
Ngôn ngữ C++ :
Nhận a và n,
Gọi chương trình con tính an do Assembly viết,
Hiện kết quả lên màn hình.
Ngôn ngữ Assembly : Chương trình con tính an

Cách 1: Hàm Assembly không đối (a và n khai báo biến toàn cục)
Tệp C++:
#include <iotream.h>
#include <conio.h>
int a,n;
extern int LT();
void main(void)
{
		clrscr();
		cout<<”\nHay vao a : “; cin>>a;
		cout<<”\nHay vao n : “; cin>>n;
		cout<<”\n”<<a<<” luy thua “<<n<<” la : “<<LT();
		getch();
}
Tệp Assembly:
.MODEL large
.DATA
EXTRN _a:word, _n:word
.CODE
PUBLIC @LT$qv
@LT$qv  PROC
		mov  bx,_a    		; bx = a
		mov  cx,_n		; cx = n
		mov  ax,1		; ax = 1
		and    cx,cx		; Dựng cờ để xét liệu n = 0
		jz       L2		; Nếu n = 0 thì nhảy đến L2
    L1:
		mul   bx		; còn n # 0 thì tiến hành vòng lặp tính an  
		loop  L1
    L2:
		ret
@LT$qv  ENDP
		END
Cách 2: Hàm Assembly có 1 đối (a là tham số thực và n vẫn khai báo biến toàn cục)
Tệp C++:
#include <iotream.h>
#include <conio.h>
int n;
extern int LT(int i1);
void main(void)
{
		int  a;
		clrscr();
		cout<<”\nHay vao a : “; cin>>a;
		cout<<”\nHay vao n : “; cin>>n;
		cout<<”\n”<<a<<” luy thua “<<n<<” la : “<<LT(a);
		getch();
}
Tệp Assembly:
.MODEL large
.DATA
 EXTRN  _n:word
.CODE
PUBLIC @LT$qi
@LT$qi  PROC
		push BP		; Cất giá trị BP hiện thời vào stack
		mov  BP,SP		; BP = SP
		mov  bx,[BP+6]    	; bx = a (lấy giá trị a trong stack đưa vào bx)
		mov  cx,_n		; cx = n
		mov  ax,1		; ax = 1
		and    cx,cx		; Dựng cờ để xét liệu n = 0
		jz       L2		; Nếu n = 0 thì nhảy đến L2
    L1:
		mul   bx		; còn n # 0 thì tiến hành vòng lặp tính an  
		loop  L1
    L2:
		pop   BP		; Hồi phục giá trị của BP
		ret
@LT$qi  ENDP
		END
Cách 3: Hàm Assembly có 2 đối (a và n đều là tham số thực)
Tệp C++:
#include <iotream.h>
#include <conio.h>
extern int LT(int i1, int i2);
void main(void)
{
		int  a,n;
		clrscr();
		cout<<”\nHay vao a : “; cin>>a;
		cout<<”\nHay vao n : “; cin>>n;
		cout<<”\n”<<a<<” luy thua “<<n<<” la : “<<LT(a,n);
		getch();
}
Tệp Assembly:
.MODEL large
.CODE
 PUBLIC @LT$qii
@LT$qii  PROC
		push BP
		mov  BP,SP
		mov  bx,[BP+6]    	; bx = a (lấy giá trị a trong stack đưa vào bx)
		mov  cx,[BP+8]	; cx = n (lấy giá trị n trong stack đưa vào cx)
		mov  ax,1		; ax = 1
		and    cx,cx		; Dựng cờ để xét liệu n = 0
		jz       L2		; Nếu n = 0 thì nhảy đến L2
     L1:
		mul   bx		; còn n # 0 thì tiến hành vòng lặp tính an  
		loop  L1
     L2:
		pop   BP		; Hồi phục giá trị BP
		ret
@LT$qii  ENDP
		END

Bài 2
;----------------------
; n! (n từ 0 đến 7) |
;----------------------
Phân công nhiệm vụ :
Ngôn ngữ C++ :
Nhận n,
Gọi chương trình con tính n! do Assembly viết,
Hiện kết quả lên màn hình.
Ngôn ngữ Assembly : Chương trình con tính n!

Cách 1: Hàm Assembly không đối (n khai báo biến toàn cục)
Tệp C++:
#include <iotream.h>
#include <conio.h>
int n;
extern int GT();
void main(void)
{
		clrscr();
		cout<<”\nHay vao n : “; cin>>n;
		cout<<”\nGiai thua cua ”<<n<<” la : “<<GT();
		getch();
}
Tệp Assembly:
.MODEL large
.DATA
 EXTRN  _n:word
.CODE
 PUBLIC @GT$qv
@GT$qv  PROC
		mov  cx,_n		; cx = n
		mov  ax,1		; ax = 1
		cmp  cx,2		; So sánh n < 0 (tức là n=0 hoặc 1)
		jb       L2		; Nếu n < 0 thì nhảy đến L2
    L1:
		mul   cx		; còn n ≥ 0 thì tiến hành vòng lặp tính n!  
		loop  L1
    L2:
		ret
@GT$qv  ENDP
		END

Cách 2: Hàm Assembly có 1 đối (n là tham số thực)
Tệp C++:
#include <iotream.h>
#include <conio.h>
extern int GT(int i);
void main(void)
{
		int  n;
		clrscr();
		cout<<”\nHay vao n : “; cin>>n;
		cout<<”\nGiai thưa cua ”<<n<<” la : “<<GT(n);
		getch();
}
Tệp Assembly:
.MODEL large
.CODE
 PUBLIC @GT$qi
@GT$qi  PROC
		push BP
		mov  BP,SP
		mov  cx,[BP+6]    	; cx = a (lấy giá trị n trong stack đưa vào cx)
		mov  ax,1		; ax = 1
		cmp  cx,2		; So sánh n < 0 (tức là n=0 hoặc 1)
		jb       L2		; Nếu n < 0 thì nhảy đến L2
    L1:
		mul   cx		; còn n ≥ 0 thì tiến hành vòng lặp tính n!  
		loop  L1
    L2:
		pop   BP		; Hồi phục giá trị BP
		ret
@GT$qi  ENDP
		END

Bài 3
;---------------------------------------
; Trung bình cộng 2 số nguyên |
;---------------------------------------
Phân công nhiệm vụ :
Ngôn ngữ C++ :
Nhận  2 số nguyên,
Gọi chương trình con tính trung bình cộng do Assembly viết,
Hiện kết quả lên màn hình.
Ngôn ngữ Assembly : Chương trình con tính trung bình cộng 2 số nguyên

Cách 1: Hàm Assembly không đối (so1, so2 và flag khai báo biến toàn cục)
Tệp C++:
#include <iotream.h>
#include <conio.h>
int so1,so2,flag=0;
extern int AVERAGE();
void main(void)
{
		clrscr();
		cout<<”\nHay vao so1 : “; cin>>so1;
		cout<<”\nHay vao so2 : “; cin>>so2
		cout<<”\nTrung binh cong 2 so nguyen la : “<<AVERAGE()+0.5*flag;
		getch();
}
Tệp Assembly:
.MODEL large
.DATA
 EXTRN _so1:word,_so2:word,_flag:word
.CODE
 PUBLIC @AVERAGE$qv
@AVERAGE$qv  PROC
		mov  ax,_so1		; ax = so1
		mov  bx,_so2		; ax = so2
		add   ax,bx		; ax = ax + bx (ax = so1 + so2)
		sar    ax,1		; ax = chia đôi làm tròn dưới
		jnc    L1		; Nếu tổng là chẵn (C=0) thì nhảy đến L1
		mov  cx,1		; còn không thì biến cờ flag =1
 	mov  _flag,cx
    L1:
		ret
@AVERAGE$qv  ENDP
		END

Cách 2: Hàm Assembly có 2 đối (giá trị so1,so2 là tham số thực - cất vào stack, còn flag vẫn là biến toàn cục)
Tệp C++:
#include <iotream.h>
#include <conio.h>
int flag=0;
extern int AVERAGE(itn i1, int i2);
void main(void)
{
		int so1,so2;
		clrscr();
		cout<<”\nHay vao so1 : “; cin>>so1;
		cout<<”\nHay vao so2 : “; cin>>so2
		cout<<”\nTrung binh cong 2 so nguyen la : “<<AVERAGE(so1,so2)+0.5*flag;
		getch();
}
Tệp Assembly:
.MODEL large
.DATA
 EXTRN _flag:word
.CODE
 PUBLIC @AVERAGE$qii
@AVERAGE$qii  PROC
		push  BP
		mov  BP,SP
		mov  ax,[BP+6]	; ax = so1
		mov  bx,[BP+8]	; ax = so2
		add   ax,bx		; ax = ax + bx (ax = so1 + so2)
		sar    ax,1		; ax = chia đôi làm tròn dưới
		jnc    L1		; Nếu tổng là chẵn (C=0) thì nhảy đến L1
		mov  cx,1		; còn không thì biến cờ flag =1
 	mov  _flag,cx
    L1:
		pop  BP		; Hồi phục giá trị BP
		ret
@AVERAGE$qii  ENDP
		END

Cách 3: Hàm Assembly có 3 đối (giá trị so1,so2, flag là tham số thực - cất vào stack)
Tệp C++:
#include <iotream.h>
#include <conio.h>
extern int AVERAGE(itn i1, int i2,int far* i3);
void main(void)
{
		int so1,so2,flag=0;
		clrscr();
		cout<<”\nHay vao so1 : “; cin>>so1;
		cout<<”\nHay vao so2 : “; cin>>so2
		cout<<”\nTrung binh cong 2 so nguyen la : “<<AVERAGE(so1,so2,&flag)+0.5*flag;
		getch();
}
Tệp Assembly:
.MODEL large
.CODE
 PUBLIC @AVERAGE$qiini
@AVERAGE$qiini  PROC
		push  BP
		mov  BP,SP
		mov  ax,[BP+6]	; ax = so1
		mov  bx,[BP+8]	; ax = so2
		add   ax,bx		; ax = ax + bx (ax = so1 + so2)
		sar    ax,1		; ax = chia đôi làm tròn dưới
		jnc    L1		; Nếu tổng là chẵn (C=0) thì nhảy đến L1
		mov  cx,1		; còn không thì biến cờ flag =1
		les     bx,[BP+10]	; es:[bx] trỏ đến vùng nhớ chứa biến cờ flag
 	mov  es:[bx],cx
    L1:
		pop  BP		; Hồi phục giá trị BP
		ret
@AVERAGE$qiini  ENDP
		END

Bài 4
;---------------------------------------
; Tính tổng một dãy số nguyên |
;---------------------------------------
Phân công nhiệm vụ :
Ngôn ngữ C++ :
Nhận số lượng thành phần n,
Nhận các số của dãy số đưa vào một mảng,
Gọi chương trình con tính tổng các thành phần của mảng do Assembly viết,
Hiện kết quả lên màn hình.
Ngôn ngữ Assembly : Chương trình con tính tổng các thành phần của mảng.

Cách 1: Hàm Assembly không đối (n và địa chỉ a[0] khai báo biến toàn cục)
Tệp C++:
#include <iotream.h>
#include <conio.h>
int n, a[100];
extern int SUM();
void main(void)
{
		clrscr();
		cout<<”\nHay vao so luong thanh phan : “; cin>>n;
		for (i=0;i<n;i++)
		   {
		     cout<<”\na[“<<i<<”] = “;
		     cin>>a[i];
		cout<<”\nTong cua day so nguyen la : “<<SUM();
		getch();
}
Tệp Assembly:
.MODEL large
.DATA
 EXTRN  _n:word, _a:dword
.CODE
 PUBLIC @SUM$qv
@SUM$qv  PROC
		mov  cx,_n		; cx = n
		mov  ax,SEG _a	; ax = phần địa chỉ segment của a[0]
		mov  es,ax		; es = phần địa chỉ segment của a[0]
		mov  bx,OFSET _a	; bx = phần địa chỉ offset của a[0]
		xor    ax,ax		; ax = tổng và lúc đầu tổng = 0
    L1:
		add   ax.es:[bx]	; ax = ax + a[i] (do es:[bx] trỏ đến)
		add   bx,2  		; bx trỏ đến thành phần tiếp theo của mảng a
		loop  L1
		ret
@SUM$qv  ENDP
		END

Cách 2: Hàm Assembly có 2 đối (n và địa chỉ a[0] là tham số thực của hàm-để vào stack)
Tệp C++:
#include <iotream.h>
#include <conio.h>
extern int SUM(int i1, int far *i2);
void main(void)
{
		int  n,a[100];
		clrscr();
		cout<<”\nHay vao so luong thanh phan : “; cin>>n;
		for (i=0;i<n;i++)
		   {
		     cout<<”\na[“<<i<<”] = “;
		     cin>>a[i];
		cout<<”\nTong cua day so nguyen la : “<<SUM(n,a);
		getch();
}
Tệp Assembly:
.MODEL large
.CODE
 PUBLIC @SUM$qini
@SUM$qini  PROC
		push BP
		mov  BP,SP
		mov  cx,[BP+6]	; cx = n (lấy từ stack)
		les     bx,[BP+8]	; es:[bx] trỏ đến a[0]
		xor    ax,ax		; ax = tổng lúc đầu tổng = 0
    L1:
		add   ax.es:[bx]	; ax = ax + a[i] (do es:[bx] trỏ đến)
		add   bx,2  		; bx trỏ đến thành phần tiếp theo của mảng a
		loop  L1
		pop   BP		; Hồi phục giá trị BP
		ret
@SUM$qini  ENDP
		END

Bài 5
;-----------------------------------------
; Tính biểu thức   |
;-----------------------------------------
Phân công nhiệm vụ :
Ngôn ngữ C++ :
Nhận N,
Gọi chương trình con tính  do Assembly viết,
Hiện kết quả lên màn hình.
Ngôn ngữ Assembly : Chương trình con tính 
Cách 1: Hàm Assembly không đối (N khai báo biến toàn cục)
Tệp C++:
#include <iotream.h>
#include <conio.h>
int N;
extern int TONG();
void main(void)
{
		clrscr();
		cout<<”\nHay vao n : “; cin>>N;
		cout<<”\nTong tu 1 den “<<N<<” la : “<<TONG();
		getch();
}
Tệp Assembly:
.MODEL large
.DATA
 EXTRN  _N:word
.CODE
 PUBLIC @TONG$qv
@TONG$qv  PROC
		mov  cx,_N		; cx = N
		mov  ax,cx		; ax = N
		dec    cx		; cx= N-1
    L1:
		add   ax,cx		; ax = tổng   
		loop  L1
    L2:
		ret
@TONG$qv  ENDP
		END

Cách 2: Hàm Assembly có 1 đối (N là tham số thực)
Tệp C++:
#include <iotream.h>
#include <conio.h>
extern int TONG(int i);
void main(void)
{
		int  N;
		clrscr();
		cout<<”\nHay vao N : “; cin>>N;
		cout<<”\nTong tu 1 den ”<<N<<” la : “<<TONG(N);
		getch();
}
Tệp Assembly:
.MODEL large
.CODE
 PUBLIC @TONG$qi
@TONG$qi  PROC
		push BP
		mov  BP,SP
		mov  cx,[BP+6]    	; cx = a (lấy giá trị n trong stack đưa vào cx)
		mov  ax,cx		; ax = N
		dec    cx		; cx= N-1
    L1:
		add    ax,cx		; ax = tổng   
		loop   L1
    L2:
		pop    BP		; Hồi phục giá trị BP
		ret
@TONG$qi  ENDP
		END

Bài 6
;-----------------------------------------------------------------
; Tổng cấp số cộng khi biết n (số lượng thành phần)	|
;    d (công sai) và u1 (giá trị thành phần đầu tiên)		| 
;-----------------------------------------------------------------
Phân công nhiệm vụ :
Ngôn ngữ C++ :
Nhận n,d và u1,
Gọi chương trình con tính tổng cấp số cộng do Assembly viết,
Hiện kết quả lên màn hình.
Ngôn ngữ Assembly : Chương trình con tính tổng cấp số cộng

Cách 1: Hàm Assembly không đối (n,d và u1 khai báo biến toàn cục)
Tệp C++:
#include <iotream.h>
#include <conio.h>
int n,d,u1;
extern int CSC();
void main(void)
{
		clrscr();
		cout<<”\nHay vao n : “; cin>>n;
		cout<<”\nHay vao d : “; cin>>d;
		cout<<”\nHay vao u1 : “; cin>>u1;
		cout<<”\nTong cap so cong la : “<<CSC();
		getch();
}
Tệp Assembly:
.MODEL large
.DATA
 EXTRN _n:word, _d:word,_u1:word
.CODE
 PUBLIC @CSC$qv
@CSC$qv  PROC
		mov  cx,_n    		; cx = n
		mov  bx,_d		; bx = d
		mov  ax,_u1		; ax = u1
		mov  dx,ax		; dx = u1
		dec    cx		; cx = n-1
    L1:
		add   dx,bx		; dx = ui  
		add   ax,dx		; ax = (tổng các thành phần từ u1 đến ui-1) + ui
		loop  L1
		ret
@CSC$qv  ENDP
		END

Cách 2: Hàm Assembly có 1 đối (n là tham số thực - cất vào stack, còn d,u1 vẫn là biến toàn cục)
Tệp C++:
#include <iotream.h>
#include <conio.h>
int d,u1;
extern int CSC(int i1);
void main(void)
{
		int  n;
		clrscr();
		cout<<”\nHay vao n : “; cin>>n;
		cout<<”\nHay vao d : “; cin>>d;
		cout<<”\nHay vao u1 : “; cin>>u1;
		cout<<”\nTong cap so cong la : “<<CSC(n);
		getch();
}
Tệp Assembly:
.MODEL large
.DATA
 EXTRN _d:word, _u1:word
.CODE
 PUBLIC @CSC$qi
@CSC$qi  PROC
		push BP
		mov  BP,SP
		mov  cx,[BP+6]	; cx = n (lấy giá trị n từ stack)
		mov  bx,_d		; bx = d
		mov  ax,_u1		; ax = u1
		mov  dx,ax		; dx = u1
		dec    cx		; cx = n-1
    L1:
		add   dx,bx		; dx = ui  
		add   ax,dx		; ax = (tổng các thành phần từ u1 đến ui-1) + ui
		loop  L1
		pop   BP		; Hồi phục giá trị của BP
		ret
@CSC$qi  ENDP
		END

Cách 3: Hàm Assembly có 2 đối (n, d là tham số thực - cất vào satck, còn  u1 vẫn là biến toàn cục)
Tệp C++:
#include <iotream.h>
#include <conio.h>
int u1;
extern int CSC(int i1,int i2);
void main(void)
{
 	int n,d;
		clrscr();
		cout<<”\nHay vao n : “; cin>>n;
		cout<<”\nHay vao d : “; cin>>d;
		cout<<”\nHay vao u1 : “; cin>>u1;
		cout<<”\nTong cap so cong la : “<<CSC(n,d);
		getch();
}
Tệp Assembly:
.MODEL large
.DATA
 EXTRN  _u1:word
.CODE
 PUBLIC @CSC$qii
@CSC$qii  PROC
		push BP
		mov  BP,SP
		mov  cx,[BP+6]	; cx = n (lấy giá trị n từ stack)
		mov  bx,[BP+8]	; bx = d (lấy giá trị d từ stack)
		mov  ax,_u1		; ax = u1
		mov  dx,ax		; dx = u1
		dec    cx		; cx = n-1
    L1:
		add   dx,bx		; dx = ui  
		add   ax,dx		; ax = (tổng các thành phần từ u1 đến ui-1) + ui
		loop  L1
		pop   BP		; Hồi phục giá trị BP
		ret
@CSC$qii  ENDP
		END

Cách 4: Hàm Assembly có 3 đối (n, d và u1 đều là tham số thực - cất vào satck)
Tệp C++:
#include <iotream.h>
#include <conio.h>
extern int CSC(int i1,int i2,int i3);
void main(void)
{
		int n,d,u1;
		clrscr();
		cout<<”\nHay vao n : “; cin>>n;
		cout<<”\nHay vao d : “; cin>>d;
		cout<<”\nHay vao u1 : “; cin>>u1;
		cout<<”\nTong cap so cong la : “<<CSC(n,d,u1);
		getch();
}
Tệp Assembly:
.MODEL large
.CODE
 PUBLIC @CSC$qiii
@CSC$qiii  PROC
		push BP
		mov  BP,SP
		mov  cx,[BP+6]	; cx = n (lấy giá trị n từ stack)
		mov  bx,[BP+8]	; bx = d (lấy giá trị d từ stack)
		mov  ax,[BP+10]	; ax = u1 (lấy từ stack)
		mov  dx,ax		; dx = u1
		dec    cx		; cx = n-1
    L1:
		add   dx,bx		; dx = ui  
		add   ax,dx		; ax = (tổng các thành phần từ u1 đến ui-1) + ui
		loop  L1
		pop   BP		; Hồi phục giá trị BP
		ret
@CSC$qiii  ENDP

Bài 7
;-----------------------------------------------------------------
; Tổng cấp số nhân khi biết n (số lượng thành phần)	|
;    q (công bội) và u1 (giá trị thành phần đầu tiên)		| 
;-----------------------------------------------------------------
Phân công nhiệm vụ :
Ngôn ngữ C++ :
Nhận n,q và u1,
Gọi chương trình con tính tổng cấp số nhân do Assembly viết,
Hiện kết quả lên màn hình.
Ngôn ngữ Assembly : Chương trình con tính tổng cấp số nhân

Cách 1: Hàm Assembly không đối (n,q và u1 khai báo biến toàn cục)
Tệp C++:
#include <iotream.h>
#include <conio.h>
int n,q,u1;
extern int CSN();
void main(void)
{
		clrscr();
		cout<<”\nHay vao n : “; cin>>n;
		cout<<”\nHay vao q : “; cin>>q;
		cout<<”\nHay vao u1 : “; cin>>u1;
		cout<<”\nTong cap so cong la : “<<CSN();
		getch();
}
Tệp Assembly:
.MODEL large
.DATA
 EXTRN _n:word, _q:word,_u1:word
.CODE
 PUBLIC @CSN$qv
@CSN$qv  PROC
		mov  cx,_n    		; cx = n
		mov  bx,_q		; bx = q
		mov  ax,_u1		; ax = u1
		mov  si,ax		; si = u1
		dec    cx		; cx = n-1
    L1:
		mul   bx		; ax = ui *q 
		add   si,ax		; si = (tổng các thành phần từ u1 đến ui-1) + ui
		loop  L1
		mov  ax,si		; Đưa giá trị tổng có ở si vào ax
		ret
@CSN$qv  ENDP
		END

Cách 2: Hàm Assembly có 1 đối (n là tham số thực - cất vào stack, còn q và u1 vẫn là biến toàn cục)
Tệp C++:
#include <iotream.h>
#include <conio.h>
int q,u1;
extern int CSN(int i1);
void main(void)
{
		int n;
		clrscr();
		cout<<”\nHay vao n : “; cin>>n;
		cout<<”\nHay vao d : “; cin>>d;
		cout<<”\nHay vao u1 : “; cin>>u1;
		cout<<”\nTong cap so cong la : “<<CSN(n);
		getch();
}
Tệp Assembly:
.MODEL large
.DATA
 EXTRN _q:word,_u1:word
.CODE
 PUBLIC @CSN$qi
@CSN$qi  PROC
		push BP
		mov  BP,SP
		mov  cx,[BP+6]	; cx = n (lấy giá trị n từ stack)
		mov  bx,_q		; bx = q 
		mov  ax,_u1		; ax = u1
		mov  si,ax		; si = u1
		dec    cx		; cx = n-1
    L1:
		mul   bx		; ax = ui *q 
		add   si,ax		; si = (tổng các thành phần từ u1 đến ui-1) + ui
		loop  L1
		mov  ax,si		; ax = giá trị tổng
		pop   BP		; Hồi phục giá trị BP
		ret
@CSN$qi  ENDP
		END

Cách 3: Hàm Assembly có 2 đối (n, q là tham số thực - cất vào satck, còn  u1 vẫn là biến toàn cục)
Tệp C++:
#include <iotream.h>
#include <conio.h>
int u1;
extern int CSN(int i1,int i2);
void main(void)
{
		int  n,q;
		clrscr();
		cout<<”\nHay vao n : “; cin>>n;
		cout<<”\nHay vao d : “; cin>>d;
		cout<<”\nHay vao u1 : “; cin>>u1;
		cout<<”\nTong cap so cong la : “<<CSN(n,q);
		getch();
}
Tệp Assembly:
.MODEL large
.DATA
 EXTRN  _u1:word
.CODE
 PUBLIC @CSN$qii
@CSN$qii  PROC
		push BP
		mov  BP,SP
		mov  cx,[BP+6]	; cx = n (lấy giá trị n từ stack)
		mov  bx,[BP+8]	; bx = q (lấy giá trị d từ stack)
		mov  ax,_u1		; ax = u1
		mov  si,ax		; si = u1
		dec    cx		; cx = n-1
    L1:
		mul   bx		; ax = ui *q 
		add   si,ax		; si = (tổng các thành phần từ u1 đến ui-1) + ui
		loop  L1
		mov  ax,si		; ax = giá trị tổng
		pop   BP		; Hồi phục giá trị BP
		ret
@CSN$qii  ENDP
		END

Cách 4: Hàm Assembly có 3 đối (n, q và u1 đều là tham số thực - cất vào satck)
Tệp C++:
#include <iotream.h>
#include <conio.h>
extern int CSN(int i1,int i2,int i3);
void main(void)
{
		int n,q,u1;
		clrscr();
		cout<<”\nHay vao n : “; cin>>n;
		cout<<”\nHay vao q : “; cin>>d;
		cout<<”\nHay vao u1 : “; cin>>u1;
		cout<<”\nTong cap so cong la : “<<CSN(n,q,u1);
		getch();
}
Tệp Assembly:
.MODEL large
.CODE
 PUBLIC @CSN$qiii
@CSN$qiii  PROC
		push BP
		mov  BP,SP
		mov  cx,[BP+6]	; cx = n (lấy giá trị n từ stack)
		mov  bx,[BP+8]	; bx = q (lấy giá trị q từ stack)
		mov  ax,[BP+10]	; ax = u1 (lấy từ stack)
		mov  si,ax		; si = u1
		dec    cx		; cx = n-1
    L1:
		mul   bx		; ax = ui  
		add   si,ax		; si = (tổng các thành phần từ u1 đến ui-1) + ui
		loop  L1
		mov  ax,si		; ax = tổng cấp số nhân
		pop   BP		; Hồi phục giá trị BP
		ret
@CSN$qiii  ENDP
		END
		
		
		

CÁC BÀI TẬP LẬP TRÌNH HỆ THỐNG

Bài 1
Hãy viết chương trình cho biết máy tính bạn đang dùng có ổ mềm nào hay không? Nếu có thì bao nhiêu ổ?
Cách giải : Chú ý byte của có địa chỉ 0:410h của vùng dữ liệu ROM BIOS có chứa các thông tin liên quan đến thông tin về ổ đĩa mềm, cụ thể như sau :



Khi chương trình chạy yêu cầu có dạng :



INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 M1      db ’May tinh dang dung co o mem không ? $’
 co        db ‘Co $’
 khong  db ‘ Khong $’
 M2      db 13,10,’So luong o mem ma may tinh co la : $’
.CODE
 PS:
		mov  ax,@data
mov  ds,ax
CLRSCR
HienString M1	; Hiện thông báo (‘May tinh dang dung co o mem khong ?’)
int    11h		; Ngắt hệ thống thực hiện việc đưa nội dung ô nhớ 0:410h -> al
shr    al,1 		; Đưa bit thấp nhất vào bit cờ Carry
jc      L1		; Nếu bit cờ Carry=1 thì nhảy đến L1
HienString khong	; còn khômg thì hiện thông báo ‘Khong’
jmp  Exit		; Nhảy đến nhãn Exit
    L1:
	HienString co	; Hiện thông báo ‘Co’
	HienString M2	; Hiện thông báo ‘So luong o mem ma may tinh co la : ‘
      mov cl,5		; Chuyển 2 bit (số lượng ổ mềm -1) sang phải 5 lần
      shr   al,cl
	inc    al		; al = số lượng ổ mềm
	add   al,30h		; al là mã ASCII số lượng ổ mềm
	mov  ah,0eh		; Chức năng hiện 1 ký tự ASCII lên màn hình
	int     10h
  Exit:
			mov  ah,1		; Chờ 1 ký tự từ bàn phím
int    21h
mov  ah,4ch		; Về DOS
			int   21h
	END  PS

Bài 2
Hãy viết chương trình cho biết máy tính bạn đang dùng có cổng COM nào hay không? Nếu có thì bao nhiêu cổng và cho biết địa chỉ các cổng đó (địa chỉ cổng phải là HEXA).
Cách giải : Chú ý byte của có địa chỉ 0:411h của vùng dữ liệu ROM BIOS có chứa các thông tin liên quan đến thông tin về số lượng cổng COM mà máy tính đang dùng có, cụ thể như sau:









x
x
x








Chú ý : Địa chỉ COM1 có trong 2 byte có địa chỉ 0:400h và 0:401h
		 Địa chỉ COM2 có trong 2 byte có địa chỉ 0:402h và 0:403h
		 ….
Khi chương trình chạy yêu cầu có dạng :





INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 M1      db ’May tinh dang dung co cong COM không ? $’
 co        db ‘Co $’
 khong  db ‘ Khong $’
 M2      db 13,10,’So luong cong COM ma may tinh co la : $’
 M4      db 13,10,’Dia chi cac cong COM la : $’
 space   db ‘   $’
.CODE
 PS:
		mov  ax,@data
mov  ds,ax
CLRSCR
HienString M1	; Hiện thông báo ‘May tinh dang dung co cong COM khong ?’
int    11h		; Ngắt hệ thống thực hiện việc đưa nội dung ô nhớ 0:411h -> ah
mov  al,ah		; Đưa nội dung 0:411h -> al
and   al,00001110b	; Tách 3 bit chứa số lượng cổng COM
shr    al,1 		; al = số lượng cổng COM
jnz    L1		; Nếu al # 0 (có cổng COM thì nhảy)
HienString khong	; còn không thì hiện thông báo ‘Khong’
jmp  Exit		; Nhảy đến nhãn Exit
    L1:
	HienString co	; Hiện thông báo ‘Co’
	mov   cl,al		
	xor    ch,ch		; cx = số lượng cổng COM (chỉ số vòng lặp hiện địa chỉ)
	HienString M2	; Hiện thông báo ‘So luong cong COM ma may tinh co la : ‘
	add    al,30h		; al là mã ASCII số lượng cổng COM
	mov  ah,0eh		; Chức năng hiện 1 ký tự ASCII lên màn hình
	int     10h
	HienString M3	; Hiện thông báo ‘Dia chi cac cong COM la : ‘
	xor    ax,ax
	mov  es,ax
	lea    bx,400h		; es:bx = 0:400h (nơi chứa địa chỉ cổng COM1)
L2:
	mov  ax,es:[bx]	; ax = địa chỉ COM
	call   HIEN_HEXA	; Hiện địa chỉ dạng HEXA lên màn hình
	HienString space	; Hiên một số dấu cách
	add   bx,2		; bx trỏ đến các byte chứa địa chỉ cổng COM tiếp theo
	loop  L2
  Exit:
			mov  ah,1		; Chờ 1 ký tự từ bàn phím
int    21h
			mov  ah,4ch		; Về DOS
			int     21h
INCLUDE lib2.asm		; lib2.asm chứa chương trình con HIEN_HEXA
			END  PS

	
Bài 3
Hãy viết chương trình cho biết máy tính bạn đang dùng có cổng LPT nào hay không? Nếu có thì bao nhiêu cổng và cho biết địa chỉ các cổng đó (địa chỉ cổng phải là HEXA).
Cách giải : Chú ý byte của có địa chỉ 0:411h của vùng dữ liệu ROM BIOS có chứa các thông tin liên quan đến thông tin về số lượng cổng LPT mà máy tính đang dùng có, cụ thể như sau:

x
x


















Chú ý : Địa chỉ LPT1 có trong 2 byte có địa chỉ 0:408h và 0:409h
		 Địa chỉ LPT2 có trong 2 byte có địa chỉ 0:40ah và 0:40bh
		 ….
Khi chương trình chạy yêu cầu có dạng :





Chú ý : Giống bài 2
INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 M1      db ’May tinh dang dung co cong LPT không ? $’
 co        db ‘Co $’
 khong  db ‘ Khong $’
 M2      db 13,10,’So luong cong LPT ma may tinh co la : $’
 M4      db 13,10,’Dia chi cac cong LPT la : $’
 space   db ‘   $’
.CODE
 PS:
		mov  ax,@data
mov  ds,ax
CLRSCR
HienString M1	; Hiện thông báo ‘May tinh dang dung co cong LPT khong ?’
int     11h		; Ngắt hệ thống thực hiện việc đưa nội dung ô nhớ 0:411h -> ah
mov  al,ah		; Đưa nội dung 0:411h -> al
mov  cl,6
shr    al,cl		; al = số lượng cổng LPT
jnz    L1		; Nếu al # 0 (có cổng LPT thì nhảy)
HienString khong	; còn không thì hiện thông báo ‘Khong’
jmp  Exit		; Nhảy đến nhãn Exit
    L1:
	HienString co	; Hiện thông báo ‘Co’
	mov  cl,al		
	xor    ch,ch		; cx = số lượng cổng LPT (chỉ số vòng lặp hiện địa chỉ)
	HienString M2	; Hiện thông báo ‘So luong cong LPT ma may tinh co la : ‘
	add   al,30h		; al là mã ASCII số lượng cổng LPT
	mov  ah,0eh		; Chức năng hiện 1 ký tự ASCII lên màn hình
	int     10h
	HienString M3	; Hiện thông báo ‘Dia chi cac cong LPT la : ‘
	xor     ax,ax
	mov   es,ax
	mov   bx,408h	; es:bx = 0:408h (nơi chứa địa chỉ cổng LPT1)
L2:
	mov  ax,es:[bx]	; ax = địa chỉ LPT
	call   HIEN_HEXA	; Hiện địa chỉ dạng HEXA lên màn hình
	HienString space	; Hiên một số dấu cách
	add   bx,2		; bx trỏ đến các byte chứa địa chỉ cổng COM tiếp theo
	loop  L2
  Exit:
			mov  ah,1		; Chờ 1 ký tự từ bàn phím
			int    21h
			mov  ah,4ch		; Về DOS
			int     21h
INCLUDE lib2.asm		; lib2.asm chứa chương trình con HIEN_HEXA
			END  PS
Bài 4
Hãy viết chương trình cho biết máy tính bạn đang dùng có card điều khiển màn hình loại gì (mono hay color)?
Cách giải : Chú ý byte của có địa chỉ 0:410h của vùng dữ liệu ROM BIOS có chứa các thông tin liên quan đến loại card điều khiển màn hình, cụ thể như sau :





x
x











Khi chương trình chạy yêu cầu có dạng :



INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 M1      db ’Loai card dieu khien man hinh ma may tinh co la : $’
 color   db ‘Color $’
 mono  db ‘Mono $’
.CODE
 PS:
		mov  ax,@data
mov  ds,ax
CLRSCR
HienString M1	; Hiện ‘Loai card dieu khien man hinh ma may tinh co la :’
int     11h		; Ngắt hệ thống thực hiện việc đưa nội dung ô nhớ 0:410h -> al
and    al,00110000b	; Tách 2 bit có thông tin liên quan đến loại card đ/k màn hình
cmp   al,00110000b	; Liệu có phải loại card điều khiển màn hình là mono?
jne     L1		; Không phải là card mono thì nhảy đến L1
HienString mono	; còn phải thì hiện thông báo ‘Mono’
jmp   Exit		; Nhảy đến nhãn Exit
    L1:
	HienString color	; Hiện thông báo ‘Color’
  Exit:
			mov  ah,1		; Chờ 1 ký tự từ bàn phím
int    21h
			mov  ah,4ch		; Về DOS
			int     21h
			END  PS

Bài 5
Hãy viết chương trình cho phép tạo lập một thư mục.
Cách giải : Sử dụng chức năng 39h của ngắt int 21h.
Khi chương trình chạy yêu cầu có dạng :




INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
tm db  13,10, 'Hay vao ten thu muc can tao : $'
Err_MD db 13,10, 'Khong tao duoc thu muc: $'
Suc_MD db 13,10, 'Thu muc da duoc tao: $'
tieptuc  db 13,10, 'Co tiep tuc CT (c/k) ? $'
buff  db 30
        db ?
file_name   db 30 dup(?)
.CODE
 PS:
		mov  ax,@data
mov  ds,ax
   L_TM0:
CLRSCR
HienString  tm	; Hiện thông báo tm
            lea    dx,buff            ; Vào tên thư mục cần tạo
            call  GET_FILE_NAME              
           lea    dx,file_name    ; Chức năng tạo thư mục
           mov  ah,39h
           int    21h
           jnc L_TM1                ; Nếu bit cờ CF=0 thì nhảy đến L_TM1,
           Hienstring  Err_MD  ; còn CF=1 thì hiện thông báo lỗi
           jmp EXIT_TM
   L_TM1:
          Hienstring  Suc_MD   ; Hiện thông báo thành công
   Exit_TM:
          Hienstring tieptuc       ; Hiện thông báo tieptuc
          mov  ah,1                    ; Chò 1 ký tự từ bàn phím
          int     21h                          
           cmp   al,'c'                 ; Ký tự vào có phải 'c'
           jne    Thoat_TM        ; Không phải 'c' thì nhảy đế Thoat_TM,
           jmp    L_TM0	 ; còn đúng là 'c' thì nhảy về L_TM0
   Thoat_TM:                     
			mov  ah,4ch		; Về DOS
			int     21h
INCLUDE lib3.asm		; lib3.asm chứa CT con GET_DIR_NAME
			END  PS


Chú ý: Xóa thư mục và chuyển thư mục giống bài tập trên chỉ cần thay chức năng 39h bằng chức năng 3ah (xóa thư mục) hoăc 3bh (chuyển thư muc).

Bài 6
Hãy viết chương trình copy 1 tệp.
Cách giải : 
Vào tên tệp cần copy đi (gọi CT con GET_FILE_NAME)
Mở tệp đã có để đọc (CN 3dh của ngắt 21h với AL=0 – để đọc)
Vào tên tệp cần copy đến (gọi CT con GET_FILE_NAME)
Tạo tệp mới và mở (CN 3ch của ngắt int 21h)
Đọc 512 byte (1 sector) từ tệp copy đi để vào vùng nhớ đệm (CN 3f của ngắt int 21h)
(AX (chứa số lượng byte thực tế đã đọc) :
Nếu AX≠0 thì ghi dữ liệu đọc được từ vùng nhớ đệm vào tệp cần copy đến (CN 40h của ngắt int 21h), sau đó quay lại 5. (đọc các 512 byte tiếp theo của tệp copy đi)
Nếu AX=0 (hết tệp) thì nhảy đến Bước 6.
Đóng 2 tệp (CN 3eh của ngắt int 21h)
Chú ý: Khi thực hiện các chức năng của tệp nếu có lỗi thì hiện thông báo sau đó kết thức, còn nếu mọi chức năng đều thực hiện tốt thì tiếp tục chương trình cho đến khi kết thúc (về DOS).
Khi chương trình chạy yêu cầu có dạng :






INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 ct1            db  13,10,’ Hay vao ten tep can copy di : $’
 ct2	       db 13,10,’ Hay vao ten tep can copy den : $’ 
 Err_O       db 13,10,’ Khong mo duoc tep !$’
 Err_R       db 13,10,’ Khong doc duoc tep !$’
 Err_W      db 13,10,’ Khong ghi duoc tep !$’
 Err_C       db 13,10,’ Khong dong duoc tep !$’
 buff             db 30
		          db ?
 file_name   db 30 dup(?)
 the_tep1   dw   ?
 the_tep2   dw   ?
 dem          db     512 dup(?)
 tieptuc      db 1310,’ Co tiep tuc CT (c/k) ? $’
.CODE
 PS:
		mov  ax,@data
mov  ds,ax
   L_CT0:
           CLRSCR
           HienString ct1	; Hiện thông báo ct1		
           lea    dx,buff	
           call   GET_FILE_NAME ; Vào tên tệp cần copy đi       
           lea    dx,file_name	; Mở tệp đã có để đọc
           mov  al,0
           mov  ah,3dh               
           int     21h
           jnc     L_CT1
           HienString  Err_O	; Hiện thông báo Err_O nếu mở tệp bị lỗi (CF=1)
           jmp   Exit_CT
    L_CT1:
           mov  the_tep1,ax	; Nếu mở tệp tốt thì đưa thẻ tệp có trong AX -> biến thetep1
           HienString  ct2
           lea    dx,buff
           call   GET_FILE_NAME ; Vào tên tệp cần copy đến
           lea    dx,file_name	; Tạo tệp mới và mở
           mov  cx,0		; Không đặt thuộc tính nào cho tệp
           mov  ah,3ch              
           int    21h
           jnc   L_CT2
           HienString  Err_O	; Hiện thông báo Err_O nếu tạo và mở tệp bị lỗi (CF=1)
           jmp DONG_TEP1
    L_CT2:
           mov  the_tep2,ax     ; Nếu mở tệp tốt thì đưa thẻ tệp có trong AX -> biến thetep2     
    L_CT3:
           mov  bx,the_tep1	; Đọc 512 byte từ tệp copy đi -> vùng nhớ dem
           mov  cx,512        
           lea    dx,dem
           mov  ah,3fh
           int    21h
           jnc    L_CT4
           HienString Err_R	; Hiện thông báo Err_R nếu đọc tệp bị lỗi (CF=1)
           jmp  DONG_TEP2
    L_CT4:
          and   ax,ax		; Số lượng byte thực tế đã đọc được bằng 0?
          jz      DONG_TEP1	; Đúng băng 0 (hết tệp) thì nhảy đến đóng các tệp và kết thúc,
          mov  bx,the_tep2	; còn không bằng 0 thì tiến hành ghi tệp
          mov  cx,ax		; Đưa số lượng byte đọc được vào CX
          lea    dx,dem		; Trỏ đến vùng đệm chứa số liệu cần ghi
          mov  ah,40h		; Chức năng ghi tệp
          int     21h
          jnc    L_CT5
          HienString Err_W	; Hiện thông báo Err_W nếu không ghi được tệp (CF=1),
          jmp  DONG_TEP2
    L_CT5:
          jmp  L_CT4		; Ghi tệp tốt thì nhảy về tiếp tục đọc và ghi
    DONG_TEP2:
          mov  bx,the_tep2	; Chức năng đóng tệp
          mov  ah,3eh
          int     21h
          jnc    DONG_TEP1
          HienString Err_C  	; Hiện thông báo Err_C nếu không đóng được tệp (CF=1)
    DONG_TEP1:
          mov  bx,the_tep1	; Chức năng đóng tệp
          mov  ah,3eh
          int    21h
          jnc    Exit_CT
          HienString Err_C
    Exit_CT:
          Hienstring tieptuc      ; Hiện thông báo tieptuc
          mov  ah,1                   ; Chờ 1 ký tự từ bàn phím
          int     21h                         
          cmp   al,'c'                 ; Ký tự vào có phải 'c'
          jne    Thoat_CT         ; Không phải 'c' thì nhảy đế Thoat_CT,
          jmp    L_CT0		; còn đúng là 'c' thì nhảy về L_CT0
   Thoat_CT:                     
			mov  ah,4ch		; Về DOS
			int     21h
INCLUDE lib3.asm		; lib3.asm chứa CT con GET_FILE_NAME
			END  PS

Bài 7
Hãy viết chương trình thay cho lệnh type|more của DOS (hiện nội dung tệp dạng ASCII lên màn hình).
Cách giải : Giống bài 6 chỉ khác là thay vì ghi vào tệp cần copy đến thì đưa ra màn hình (ghi tệp với thẻ tệp bằng 1)
Vào tên tệp cần hiện (gọi CT con GET_FILE_NAME)
Mở tệp đã có để đọc (CN 3dh của ngắt 21h với AL=0 – để đọc)
Đọc 512 byte (1 sector) từ tệp copy đi để vào vùng nhớ đệm (CN 3f của ngắt int 21h)
(AX (chứa số lượng byte thực tế đã đọc) :
Nếu AX≠0 thì ghi dữ liệu đọc được từ vùng nhớ đệm vào tệp cần copy đến (CN 40h của ngắt int 21h với BX=1-thẻ tệp), sau đó quay lại 5. (đọc các 512 byte tiếp theo của tệp copy đi)
Nếu AX=0 (hết tệp) thì nhảy đến Bước 4.
Đóng  tệp (CN 3eh của ngắt int 21h)
Chú ý: Khi thực hiện các chức năng của tệp nếu có lỗi thì hiện thông báo sau đó kết thức, còn nếu mọi chức năng đều thực hiện tốt thì tiếp tục chương trình cho đến khi kết thúc.
Khi chương trình chạy yêu cầu có dạng :






INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 hx             db  13,10,’ Hay vao ten tep can hien : $’
 Err_O       db  13,10,’ Khong mo duoc tep !$’
 Err_R       db  13,10,’ Khong doc duoc tep !$’
 Err_W      db  13,10,’ Khong ghi duoc tep !$’
 Err_C       db  13,10,’ Khong dong duoc tep !$’
 buff             db 30
		          db ?
 file_name   db 30 dup(?)
 the_tep   dw   ?
dem         db   512 dup(?)
more        db   13,10,’ More …$’
 tieptuc    db 1310,’ Co tiep tuc CT (c/k) ? $’
.CODE
 PS:
		mov  ax,@data
mov  ds,ax
   L_CT0:
           CLRSCR
           HienString hx	; Hiện thông báo hx		
           lea    dx,buff	
           call   GET_FILE_NAME ; Vào tên tệp cần copy đi       
           lea    dx,file_name	; Mở tệp đã có để đọc
           mov  al,0
           mov  ah,3dh               
           int     21h
           jnc    L_CT1		; Mở tệp tốt (CF=0) thì nhảy,
           HienString  Err_O	; còn có lỗi (CF=1) thì hiện thông báo Err_O
           jmp   Exit_CT
    L_CT1:
           mov  the_tep,ax	; Nếu mở tệp tốt thì đưa thẻ tệp có trong AX -> biến the_tep
    L_CT2:
           mov  bx,the_tep	; Đọc 512 byte từ tệp copy đi -> vùng nhớ dem
           mov  cx,512        
           lea    dx,dem
           mov  ah,3fh
           int     21h
           jnc    L_CT3
           HienString Err_R	; Hiện thông báo Err_R nếu đọc tệp bị lỗi (CF=1)
           jmp  DONG_TEP
    L_CT3:
          and   ax,ax		; Số lượng byte thực tế đã đọc được bằng 0?
          jz      DONG_TEP	; Đúng bằng 0 (hết tệp) thì nhảy đến đóng các tệp và kết thúc,
          mov  bx,1		; còn không bằng 0 thì tiến hành đưa ra màn hình với thẻ têp=1
          mov  cx,ax		; Đưa số lượng byte đọc được vào CX
          lea    dx,dem		; Trỏ đến vùng đệm chứa số liệu cần đưa ra màn hình
          mov  ah,40h		; Chức năng hiện (ghi tệp với thẻ tệp bằng 1)
          int     21h
          jnc    L_CT4		; Ghi tệp tốt nhì nhảy
          HienString Err_W	; Hiện thông báo Err_W nếu không ghi được tệp (CF=1),
          jmp  DONG_TEP
    L_CT:
	         HienString more	; Hiện chữ More… lên màn hình
         mov  ah,1		; Chờ 1 ký tự từ bàn phím
         int     21h
         jmp  L_CT2		; Nhảy về tiếp tục đọc và hiện
    DONG_TEP:
          mov  bx,the_tep	; Chức năng đóng tệp
          mov  ah,3eh
          int     21h
          jnc    Exit_CT
          HienString Err_C
    Exit_CT:
          Hienstring tieptuc      ; Hiện thông báo tieptuc
          mov  ah,1                   ; Chờ 1 ký tự từ bàn phím
          int     21h                         
          cmp   al,'c'                 ; Ký tự vào có phải 'c'
          jne    Thoat_CT         ; Không phải 'c' thì nhảy đế Thoat_CT,
          jmp    L_CT0		; còn đúng là 'c' thì nhảy về L_CT0
   Thoat_CT:                     
			mov  ah,4ch		; Về DOS
			int     21h
INCLUDE lib3.asm		; lib3.asm chứa CT con GET_FILE_NAME
			END  PS

Bài 8
Hãy viết chương trình đổi tên một tệp.
Cách giải : Sử dụng chức năng 56h của ngắt int 21h.
Khi chương trình chạy yêu cầu có dạng :






INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 dt1               db 13,10,’ Hay vao ten tep cu : $’
 dt2               db 13,10,’ Hay vao ten tep moi : $’	
 Err_REN     db 13,10,’ Khong doi duoc ten tep$’
 Suc_REN    db 13,10,’ Tep da duoc doi ten$’
buffc            db 30
		         db ?
 file_namec  db 30 dup(?)
 buffm          db 30
		          db ?
 file_namem db 30 dup(?)
tieptuc      db 1310,’ Co tiep tuc CT (c/k) ? $’
.CODE
 PS:
		mov  ax,@data
mov  ds,ax
   L_REN0:
           CLRSCR
           HienString dt1	; Hiện thông báo dt1		
           lea    dx,buffc	
           call   GET_FILE_NAME ; Vào tên tệp cần copy đi       
           lea    dx,file_namec	; ds:dx <- seg:offset xâu chứa tên tệp cũ
           HienString dt2	; Hiện thông báo dt2		
           lea    dx,buffm	
           call   GET_FILE_NAME ; Vào tên tệp cần copy đi       
           lea    di,file_namem	; di <- offset xâu chứa tên tệp mới
		           push ds
           pop   es		; es=ds
           mov  ah,56h		; Chức năng đổi tên tệp
           int   21h
           jnc   L_REN1
           HienSString Err_REN ; Hiện thông báo Err_REN khi CF=1
           jmp  Exit_REN
    L_REN1:
          HienString Suc_REN   ; Hiện thông báo Suc_REN khi CF=0
    Exit_REN:
          Hienstring tieptuc      ; Hiện thông báo tieptuc
          mov  ah,1                   ; Chờ 1 ký tự từ bàn phím
          int     21h                         
          cmp   al,'c'                 ; Ký tự vào có phải 'c'
          jne    Thoat_REN      ; Không phải 'c' thì nhảy đế Thoat_REN,
          jmp    L_CT0		; còn đúng là 'c' thì nhảy về L_REN0
   Thoat_REN:                     
			mov  ah,4ch		; Về DOS
			int     21h
INCLUDE lib3.asm		; lib3.asm chứa CT con GET_FILE_NAME
			END  PS

Bài 9
Hãy viết chương trình lấy thuộc tính của tệp.
Cách giải : 
Vào tên tệp cần lấy thuộc tính (gọi CT con GET_FILE_NAME)
Sử dụng chức năng lấy thuộc tính của tệp (CN 43h của ngắt int 21h với AL=0 – lấy thuộc tính).
Khi chương trình chạy yêu cầu, ví dụ có dạng :





INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 ltt1            db 13,10,’ Hay vao ten tep can lay thuoc tinh : $’
 ltt2            db 13,10,’ Tep co thuoc tinh la : $’	
 Err_LTT  db 13,10,’ Khong lay duoc thuoc tinh$’
buff            db 30
		       db ?
 file_name  db 30 dup(?)
 tt0             db  ‘ Khong co thuoc tinh nao $’
 tt1    	       db ‘ Read Only $’
 tt2             db ‘ + Hidden $’
 tt3             db ‘ + System $’
 tt4             db ‘ + Archive $’
tieptuc      db 1310,’ Co tiep tuc CT (c/k) ? $’
.CODE
 PS:
		mov  ax,@data
mov  ds,ax
   L_LTT0:
           CLRSCR
           HienString ltt1	; Hiện thông báo ltt1		
           lea    dx,buff
           call   GET_FILE_NAME ; Vào tên tệp cần lấy thuộc tính       
	mov  al,0		; Chức năng lấy thuộc tính
	lea    dx,file_name	; Thuộc tính có trong CX (thực chất nằm ở CL)
	mov  ah,43h
	int     21h
	jnc    L_LTT1
	HienString Err_LTT
	jmp   Exit_LTT
    L_LTT1:
	HienString ltt2	; Hiện thông báo ltt2
	and   cl,00100111b	; Tách các bit thuộc tính của tệp
	jnz    L_LTT2	; Có thuộc tính thi nhảy,
	HienString  tt0	; còn không thi hiện tt0
	jmp   Exit_LTT	; và thoát
   L_LTT2:
	shr    cl,1		; Bit Read Only -> bit cờ CF
	jnc    L_LTT3	; CF=0 (không có thuộc tính Read Only) thì nhảy,
   	HienString tt1	; còn CF=1 (có thuộc tính Read Only) thì hiện tt1
  L_LTT3:
	shr   cl,1		; Bit Hidden  -> bit cờ CF
	jnc    L_LTT4	; CF=0 (không có thuộc tính Hidden) thì nhảy,
   	HienString tt2	; còn CF=1 (có thuộc tính Hidden) thì hiện tt2
  L_LTT4:
	shr   cl,1		; Bit System  -> bit cờ CF
	jnc    L_LTT5	; CF=0 (không có thuộc tính System) thì nhảy,
   	HienString tt3	; còn CF=1 (có thuộc tính System) thì hiện tt3
  L_LTT5:
	shr   cl,1
	shr   cl,1
	shr   cl,1		; Bit Archive  -> bit cờ CF
	jnc    Exit_LTT	; CF=0 (không có thuộc tính Archive) thì nhảy,
   	HienString tt4	; còn CF=1 (có thuộc tính Archive) thì hiện tt4
    Exit_LTT:
          Hienstring tieptuc      ; Hiện thông báo tieptuc
          mov  ah,1                   ; Chờ 1 ký tự từ bàn phím
          int     21h                         
          cmp   al,'c'                 ; Ký tự vào có phải 'c'
          jne    Thoat_LTT      ; Không phải 'c' thì nhảy đế Thoat_LTT,
          jmp    L_LTT0          ; còn đúng là 'c' thì nhảy về L_LTT0
   Thoat_LTT:                     
			mov  ah,4ch	           ; Về DOS
			int     21h
INCLUDE lib3.asm		; lib3.asm chứa CT con GET_FILE_NAME
			END  PS

Bài 10
Hãy viết chương trình đặt thuộc tính cho tệp tệp.
Cách giải : 
Vào tên tệp cần lấy thuộc tính (gọi CT con GET_FILE_NAME)
Sử dụng chức năng đặt thuộc tính cho tệp (CN 43h của ngắt int 21h với AL=1 – lấy thuộc tính) và thuộc tính cần đặt phải nằm trong CX.
Khi chương trình chạy yêu cầu, ví dụ có dạng :























INCLUDE lib1.asm
.MODEL small
.STACK 100h
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
	  tieptuc      db 1310,’ Co tiep tuc CT (c/k) ? $’
.CODE
 PS:
		mov  ax,@data
mov  ds,ax
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
          Hienstring tieptuc      ; Hiện thông báo tieptuc
          mov  ah,1                   ; Chờ 1 ký tự từ bàn phím
          int     21h                         
          cmp   al,'c'                 ; Ký tự vào có phải 'c'
          jne    Thoat_DTT      ; Không phải 'c' thì nhảy đế Thoat_DTT,
          jmp    L_DTT0	; còn đúng là 'c' thì nhảy về L_DTT0
   Thoat_DTT:                     
			mov  ah,4ch		; Về DOS
			int     21h
INCLUDE lib2.asm		; lib2.asm chứa CT con VAO_SO_N
INCLUDE lib3.asm		; lib3.asm chứa CT con GET_FILE_NAME
			END  PS

Bài 11
Hãy viết chương trình chia 1 tệp (tệp không quá 64 k) thành 2 tệp bằng nhau
Cách giải :
Vào tên tệp cần chia (gọi CT con GET_FILE_NAME)
Mở tệp đã có để đọc (CN 3dh của ngắt 21h với AL=0 – để đọc)
Xác định độ dài tệp bằng cách đưa con trỏ tệp về cuối têp thì AX chứa độ dài tệp (CN 42h của ngắt int 21h với AL=2 và khoảng cách nằm trong CX=0 vàDX=0)
Trả con trỏ tệp trở lại đầu tệp (CN 42h của ngắt int 21h với AL=0 và khoảng cách nằm trong CX=0 vàDX=0)
Đọc toàn bộ tệp để vào vùng đệm (CN 3fh của ngắt int 21h)
Vào tên tệp con 1 (gọi CT con GET_FILE_NAME)
Tạo tệp mới và mở (CN 3ch của ngắt int 21h)
Ghi ½ dữ liệu từ vùng đệm vào tệp con 1 (CN 40h của ngắt int 21h)
Vào tên tệp con 2 (gọi CT con GET_FILE_NAME)
Tạo tệp mới và mở (CN 3ch của ngắt int 21h)
Ghi ½ dữ liệu còn lại từ vùng đệm vào tệp con 2 (CN 40h của ngắt int 21h)
Đóng  3 tệp (CN 3eh của ngắt int 21h)
Chú ý: Khi thực hiện các chức năng của tệp nếu có lỗi thì hiện thông báo sau đó kết thức, còn nếu mọi chức năng đều thực hiện tốt thì không hiện gì cả.
Khi chương trình chạy yêu cầu có dạng :






INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 ct1          db 13,10,'Vao ten tep can chia : $'
 ct2          db 13,10,'Vao ten tep con 1 : $'
 ct3          db 13,10,'Vao ten tep con 2 : $'
Err_O      db 13,10,'Khong mo duoc tep !$'
 Err_R     db 13,10,'Khong doc duoc tep !$'
 Err_W    db 13,10,'Khong ghi duoc tep !$'
 Err_S     db 13,10,'Khong di chuyen duoc con reo tep !$'
 Err_C     db 13,10,'Khong dong duoc tep !$'
 the_tep   dw ?
 the_tepc1 dw ?
 the_tepc2 dw ?
 buff          db 30
                  db ?
 file_name db 30 dup(?)
 dodai_tep dw ?
 dem          db 20000 dup(?)
tieptuc    db 1310,’ Co tiep tuc CT (c/k) ? $’
.CODE
PS:
          mov ax,@data
          mov ds,ax
  L_CT0:
         clrscr
         HienString ct1
         lea   dx,buff		; Vào tên tệp cần chia
         call  GET_FILE_NAME
         lea   dx,file_name       ; Mở tệp đã có để đọc
         mov al,0
         mov ah,3dh
         int    21h
         jnc    L_CT1		; Mở tệp tốt (CF=0) thì nhảy,
         HienString Err_O	; còn mở tệp có lỗi (CF=1) thì hiện Err_O
         jmp  Exit_CT
  L_CT1:
         mov  the_tep,ax	; Cất thẻ tệp có trong AX -> biến the_tep
         mov  bx,ax		; Đưa con trỏ về cuối tệp để xác định độ dài tệp
         xor   cx,cx		; Khoảng cách so sánh là 0
         mov dx,cx
         mov al,2		; So với cuối tệp
         mov ah,42h		; Chức năng di chuyển con trỏ tệp
         int    21h
         jnc    L_CT2		; Chuyển con trỏ tệp tốt thì nhảy,
         HienString Err_S	; còn chuyển có lỗi (CF=1) thì hiện thông báo Err_S
         jmp  DONG_TEP
  L_CT2:
         mov  dodai_tep,ax	; Chuyển về cuối tệp tốt thí AX là độ dài tệp -> viến dodai_tep
         mov  bx,the_tep	; Đưa con trỏ tệp trở về đầu tệp
         mov  al,0		; So với đầu tệp
         xor   cx,cx		; Khoảng cách so sánh là 0
         mov dx,cx
         mov ah,42h		; Chức năng di chuyển con trỏ tệp
         int    21h
         jnc   L_CT3		; Chuyển con trỏ tệp tốt thì nhảy,
         HienString Err_S	; còn chuyển có lỗi (CF=1) thì hiện thông báo Err_S 
         jmp  DONG_TEP
  L_CT3:
         mov  bx,the_tep	; Đọc toàn bộ tệp -> vùng đệm
         mov  cx,dodai_tep
         lea    dx,dem
         mov  ah,3fh		; Chức năng đọc tệp
         int    21h
         jnc    L_CT4		; Đọc tệp tốt thì nhảy,
         HienString Err_R	; còn có lỗi khi đọc tệp (CF=1) thì hiện thông báo Err_R 
         jmp  DONG_TEP
  L_CT4:
         HienString ct2		; Hiện thông báo ct2	
         lea   dx,buff		; Vào tên tệp con 1
         call  GET_FILE_NAME
         lea   dx,file_name	; Chức năng tạo tệp mới và mở
         mov cx,0		; Không đặt thuộc tính nào cho tệp
         mov ah,3ch
         int    21h
         jnc    L_CT5		; Tạo và mở tệp tốt thì nhảy,
         HienString Err_O	; còn có lỗi khi tạo và mở tệp (CF=1) thì hiện thông báo Err_O 
         jmp DONG_TEP
  L_CT5:
         mov   the_tepc1,ax	; Thẻ tệp ở AX -> biến the_tepc1
         mov   bx,ax		; Ghi ½ dữ liệu từ vùng đệm (chứa dữ liệu đọc được) -> tệp con 1
         mov   cx,dodai_tep
         shr     cx,1                	; 1/2 do dai tep
         lea    dx,dem
         mov  ah,40h
         int    21h
         jnc    L_CT6		; Ghi tốt thì nhảy,
         HienString Err_W	; còn có lỗi khi ghi tệp (CF=1) thì hiện thông báo Err_W 
         jmp DONG_TEPC1
  L_CT6:
         HienString ct3		; Hiện thông báo ct3	
         lea   dx,buff		; Vào tên tệp con 2
         call  GET_FILE_NAME
         lea    dx,file_name	; Chức năng tạo tệp mới và mở 
         mov  cx,0		; Không đặt thuộc tính nào cho tệp 
         mov  ah,3ch
         int     21h
         jnc    L_CT7		; Tạo và mở tệp tốt thì nhảy,
         HienString Err_O	; còn có lỗi khi ghi tệp (CF=1) thì hiện thông báo Err_O 
         jmp  DONG_TEPC1
  L_CT7:
         mov  the_tepc2,ax	; Thẻ tệp ở AX -> biến the_tepc2
         mov  bx,ax		; Ghi 1/2 du lieu con lai tu dem vao tep con 2
         mov  cx,dodai_tep
         mov  ax,cx
         shr    ax,1
         sub   cx,ax		; Số lương byte còn lại cho têp con 2
         lea    dx,dem
         add   dx,ax		; Trỏ đến đầu vùng nhớ chứa dữ liệu còn lại
         mov  ah,40h
         int    21h
         jnc    DONG_TEPC2	; Ghi tệp tốt thì nhảy,
         HienString Err_W	; còn có lỗi khi ghi tệp (CF=1) thì hiện thông báo Err_W 
  DONG_TEPC2:
         mov  bx,the_tepc2	; Đóng tệp con 2
         mov  ah,3eh
         int    21h
         jnc    DONG_TEPC1	; Đóng tệp tốt thì nhảy,
         hienString Err_C	; còn có lỗi khi đóng tệp (CF=1) thì hiện thông báo Err_C 
  DONG_TEPC1:
         mov  bx,the_tepc1	; Đóng tệp con 1
         mov  ah,3eh
         int     21h
         jnc    DONG_TEP
         HienString Err_C
  DONG_TEP:
         mov  bx,the_tep	; Đóng tệp cần chia
         mov  ah,3eh
         int     21h
         jnc TIEPTUC
         HienString Err_C
    Exit_CT:
          Hienstring tieptuc      ; Hiện thông báo tieptuc
          mov  ah,1                   ; Chờ 1 ký tự từ bàn phím
          int     21h                         
          cmp   al,'c'                 ; Ký tự vào có phải 'c'
          jne    Thoat_CT         ; Không phải 'c' thì nhảy đế Thoat_CT,
          jmp    L_CT0		; còn đúng là 'c' thì nhảy về L_CT0
   Thoat_CT:                     
			mov  ah,4ch		; Về DOS
			int     21h
INCLUDE lib3.asm		; lib3.asm chứa CT con GET_FILE_NAME
			END  PS

Bài 12
Hãy viết chương trình đặt lại ngày, tháng và năm (date) và giữ nguyên giờ, phút và giây cho tệp.
Cách giải :
Vào tên tệp cần đặt lại ngày, tháng, năm (gọi CT con GET_FILE_NAME)
Mở tệp đã có để đọc và ghi (CN 3dh của ngắt 21h với AL=2 – để đọc và ghi)
Lấy time và date của tệp (CN 57h của ngắt int 21h với AL=0 – lấy time+date)
Cất time để sau này còn hồi phục (đặt lại) và đưa ngày, tháng, năm mới vào và đưa vào vị trí các bit trong format của date
Đặt date mới và time cũ cho tệp (CN 57h của ngắt int 21h với AL=1 – đặt time+date)
Đóng  tệp (CN 3eh của ngắt int 21h)
Khi chương trình chạy yêu cầu có dạng :





INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 dd1            db 13,10,'Vao ten tep can dat lai time : $'
 dd2            db 13,10,'Vao gio, phut, giay moi : $'
 hc              db ,' : $'
 Err_O        db 13,10,'Khong mo duoc tep !$'
 Err_LT      db  13,10,’Khong lay duoc thoi gian cua tep !$’
 Err_DD     db  13,10,’ Khong dat duoc thoi gian !$’
 Err_C        db 13,10,’Khong dong duoc tep !$’
 the_tep      dw  ?
 buff           db  30
                   db  ?
 file_name  db  30 dup(?)
 tieptuc    db 1310,’ Co tiep tuc CT (c/k) ? $’
.CODE
PS:
          mov ax,@data
          mov ds,ax
  L_DD0:
        	CLRSCR
	HienString  dd1	; Hiện thông báo dd1	
	lea    dx,buff		; Vào tên tệp
	call  GET_FILE_NAME
	lea    dx,file_name	; Mở tệp đã có 
	mov  al,2	; để đọc và ghi
	mov  ah,3dh	; Chức năng mở tệp đã có
	int    21h
	jnc   L_DD1
	HienString   Err_O	; Mở tệp có vấn đề thì hiện thông báo sai
	jmp  Exit_DD	; Nhảy về kết thúc chương trình
   L_DD1:
	mov  the_tep,ax	; Cất thẻ tệp vào biến the_tep
; Lấy time và date hiện có của tệp
	mov  bx,ax	; Đưa thẻ tệp vào thanh ghi BX
	mov  al,0	; Chức năng lấy time và date của tệp
	mov  ah,57h	; Nếu lấy tốt thì CX chứa giờ, phút, giây
 	int     21h	; và DX chứa ngày, tháng và năm
	jnc    L_DD2
	HienString  Err_LT	; Thông báo sai khi lấy time, date của tệp
	jmp  DONG_TEP
   L_DD2:
	push  cx		; Cất time cũ của tệp để sau còn đặt lại
; Phần vào ngày, tháng và năm mới cho tệp
	HienString  dd2
	xor   dx,dx	; dx sẽ chứa ngày, tháng và năm
	call  VAO_2_SO	; Nhận 2 chữ số của ngày 
	xor    ah,ah	; ah=0
	or      dx,ax	; Đưa vào phần ngày của thanh ghi dx
	HienString hc	; Hiện dấu 2 chấm
	call   VAO_2_SO	; Nhận 2 chữ số của tháng
	xor     ah,ah
	mov   cl,5	; Số lần dịch trái
	shl     ax,cl	; Dịch trái 5 lần giá trị tháng
	or       dx,ax	; Đưa vào phần tháng của thanh ghi dx
	HienString hc	; Hiện dấu 2 chấm
	call    VAO_SO_N	; Nhận 4 chữ số của năm
	sub     ax,1980	; Hiệu chỉnh năm
	mov   cl,9	; Số lần dịch trái
	shl     ax,cl	; Dịch trái 9 lần
	or      dx,ax	; Đưa vào phần năm của thanh ghi dx
; Đặt lại time và date của tệp (CN 57h của int 21h với AL=1)
	pop   cx		; Lấy lại time cũ của tệp	
	mov  bx,the_tep	; Thẻ tệp vào bx
	mov  al,1	; Set time và date (CN 57h int 21h với
	mov  ah,57h	; al=1-để đặt, date và time ở dx:cx)
	int    21h		
	jnc   DONG_TEP
	HienString Err_DD	; Thông báo lỗi khi đặt time và date
	DONG_TEP:
	mov  bx,the_tep	; Thẻ tệp vào bx
	mov  ah,3eh	; Chức năng đóng tệp
	int     21h
	jnc    Exit_DD
	HienString  Err_C	; Thông báo lỗi khi đóng tệp	
	Exit_DD:
          Hienstring tieptuc      ; Hiện thông báo tieptuc
          mov  ah,1                   ; Chờ 1 ký tự từ bàn phím
          int     21h                         
          cmp   al,'c'                 ; Ký tự vào có phải 'c'
          jne    Thoat_DD         ; Không phải 'c' thì nhảy đế Thoat_DD,
          jmp    L_DD0		; còn đúng là 'c' thì nhảy về L_DD0
   Thoat_DD:                     
			mov  ah,4ch		; Về DOS
			int     21h
;----------------------------------------------------------------
; Nhận 1 số nguyên có 2 chữ số (phải đánh đủ và đúng) |
;------------------------------------------------------------------
	VAO_2_SO PROC
	push  bx cx dx
	mov   bl,10
	mov   ah,1	; Chờ nhận chữ số hàng chục
	int      21h
	sub    al,30h	; Chuyển số dạng ASCII sang dạng số
	mul   bl		; Nhân số hàng chục với 10
	mov  cl,al	; Số hàng chục tạm cất vào cl
	mov  ah,1	; Chờ nhận chữ số hàng đơn vị
	int     21h
	sub   al,30h	; Chuyển số dạng ASCII sang dạng số
	add   al,cl	; Cộng số hàng đơn vị với hàng chục
	pop   dx cx bx
	ret
	VAO_2_SO ENDP
	INCLUDE lib2.asm	; Chứa chương trình con VAO_SO_N
	INCLUDE lib3.asm	; Chứa chương trình con GET_FILE_NAME
	END	PS
Bài 13
Hãy viết chương trình lấy giờ, phút, giây và % giây của máy tính.
Cách giải : Sử dụng chức năng 2ch của ngắt int 21h (xem chức năng 2ch của ngắt int 21h).
Khi chương trình chạy yêu cầu ví dụ có dạng :




INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 lt1       db 13,10,’Gio, phut, giay và % giay hien tai cua MT la : $'
 hc       db ' : $'
dc        db ‘.$’
tieptuc db 13,10,’Co tiep tuc CT (c/k)? $’
.CODE
 PS:
        mov  ax,@data
        mov  ds,ax
 L_LT0:       
	clrscr		; Xóa màn hình
        HienString lt1	; Hiện thông báo lt1
        mov  ah,2ch	; Chức năng lấy giờ, phút và giây của máy tính
        int    21h
        mov  al,ch	; Đưa giờ từ ch -> al
        xor   ah,ah	; ah=0
        call   HIEN_SO_N	; Hiện giờ
        HienString hc	; Hiện dấu ‘:’
        mov  al,cl	; Đưa phút từ cl -> al
        xor   ah,ah	; ah=0
        call   HIEN_SO_N	; Hiện phút
        HienString hc	; Hiện dấu ‘:’
        mov  al,dh	; Đưa giây từ dh -> al
        xor   ah,ah	; ah=0
        call   HIEN_SO_N	; Hiện giây
        Hienstring dc	; Hiện dấu ‘.’
        mov  al,dl	; Đưa %giây từ dl -> al
        xor   ah,ah	; ah=0
        call    HIEN_SO_N	; Hiện % giây
        HienString tieptuc		
        mov  ah,1	; Chờ ấn 1 phím
        int     21h
        cmp  al,’c’
       jne  Thoat_LT
       jmp L_LT0
Thoat_LT:
        mov  ah,4ch
        int     21h
INCLUDE lib2.asm
END PS
Bài 14
Hãy viết chương trình lấy ngày, tháng và năm của máy tính.
Cách giải : Giống bài 13 với CN 2ah của ngắt int 21h (xem chức năng 2ah của int 21h).

Bài 15
Hãy viết chương trình đặt lại giờ, phút và giây cho máy tính.
Cách giải : Sử dụng chức năng 2dh của ngắt int 21h (xem chức năng 2dh của int 21h).
Chú ý:  Bài này chỉ chạy đúng với máy tính được khởi động DOS thật. !!!!!
Khi chương trình chạy yêu cầu ví dụ có dạng :




INCLUDE lib1.asm
.MODEL small
.STACK 100h
.DATA
 dt1       db 13,10,’Dat lai gio, phut va giay choMT  : $'
 hc        db ' : $'
 dc         db ‘.$’
 tieptuc db 13,10,’Co tiep tuc CT (c/k)? $’
.CODE
 PS:
        mov  ax,@data
        mov  ds,ax
 L_DT0:       
	clrscr		; Xóa màn hình
        HienString lt1	; Hiện thông báo dt1
        call VAO_2_SO	; Nhận giờ
        mov  ch,al	; Đưa giờ từ al -> ch
        HienString hc	; Hiện dấu ‘:’
        call VAO_2_SO	; Nhận phút
        mov  cl,al	; Đưa phút từ al -> cl
        HienString hc	; Hiện dấu ‘:’
        call VAO_2_SO	; Nhận giây
        mov  dh,al	; Đưa gió từ al -> dh
        HienString dc	; Hiện dấu ‘.’
        call VAO_2_SO	; Nhận % giây
        mov  dl,al	; Đưa % giây từ al -> dh
        mov  ah,2dh	; Chức năng đặt giờ, phút, giây và % giây cho máy tính
        int    21h
        HienString tieptuc	; Hiện thông báo tieptuc	
        mov  ah,1	; Chờ ấn 1 phím
        int     21h
        cmp  al,’c’
       jne  Thoat_DT
       jmp L_DT0
Thoat_DT:
        mov  ah,4ch
        int     21h
VAO_2_SO PROC
	push  bx cx dx
	mov   bl,10
	mov   ah,1	; Chờ nhận chữ số hàng chục
	int      21h
	sub    al,30h	; Chuyển số dạng ASCII sang dạng số
	mul   bl		; Nhân số hàng chục với 10
	mov  cl,al	; Số hàng chục tạm cất vào cl
	mov  ah,1	; Chờ nhận chữ số hàng đơn vị
	int     21h
	sub   al,30h	; Chuyển số dạng ASCII sang dạng số
	add   al,cl	; Cộng số hàng đơn vị với hàng chục
	pop   dx cx bx
	ret
VAO_2_SO ENDP
END PS
Bài 16
Hãy viết chương trình đặt lại ngày, tháng và năm cho máy tính.
Cách giải : Giống bải 15 với CN 2bh của ngắt int 21h (xem chức năng 2bh của int 21h).
Vào ngày, tháng bằng CT con VAO_2_SO, còn vào năm bằng CT con VAO_SO_N
Chú ý:  Bài này chỉ chạy đúng với máy tính được khởi động DOS thật. !!!!!


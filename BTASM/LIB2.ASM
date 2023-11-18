;---------------------------------
; NHAN MOT SO NGUYEN TU BAN PHIM  |
; Ket thuc so bang ENTER (0dh)    |
; So nhan duoc nam trong AX       |
; (khong duoc danh sai va sua)	  |
;---------------------------------

VAO_SO_N PROC
	push BX CX DX SI
	mov  BX,10	; Mot so hang nhan
	xor  CX,CX	; Phan so da vao truoc (luc dau bang 0)
	mov  SI,CX	; Co dau cua so (luc dau coi nhu so duong)
   VSN1:
	mov  AH,1	; Cho 1 ky tu tu ban phim
	int  21h
	cmp  AL,0dh	; Ky tu vua vao la phim Enter
	je   VSN3
	cmp  AL,'-'	; Ky tu vua vao la dai '-'
	jne  VSN2	; Khong phai dau '-' thi nhay
	inc  SI		; con khong thi co dau len 1
	jmp  VSN1
    VSN2:
	sub  AL,30h	; Chuyen ky tu vua vao tu ma ASCII sang dang so
	xor  AH,AH	; AH=0 (AX la so vua vao)
	xchg AX,CX	; Doi cheo so vua vao va phan so da vao truoc
	mul  BX		; Nhan phan so da vao truoc voi 10
	add  CX,AX	; Cong so vua vao voi phan so da vao sau khi nhan 10
	jmp  VSN1
   VSN3:
	and  SI,SI	; Dung co ZF (Neu SI#0 thi so vao la am)
	jz   VSN4	; So vua vao la duong thi nhay
	neg  CX		; Bu 2 gia tri vua vao de duoc so am
   VSN4:
	mov  AX,CX
	pop  SI DX CX BX
	ret
VAO_SO_N ENDP

;----------------------------
; HIEN NOI DUNG THANH GHI AX |
; RA MAN HINH DANG CO SO 10  |
;----------------------------

HIEN_SO_N PROC
	push AX BX CX DX
	mov  BX,10	; BX chua so chia la 10
	xor  CX,CX	; So lan cat vao stack (luc dau = 0)
	and  AX,AX	; Dung co dau SF
	jns  HSN1	; Neu so can hien la duong thi nhay
	push AX		; con khong thi cat AX vao stack
	mov  AL,'-'	; Hien dau '-' ra man hinh
	mov  AH,0eh
	int  10h
	pop  AX		; Hoi phuc lai so can hien tu stack vao AX
	neg  AX		; Bu 2 de lay gia tri tuyet doi
   HSN1:
	xor  DX,DX	; DX=0
	div  BX		; DX:AX chia cho BX (10)
	add  DX,30h	; Chuyen so du tu dang so ra dang ASCII
	push DX		; Cat vao stack
	inc  CX		; Tang so lan cat vao stack len 1
	and  AX,AX	; Dung co ZF (lieu thuong = 0)
	jnz  HSN1	; Thuong # 0 thi nhay den tiep tuc qua trinh chia
   HSN2:		; Vong lap lay cac gia tri co trong stack hien 
	pop  AX		
	mov  AH,0eh	; Chuc nang hien 1 ky tu dang ASCII o AL ra man hinh
	int  10h
	loop HSN2
	pop  DX CX BX AX
	ret
HIEN_SO_N ENDP

;------------------------------------------
; Chuong trinh con hien 1 so nguyen trong  |
; thanh ghi AX ra man hinh dang co so HEXA |
;------------------------------------------

HIEN_HEXA PROC
	push ax bx cx dx
	mov  bx,16	; BX=so chia
	xor  cx,cx	; CX=so lan cat vao stack (luc dau=0)
   HSH1:
	xor  dx,dx	; DX=0
	div  bx		; DX:AX chia cho 16 (DX luon=0)
	cmp  dx,10	; Lieu so du nho hon 10 (tu 0 den 9) ?
	jb   HSH2	; Dung thi nhay
 	add  dx,7	; Con khon thi dx=dx+7
   HSH2:
	add  dx,30h	; Chuyen so du dang so ra dang ASCII
	push dx		; Cat vao stack
	inc  cx		; So lan cat vao stack tang len 1
	and  ax,ax	; Lieu thuong da bang 0 ?
	jnz  HSH1	; Chua bang khong thi tiep tuc thuat toan chia
   HSH3:		; con khong thi tao vong lap lay tu stack cac gia 
	pop  ax		; tri da cat va hien ra man hinh
	mov  ah,0eh
	int  10h
	loop HSH3
	mov  al,'h'	; Hien them chu 'h' phia sau so hexa vua hien
	mov  ah,0eh
	int  10h
	pop  dx cx bx ax
	ret
HIEN_HEXA ENDP

;-------------------------------------------
; Chuong trinh con hien gia tri co trong AX |
; ra man hinh dang co so 2 (BINARY)	    |
;-------------------------------------------
HIEN_BINARY PROC
	push ax bx cx
	mov  bx,ax	; Dua gia tri can hien vao BX
	mov  cx,16	; CX=chi so vong lap
    HB:			; Vong lap 16 lan
	xor  al,al	; AL=0
	shl  bx,1	; Quay trai, bit cao nhat vao CF
	adc  al,30h	; Dua CF vao AL va chuyen sang dang ASCII
	mov  ah,0eh	; va hien ra man hinh
	int  10h
	loop HB
	mov  al,'b'	; Hien them chu 'b'
	mov  ah,0eh
	int  10h
	pop  cx bx ax
	ret
HIEN_BINARY ENDP

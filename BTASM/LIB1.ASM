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
; MACRO HIEN XAU CO MAU SAC   |
; (KET THUC '\0' LEN MAN HINH |
;-----------------------------
BLINK	MACRO x,y,tt
	LOCAL B1,Exit_B
	push AX BX CX DX
	mov  DL,x		; Toa do x (cot)
	mov  DH,y		; Toa do y (so dong)
	mov  AH,2		; Chuc nang dua co tro den toa do x,y
	int  10h
   B1:
	mov  AL,[SI]		; Dua ky tu tro boi SI vao AL
	and  AL,AL		; Lieu ky tu do la '\0'
	jz   Exit_B		; Neu ky tu la '\0' thi nhay den ket thuc hien xau
	mov  CX,1		; Hien ky tu 1 lan
	mov  BL,tt		; Thuoc tinh (mau sac can hien)
	mov  AH,9		; Chuc nang hien cac ky tu co mau sac len man hinh
	int  10h
	inc  DL			; Tang so cot len 1
	mov  AH,2		; Dua con tro sang phai 
	int  10h
	inc  SI			; SI tro den ky tu tiep theo cua xau
	jmp  B1
  Exit_B:
	pop  DX CX BX AX
	ENDM

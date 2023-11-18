.Model Small
.Code
public _uscln
_uscln Proc
	push BP
	mov BP,SP	
	mov ax,[BP+4]
	mov bx,[BP+6]
	LapTimUS:
		cmp ax,0
		je KetthucTimUS
		cmp bx,0
		je KetthucTimUS
		cmp ax,bx
		jg TruAX
		sub bx,ax
		jmp TieptucTimUS
		TruAX:
			sub ax,bx
	TieptucTimUS:
	jmp LapTimUS
	KetthucTimUS:
	add ax,bx	
	pop BP
	Ret
_uscln EndP
END
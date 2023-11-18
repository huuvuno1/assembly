.Model Small
.Code
public _uscln
_uscln Proc
	ARG a:word,b:word
	push BP
	mov BP,SP	

	mov ax,a
	mov bx,b
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
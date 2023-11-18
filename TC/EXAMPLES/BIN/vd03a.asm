.Model Small
.Code
public _MIN
extrn _a:word,_b:word,_c:word
_MIN Proc
	mov ax,_a
	mov bx,_b
	mov cx,_c
	cmp ax,bx
	jl SosanhC
	mov ax,bx
	SosanhC:	
		cmp ax,cx
		jl KetthucTimmin
		mov ax,cx
	KetthucTimmin:
	Ret
_MIN EndP
END
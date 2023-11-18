	ifndef	??version
?debug	macro
	endm
$comm	macro	name,dist,size,count
	comm	dist name:BYTE:count*size
	endm
	else
$comm	macro	name,dist,size,count
	comm	dist name[size]:BYTE:count
	endm
	endif
	?debug	S "vd00.c"
	?debug	C E9CF43564206766430302E63
	?debug	C E9001852181C643A5C4C54485473365C54435C696E636C7564655C+
	?debug	C 636F6E696F2E68
	?debug	C E9001852181C643A5C4C54485473365C54435C696E636C7564655C+
	?debug	C 5F646566732E68
	?debug	C E9001852181C643A5C4C54485473365C54435C696E636C7564655C+
	?debug	C 737464696F2E68
	?debug	C E9001852181C643A5C4C54485473365C54435C696E636C7564655C+
	?debug	C 5F6E756C6C2E68
_TEXT	segment byte public 'CODE'
_TEXT	ends
DGROUP	group	_DATA,_BSS
	assume	cs:_TEXT,ds:DGROUP
_DATA	segment word public 'DATA'
d@	label	byte
d@w	label	word
_DATA	ends
_BSS	segment word public 'BSS'
b@	label	byte
b@w	label	word
_BSS	ends
_TEXT	segment byte public 'CODE'
   ;	
   ;	void main()
   ;	
	assume	cs:_TEXT
_main	proc	near
	push	bp
	mov	bp,sp
	sub	sp,6
   ;	
   ;	{
   ;		int a,b,c;
   ;		a=10;
   ;	
	mov	word ptr [bp-2],10
   ;	
   ;		b=20;
   ;	
	mov	word ptr [bp-4],20
   ;	
   ;		c=a+b;
   ;	
	mov	ax,word ptr [bp-2]
	add	ax,word ptr [bp-4]
	mov	word ptr [bp-6],ax
   ;	
   ;		printf("%d",c);
   ;	
	push	word ptr [bp-6]
	mov	ax,offset DGROUP:s@
	push	ax
	call	near ptr _printf
	pop	cx
	pop	cx
   ;	
   ;		getch();
   ;	
	call	near ptr _getch
   ;	
   ;	}
   ;	
	mov	sp,bp
	pop	bp
	ret	
_main	endp
	?debug	C E9
_TEXT	ends
_DATA	segment word public 'DATA'
s@	label	byte
	db	'%d'
	db	0
_DATA	ends
_TEXT	segment byte public 'CODE'
_TEXT	ends
	public	_main
	extrn	_printf:near
	extrn	_getch:near
_s@	equ	s@
	end

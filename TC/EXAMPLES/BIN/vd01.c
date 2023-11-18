#include<conio.h>
void main()
{	char s[]="Hello World!$";
	clrscr();
	asm{   
		lea dx,s
		mov ah,9
		int 21h
	}
	getch();
}

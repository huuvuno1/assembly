#include<conio.h>
#include<stdio.h>
int a,b,c;
extern int MIN();
void main()
{
	printf("Nhap a = "); scanf("%d",&a);
	printf("Nhap b = "); scanf("%d",&b);
	printf("Nhap c = "); scanf("%d",&c);
	printf("Min la: %d",MIN());
	getch();
}

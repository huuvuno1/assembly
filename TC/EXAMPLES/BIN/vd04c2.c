#include<conio.h>
#include<stdio.h>
extern int uscln(int a,int b);
void main()
{	int a,b;
	printf("Nhap a = "); scanf("%d",&a);
	printf("Nhap b = "); scanf("%d",&b);
	if(a<0) a=-a;
	if(b<0) b=-b;
	printf("USCLN la: %d",uscln(a,b));
	getch();
}

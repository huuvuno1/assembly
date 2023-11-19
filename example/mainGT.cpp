#include <iostream.h>
#include <conio.h>
int n;
extern int GIAITHUA();
void main(void)
{
    char tl;
    L1: 
    clrscr();
    cout<<"\n Nhap n:";cin>>n;
    cout<<"\n Giai thua cua "<<n<<" la: "<<GIAITHUA();
    cout<<"\n Ban co muon tiep tuc khong? (c/k)";
    tl = getch();
    if(tl=='c') goto L1;
}
#include <stdio.h>
#include <conio.h>
extern THEM_THUOC_TINH();
extern int TBC2SO();
extern FPU();
void main()
{
      char tl;
      int cn; /*chuc nang*/
      clrscr();
      printf("\n          Truong Dai hoc Mo Ha Noi");
      printf("\n          KHOA CONG NGHE THONG TIN");
      printf("\n          -----------o0o----------");
      printf("\n\n\n           BAI TAP LON MON LTHT");
      printf("\n\n\n     Cac SV thuc hien:");
      printf("\n      1. Nguyen Huu Vu        Lop: 19A3");
      printf("\n      2. Nguyen Manh Hung     Lop: 19A3");
      printf("\n\n\n     Co tiep tuc CT (c/k)?");
      tl=getch();
      if(tl=='c')
               {
                 L1:
                 clrscr();
                 printf("\n            CAC CHUC NANG CUA BTL");
                 printf("\n            ---------***----------");
                 printf("\n\n     1. Chuc nang SET ATT");
                 printf("\n     2. Trung binh cong 2 so nguyen");
                 printf("\n     3. Lieu MT co FPU");
                 printf("\n     4. Thoat ve DOS");
                 printf("\n\n     Hay chon: ");
                 scanf("%d",&cn);
                 switch(cn)
                 {
                    case 1: THEM_THUOC_TINH(); break;
                    case 2: TBC2SO(); break;
                    case 3: FPU(); break;
                    case 4: printf("\n     THOAT VE DOS!"); return; 
                    default: printf("\n     Nhap sai roi, hay nhap lai!");
                 }
     printf("\n     Co thuc hien CN khac(c/k): ");
     tl=getch();
     if(tl=='c'){
      goto L1;
    }
  }
}

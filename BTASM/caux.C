#include <stdio.h>
#include <conio.h>
extern TAOTM();
extern int TBC2SO();
extern CONGJOYSTICK();
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
      printf("\n      1. Nguyen Van A      Lop: 17A3");
      printf("\n      2. Tran Van B        Lop: 17A2");
      printf("\n      3. Nguyen Thi C      Lop: 17A2");
      printf("\n\n\n     Co tiep tuc CT (c/k)?");
      tl=getch();
      if(tl=='c')
               {
                 L1:
                 clrscr();
                 printf("\n            CAC CHUC NANG CUA BTL");
                 printf("\n            ---------***----------");
                 printf("\n\n     1. Tao thu muc");
                 printf("\n     2. Trung binh cong 2 so nguyeno");
                 printf("\n     3. Lieu MT co cong Joystick");
                 printf("\n\n     Hay chon: ");
                 scanf("%d",&cn);
                 switch(cn)
                 {
                 case 1: TAOTM(); break;
                 case 2: TBC2SO(); break;
                 case 3: CONGJOYSTICK(); break;
                 default: printf("\n     Vao sai roi, cao to oi!");
                 }
     printf("\n     Co thuc hien CN khac(c/k): ");
     tl=getch();
     if(tl=='c'){
      goto L1;
      }
      }
      }

INCLUDE lib1.asm
.MODEL small
.DATA
m1 db 13,10,'         CHUC NANG CONG JOYSTICK'
   db 13,10,'         ----------***----------'
   db 13,10,13,10,'     May tinh co cong joystick khong: $'
m2 db 'Khong $'
m3 db 'Co $'
m4 db 13,10,'     Nhan phim bat ki de thoat: $'
.CODE
 PUBLIC _CONGJOYSTICK
 _CONGJOYSTICK PROC
        CLRSCR  
        HienString m1
        int 11h
        mov al,ah
        mov al,5               
        jc  L1
        HienString m2
        jmp Exit
   L1:
        HienString m3
   Exit:
        HienString m4
        mov ah,1
        int 21h
        ret
 _CONGJOYSTICK ENDP  
        END    
 

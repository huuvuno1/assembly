INCLUDE lib1.asm
.Model small
.Data
cc1        db 13,10,'      CHUC NANG COPY CON'
           db 13,10,'      -------o0o--------'
           db 13,10,13,10,'     Vao ten tep: $'
cc2        db 13,10,'     Vao xau ki tu (Ket thuc bang ctrl_z): $'
buff       db 30
           db ?
file_name  db 30 dup(?)
err_o      db 13,10,'    Khong mo duoc tep! $'
err_w      db 13,10,'    Khong ghi duoc tep! $'
err_c      db 13,10,'    Khong dong duoc tep! $'
dem        db 1000 dup(?)
the_tep    dw ?
tieptuc    db 13,10,13,10,'     Co tiep tuc CT(c/k)?: $'
m1         db 13,10,'     An phim bat ky de tro ve Menu: $'
.CODE
PUBLIC @COPYCON$qv
@COPYCON$qv PROC
      L0:
         clrscr			
         HienString cc1			
         lea dx,buff			
         call GET_FILE_NAME
; Tao tep moi va mo
         lea dx,file_name		; Tro den dau xau ten tep
         mov cx,0			; Khong xac lap thuoc tinh nao cho tep
         mov ah,3ch			; Chuc nang tao tep moi va mo
         int 21h
         jnc L1 			; Co carry=0 thi tot, nhay den L1
         HienString err_o               ; con khong thi Hien thong bao loi
         jmp KT
      L1:
         mov the_tep,ax			; Cat the tep vao bien the_tep
; Vong lap vao xau ky tu (ket thuc bang Ctrl_Z tuc ma may la: 1Ah) -> vung dem
         HienString cc2			; Hien thong bao cc2
         xor cx,cx     			; CX=0, dem so luong ky tu
         lea si,dem                     ; SI tro den dau vung dem chua xau
      L2:
         mov ah,1			; Cho nhan 1 ky tu tu ban phim
         int 21h
         cmp al,1ah     		; Lieu ky tu l	a Ctrl_z=1Ah ?
         je  L3				; Ket thuc vao xau thi nhay den L3
         mov [si],al			; con khong ket thuc thi cat vao vung dem
         inc cx                         ; !!!!! Thieu lenh nay
         inc si				; Tro den o tiep theo cua vung dem
         jmp L2
      L3:
         mov bx,the_tep			; Chuc nang ghi vao tep
	 lea dx,dem
         mov ah,40h
         int 21h
         jnc DONG_TEP                   ; CF=0 (ghi tot) thi nhay den DONG_TEP,
         HienString err_w		; con khong thi hien thong bao loi
     DONG_TEP:
         mov bx,the_tep			; Chuc nang dong tep
         mov ah,3eh
         int 21h
         jnc KT                         ; CF=0 (dong tot) thi nhay den KT,
         HienString err_c               ; con CF=1 thi thong bao loi
      KT:
         HienString tieptuc
         mov ah,1
         int 21h
         cmp al,'c'
         jne Thoat
         jmp L0
     Thoat:
         HienString m1
         mov ah,1
         int 21h
         ret
@COPYCON$qv ENDP
include lib4.asm
END

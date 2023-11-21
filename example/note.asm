jb 	L2	; Nhảy nếu n dưới 2 (n=0 và n=1) -jum bottom

AND ax, ax ; Kiểm tra âm dương của n - check sign of n
XOR dx, dx ; Xoá dx => dx = 0
ret ; Trả về kết quả

LEA bx, [bp-2] ; Chuyển địa chỉ bộ nhớ của toán hạng 2 sang toán hạng 1.
PUSHf ; Lưu trạng thái của cờ
popf ; Đọc trạng thái của cờ

 shr ah,1; Dua bit nho nhat (trang thai DMA->CF)
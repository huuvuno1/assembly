1.MOV

Mov      [Toán hạng đích], [Toán hạng nguồn]
Tác dụng: Lấy nội dung (giá trị) của [Toán hạng nguồn] đặt vào [Toán hạng đích]. Nội dung của [Toán hạng nguồn] không bị thay đổi.

2. Inc/ADD/DEC/SUB

Inc        [Toán hạng đích]
Add       [Toán hạng đích],[Toán hạng nguồn]
Dec       [Toán hạng đích]
Sub       [Toán hạng đích],[Toán hạng nguồn]
Lệnh Inc (Increment): làm tăng giá trị của [Toán hạng đích] lên 1 đơn vị.

Lệnh Dec (Decrement): làm giảm giá trị của [Toán hạng đích] xuống 1 đơn vị.

Lệnh Add (Addition): lấy giá trị/nội dung của [Toán hạng nguồn] cộng vào giá trị/nội dung của [Toán hạng đích], kết quả này đặt vào lại [Toán hạng đích].       

Lệnh Sub (Subtract): lấy giá trị/nội dung của [Toán hạng đich] trừ đi giá trị/nội dung của [Toán hạng nguồn], kết quả này đặt vào lại [Toán hạng đích].   

3. Lệnh LOOP

Loop      <Nhãn đích>  

Tác dụng: Khi gặp lệnh này chương trình sẽ lặp lại việc thực hiện các lệnh sau <Nhãn lệnh> đủ n lần, với n được đặt trước trong thanh ghi CX. Sau mỗi lần lặp CX tự động giảm 1 đơn vị (Cx = Cx – 1) và lệnh lặp sẽ dừng khi Cx = 0.

4. Lệnh LEA (LoadEffectiveAddress)

Cú pháp:

                        LEA     [Toán hạng đích],[Toán hạng nguồn]                 

Trong đó: [Toán hạng đích]: Là các thanh ghi 16 bít. [Toán hạng nguồn]: Là địa chỉ của một vùng nhớ hay tên của một biến.

Tác dụng: Lệnh LEA có tác dụng chuyển địa chỉ offset của [Toán hạng nguồn] vào [Toán hạng đích]. Lệnh này thường được sử dụng để lấy địa chỉ offset của một biến đã được khai báo trong chương trình. Thanh ghi được sử dụng trong trường hợp này là thanh ghi cơ sở (BX) và thanh ghi chỉ mục (SI và DI).   

5. Lệnh Mul và Div

Mul    [Toán hạng nguồn]
IMul  [Toán hạng nguồn]
Div      [Toán hạng nguồn]
IDiv    [Toán hạng nguồn]
Tác dụng:

Lệnh Mul (Multiply): Thực hiện phép nhân trên số không dấu. AX=AL*nguồn 8bit.
Nếu nguồn là 16bit thì kết quả lưu vào DX AX =AX*nguồn 16bit. Phần thấp ở AX, phần cao ở DX.

Lệnh IMul (Interger Multiply): tương tự như MUL nhưng là số có dấu.
Lệnh Div (Divide): không dấu. AL=AX chia nguyên nguồn 8bit, AH=AX chia dư nguồn 8bit.
Nếu là nguồn 16bit: lấy DX AX chia cho nguồn 16bit, thương số chứa trong AX, số dư trong DX

Lệnh Idiv (Integer Divide): tương tự lệnh DIV nhưng là số có dấu.
6. Lệnh logic: NOT – AND – OR – XOR – TEST

Cú pháp:

Not     [Toán hạng đích]
And     [Toán hạng đích], [Toán hạng nguồn]
Or       [Toán hạng đích], [Toán hạng nguồn]
Xor     [Toán hạng đích], [Toán hạng nguồn]
Test    [Toán hạng đích], [Toán hạng nguồn]
Lệnh TEST : tương tự lệnh AND nhưng không ghi kết quả nó chỉ ảnh hưởng đến các cờ CF,OF,ZF

7. ADC

Tương tự ADD và cộng thêm với cờ CF.

8. Lệnh dịch bit

SHL: dịch trái bit ảnh hưởng đến cờ

SHR: dịch phải bit ảnh hưởng đến cờ

SAL: Dịch trái (quay)

SAR: Dịch phải(quay)

RCR: quay phải.

RCL:  quay trái.

9. Lệnh CMP

Cú pháp:      Cmp     [Toán hạng đích], [Toán hạng nguồn]

Tác dụng: Lệnh Cmp (Compare) được sử dụng để so sánh giá trị/nội dung của [Toán hạng đích] so với [Toán hạng nguồn]. Tương tự như lệnh Sub, nó lấy [Toán hạng đích] trừ đi [Toán hạng nguồn] nhưng kết quả không làm thay đổi [Toán hạng đích] mà chỉ làm thay đổi giá trị của một số cờ hiệu: CF, ZF, OF,…
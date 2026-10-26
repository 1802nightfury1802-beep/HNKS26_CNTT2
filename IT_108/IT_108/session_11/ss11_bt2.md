## PHẦN 1: PHÂN TÍCH BÀI TOÁN (I/O) & THIẾT KẾ GIẢI PHÁP

### 1. Xác định thành phần hàm VLOOKUP cho từng cột
 _Giả định vùng dữ liệu tra cứu trong sheet `DanhMucTacGia` kéo dài từ dòng 2 đến dòng 100 (tức vùng `A2:E100`)._

|Cột cần điền trong `DanhSachBaoCao` |Lookup_value (Giá trị tìm kiếm) |Table_array (Vùng tra cứu) |Col_index_num (Cột lấy giá trị) |Range_lookup |
| - | - | - | - | - |
|Cột D (Tên Tác Giả)|`C2` (Mã TG trong DanhSachBaoCao)|DanhMucTacGia!$A$2:$E$100|`2` (Cột B: Tên Tác Giả)|`FALSE` (hoặc `0`)|
|Cột E (Phòng trình bày)|`C2` (Mã TG trong DanhSachBaoCao)|DanhMucTacGia!$A$2:$E$100|`4` (Cột D: Phòng)|`FALSE` (hoặc `0`) |
|Cột F (Thù lao)|`C2` (Mã TG trong DanhSachBaoCao)|DanhMucTacGia!$A$2:$E$100|`5` (Cột E: Thù Lao)|`FALSE` (hoặc `0`)|

### 2. Chiến lược xử lý 3 bẫy dữ liệu (Mô tả hàm lồng nhau)

-   **Bẫy 1 (Khoảng trắng thừa):**
    
    -   _Giải pháp:_ Lồng hàm `TRIM(C2)` vào vị trí `Lookup_value` của hàm `VLOOKUP`.
        
    -   _Tác dụng:_ Cắt bỏ toàn bộ khoảng trắng thừa ở đầu/cuối chuỗi tại ô `C2` trước khi đưa đi so sánh, đảm bảo khớp chuẩn với Mã TG trong bảng danh mục.
        
-   **Bẫy 2 (Dữ liệu chưa có, trả về lỗi `#N/A`):**
    
    -   _Giải pháp:_ Bao bọc toàn bộ hàm `VLOOKUP` bên trong hàm `IFERROR(..., "Chưa cập nhật")`.
        
    -   _Tác dụng:_ Bắt lỗi khi không tìm thấy Mã TG và thay thế giá trị lỗi `#N/A` bằng văn bản hiển thị `"Chưa cập nhật"`.
        
-   **Bẫy 3 (Trôi vùng tra cứu khi sao chép công thức):**
    
    -   _Giải pháp:_ Dùng ký tự `$` để cố định tọa độ vùng tra cứu `Table_array` dưới dạng địa chỉ tuyệt đối: `DanhMucTacGia!$A$2:$E$100`.
        
    -   _Tác dụng:_ Giữ nguyên khung bảng tra cứu khi kéo công thức từ dòng 2 xuống dòng 81.
        

### 3. Thiết kế các bước thực hiện tuần tự trong Excel:

-   **Bước 1:** Mở bảng tính Excel, chuyển đến vị trí ô **D2** thuộc sheet `DanhSachBaoCao`.
    
-   **Bước 2:** Nhập công thức kết hợp `IFERROR` + `VLOOKUP` + `TRIM` cùng địa chỉ tuyệt đối `$` vào ô **D2**.
    
-   **Bước 3:** Nhấn **Enter** để hoàn thành công thức tại ô **D2**.
    
-   **Bước 4:** Sao chép công thức từ ô **D2** sang ô **E2** và **F2**, sau đó điều chỉnh lại chỉ số cột `Col_index_num` tương ứng (`2` -> `4` ở cột E và `2` -> `5` ở cột F).
    
-   **Bước 5:** Chọn đồng thời dải ô `D2:F2`, dùng con trỏ chuột kéo nút **Fill Handle** (hoặc nhấp kép chuột) để sao chép công thức xuống toàn bộ các dòng còn lại từ **D3 -> F81**.
    

## PHẦN 2: TRIỂN KHAI & CHỐNG LỖI

### 4. Công thức hoàn chỉnh cho ô D2 (Tên Tác Giả):
```
=IFERROR(VLOOKUP(TRIM(C2), DanhMucTacGia!$A$2:$E$100, 2, FALSE), "Chưa cập nhật")

```
### 5. Công thức cho ô E2 (Phòng) và F2 (Thù lao)
-   **Công thức tại ô E2 (Phòng trình bày):**
    ```
    =IFERROR(VLOOKUP(TRIM(C2), DanhMucTacGia!$A$2:$E$100, 4, FALSE), "Chưa cập nhật")
    
    ```
    
-   **Công thức tại ô F2 (Thù lao):**
    ```
    =IFERROR(VLOOKUP(TRIM(C2), DanhMucTacGia!$A$2:$E$100, 5, FALSE), "Chưa cập nhật")
    
    ```
 **Giải thích lý do chỉ cần thay `Col_index_num`:**
 
 Cả 3 thông tin cần điền (Tên tác giả, Phòng trình bày, Thù lao) đều sử dụng chung **một giá trị tra cứu** `TRIM(C2)` và nằm trong **cùng một bảng tham chiếu** `DanhMucTacGia!$A$2:$E$100`. Điểm khác biệt duy nhất là thứ tự vị trí cột tính từ cột đầu tiên (Cột A - Mã TG):
 
 -   _Tên Tác Giả_ nằm ở cột thứ **2** (Cột B)
     
 -   _Phòng trình bày_ nằm ở cột thứ **4** (Cột D)
     
 -   _Thù lao_ nằm ở cột thứ **5** (Cột E)
     
 
 => Ta giữ nguyên toàn bộ cấu trúc cú pháp hàm và chỉ thay đổi đối số `Col_index_num` từ `2` sang `4` hoặc `5`.

### 6. Giải thích hiện tượng trôi vùng khi bỏ dấu `$` trong `Table_array`

Nếu không dùng dấu `$` (để vùng tra cứu ở dạng địa chỉ tương đối: `DanhMucTacGia!A2:E100`), Excel sẽ tự động điều chỉnh tọa độ dòng tăng dần tương ứng theo vị trí dòng mà công thức được kéo xuống.

#### Ví dụ cụ thể về sự biến đổi địa chỉ ô khi kéo công thức từ D2 xuống D5:

-   **Tại ô D2:** Vùng tra cứu là `DanhMucTacGia!A2:E100` _(Đúng chuẩn, bao gồm từ dòng 2)_.
    
-   **Tại ô D3:** Vùng tra cứu bị trôi thành `DanhMucTacGia!A3:E101` _(Bị bỏ sót dòng 2)_.
    
-   **Tại ô D4:** Vùng tra cứu bị trôi thành `DanhMucTacGia!A4:E102` _(Bị bỏ sót dòng 2 và dòng 3)_.
    
-   **Tại ô D5:** Vùng tra cứu bị trôi thành `DanhMucTacGia!A5:E103` _(Bị bỏ sót các dòng từ 2 đến 4)_.
    

#### Hậu quả :

Nếu Mã tác giả của dòng 5 (ô `C5`) nằm tại các dòng từ `A2` -> `A4` bên sheet `DanhMucTacGia`, hàm `VLOOKUP` sẽ không thể tìm thấy dữ liệu do vùng tra cứu đã bị trôi qua khỏi vị trí đó. Kết quả hàm sẽ bị lỗi hoặc tự động hiển thị `"Chưa cập nhật"` => sai lệch dữ liệu báo cáo.

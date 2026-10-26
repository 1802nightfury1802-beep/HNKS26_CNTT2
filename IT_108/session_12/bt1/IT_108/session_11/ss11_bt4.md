# PHẦN 1: HOÀN THIỆN SRS BẰNG HEADING STYLES VÀ AUTO TOC

### 1 & 2. Khung tiêu đề hoàn chỉnh 3 cấp và Gán Heading Styles

Cấu trúc tiêu đề được phân cấp chính xác theo đúng Style hierarchy trong Microsoft Word:

Plaintext

```
[Heading 1] 1. Giới thiệu dự án
   [Heading 2] 1.1. Mục tiêu
   [Heading 2] 1.2. Đối tượng sử dụng
[Heading 1] 2. Chức năng hệ thống
   [Heading 2] 2.1. Quản lý mượn sách
      [Heading 3] 2.1.1. Luồng mượn sách qua thẻ sinh viên
   [Heading 2] 2.2. Quản lý trả sách
[Heading 1] 3. Yêu cầu bảo mật

```

### 3. Nội dung mô tả yêu cầu (Functional & Non-functional Requirements)

-   **Dưới mục `2. Chức năng hệ thống` (Functional Requirements):**
    
    > Hệ thống cung cấp các chức năng cốt lõi cho phép thủ thư và sinh viên thực hiện các giao dịch mượn/trả sách, tra cứu tài liệu trực tuyến và quản lý hồ sơ độc giả. Ngoài ra, ứng dụng tự động tính toán thời hạn mượn, ghi nhận phạt quá hạn và gửi thông báo nhắc nhở tự động qua email sinh viên.
    
-   **Dưới mục `3. Yêu cầu bảo mật` (Non-functional Requirements):**
    
    > Hệ thống phải áp dụng cơ chế mã hóa mật khẩu hai chiều bằng thuật toán Bcrypt và bắt buộc xác thực phân quyền dựa trên vai trò (Role-Based Access Control) cho mọi truy vấn API. Toàn bộ dữ liệu giao dịch mượn/trả phải được sao lưu tự động định kỳ vào 00:00 hằng ngày và đảm bảo thời gian hoạt động (Uptime) đạt tối thiểu 99.9%.
    

### 4. Quy trình thao tác Auto TOC & Cập nhật số trang (Update Field)

1.  **Chèn Auto TOC:**
    
    -   Đặt con trỏ chuột tại vị trí trang đầu tiên của tài liệu.
        
    -   Vào thẻ **References**  $\rightarrow$ chọn **Table of Contents**  $\rightarrow$ Chọn mẫu **Automatic Table 1** (hoặc **Automatic Table 2**).
        
2.  **Đẩy Mục 3 sang trang sau:**
    
    -   Đặt con trỏ chuột ngay trước dòng `3. Yêu cầu bảo mật`.
        
    -   Nhấn tổ hợp phím **Ctrl + Enter** (hoặc chọn **Insert**  $\rightarrow$  **Page Break**) để chèn ngắt trang cứng, đẩy Mục 3 từ Trang 1 sang Trang 2.
        
3.  **Cập nhật số trang tự động (Update Field):**
    
    -   Click phải chuột vào khung Mục lục vừa tạo $\rightarrow$ Chọn **Update Field**.
        
    -   Hộp thoại xuất hiện, chọn tùy chọn **Update entire table** (Cập nhật toàn bộ bảng) $\rightarrow$ Bấm **OK**.
        

-   **Mô tả kết quả Mục lục tự động thu được:**
    

Plaintext

```
    MỤC LỤC
    1. Giới thiệu dự án ..................................................... 1
       1.1. Mục tiêu ........................................................ 1
       1.2. Đối tượng sử dụng ............................................... 1
    2. Chức năng hệ thống ................................................... 1
       2.1. Quản lý mượn sách ............................................... 1
          2.1.1. Luồng mượn sách qua thẻ sinh viên .......................... 1
       2.2. Quản lý trả sách ................................................ 1
    3. Yêu cầu bảo mật ...................................................... 2
    

```

```
*(Mục 3 đã chuyển từ số trang 1 sang số trang 2 đúng chuẩn).*

```

# PHẦN 2: CHUẨN HÓA DỮ LIỆU VÀ AUTOFILTER

### 1.  3 lỗi vi phạm 5 Quy tắc Vàng trong Database:

|Lỗi |Vị trí (hàng) |Quy tắc bị vi phạm |
|-|-|-|
|1 |Hàng 1 (ô `A1:E1`) |**Quy tắc 1: Không merge ô (Unmerge cells).** Tiêu đề gộp ô gây đứt gãy cấu trúc mảng dữ liệu, khiến Excel không nhận diện được Header Row để bật AutoFilter. |
|2 |Hàng 5 |**Quy tắc 2: Không chứa hàng trống (No empty rows).** Dòng trống ngắt đứt vùng dữ liệu liên tục (Continuous Data Region / CurrentRegion), làm AutoFilter vàPivotTable bị dừng giữa chừng. |
|3 |Hàng 6 |**Quy tắc 3: Không đặt dòng Tổng cộng/Thống kê xen giữa vùng dữ liệu.** Dòng tổng kết phá hỏng tính đồng nhất dữ liệu của các Field và làm sai lệch kết quả lọc/tính toán.|

### 2. Bảng dữ liệu đã chuẩn hóa (Đúng tư duy Database)

Toàn bộ các ô Merge bị gỡ bỏ, xóa hàng 5 (trống), đẩy dòng Tổng cộng xuống dưới cùng (hoặc dùng Status bar/Total Row độc lập ngoài mảng).

**Bảng: `PhieuMuon`**

|MSSV |Tên |Mã sách |Ngày Mượn |Tình trạng |
|-|-|-|-|-|
|SV001 |Nguyễn Văn An |S001 |01/10/2026 |Đang mượn |
|SV002 |Trần Thị Bình |S002 |03/10/2026 |Quá hạn |
|SV003 |Lê Văn Cường |S003 |10/10/2026 |Đã trả |
|SV004 |Phạm Thu Hà |S004 |12/10/2026 |Đang mượn |

### 3. Xác định Record và Field:

-   **1 Record (Bản ghi / Cột ngang - Hàng):** Là tập hợp thông tin đầy đủ về 1 lượt mượn sách của một sinh viên cụ thể.
    
    -   _Ví dụ cụ thể:_ Hàng dữ liệu chứa thông tin:  `SV002 | Trần Thị Bình | S002 | 03/10/2026 | Quá hạn`.
        
-   **1 Field (Trường dữ liệu / Cột dọc):** Là thuộc tính chứa cùng một kiểu dữ liệu đại diện cho một thông tin duy nhất.
    
    -   _Ví dụ cụ thể:_ Cột `Mã Sách` (chứa tập hợp tất cả các mã sách như `S001`,  `S002`,  `S003`,  `S099`).
        

### 4. Thao tác bật AutoFilter và Lọc sinh viên "Quá hạn":

1.  **Thao tác bật AutoFilter:**
    
    -   Click chọn một ô bất kỳ trong vùng dữ liệu chuẩn hóa (ví dụ ô `A1`).
        
    -   Nhấn tổ hợp phím tắt **`Ctrl + Shift + L`** (hoặc vào thẻ **Data**  $\rightarrow$ chọn biểu tượng **Filter**). Các mũi tên xổ xuống (Filter dropdown) xuất hiện ở dòng Header (`Hàng 1`).
        
2.  **Thao tác lọc Tình trạng = "Quá hạn":**
    
    -   Click vào nút mũi tên xổ xuống ở tiêu đề cột **Tình Trạng** (ô `E1`).
        
    -   Bỏ chọn `(Select All)`.
        
    -   Tích chọn duy nhất ô **`Quá hạn`**.
        
    -   Nhấn **OK**. Bảng sẽ lọc ra duy nhất 1 bản ghi của sinh viên `SV002 - Trần Thị Bình`.
        

# PHẦN 3: NỐI DỮ LIỆU BẰNG VLOOKUP

### 1. Thêm cột "Tên Sách" và Viết công thức VLOOKUP:

-   **Bố trí cột:** Thêm cột **Tên Sách** làm Cột D (đẩy `Ngày Mượn` và `Tình Trạng` sang phải).
    
-   **Giả định vị trí dữ liệu:**
    
    -   Sheet `PhieuMuon`: Cột `Mã Sách` nằm ở **Cột C** (từ `C2:C5`).
        
    -   Sheet `DanhMucSach`: Vùng dữ liệu nằm từ **`A2:C4`** (Cột A là Mã Sách, Cột B là Tên Sách, Cột C là Thể Loaị).

**Công thức VLOOKUP tại ô `D2` (dòng của SV001):**

=VLOOKUP(C2, DanhMucSach!$A$2:$C$4, 2, FALSE)
```
### 2. Phân tích lỗi dòng Mã Sách `S099` (Hàng 8 cũ / Hàng 5 mới)

-   **Lỗi trả về:**  **`#N/A`**  _(Not Available)_.
    
-   **Nguyên nhân:** Do tham số thứ 4 trong VLOOKUP được đặt là `FALSE` (tìm kiếm chính xác tuyệt đối - Exact Match). Hàm VLOOKUP quét toàn bộ Cột 1 (`A2:A4`) trong bảng `DanhMucSach` nhưng **không tìm thấy giá trị "S099"** tương ứng, do đó Excel trả về lỗi `#N/A` để báo dữ liệu không tồn tại trong Bảng Tra Cứu.
    

### 3. Công thức bọc IFERROR xử lý ngoại lệ

Viết lại công thức tại ô `D2` (và copy/fill-down xuống các ô bên dưới):
```
=IFERROR(VLOOKUP(C2, DanhMucSach!$A$2:$C$4, 2, FALSE), "Không tìm thấy sách")


-   **Kết quả thu được tại dòng mã S099:** Cột Tên Sách hiển thị chuỗi văn bản **`Không tìm thấy sách`** thay vì báo lỗi `#N/A`.

# PHẦN 4: SLIDE BÁO CÁO TIẾN ĐỘ & SLIDE DECK GENERATION

#### Áp dụng Quy tắc 10 / 20 / 30 (Guy Kawasaki Rule)

-   **10 Slides:** Slide báo cáo tiến độ này đóng vai trò là **Slide 1 / 10** (chiếm 10% trong tổng số 10 slide của toàn bộ buổi báo cáo đồ án).
    
-   **20 Phút:** Slide báo cáo tiến độ dữ liệu này dự kiến trình bày trong **2 phút** (trên tổng thời lượng tối đa 20 phút của toàn bộ bài thuyết trình đồ án).
    
-   **30pt Font:** Toàn bộ tiêu đề chính (Assertion Title) và các con số Hero Metric trên slide đều sử dụng cỡ chữ **từ 30pt đến 38pt**, đảm bảo người ngồi ở cuối lớp/hội trường vẫn đọc rõ ràng.
    



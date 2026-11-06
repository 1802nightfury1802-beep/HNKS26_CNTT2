# Yêu cầu:

-   **Chức năng 1 (Hệ sinh thái công cụ):** Lựa chọn và phân loại 5 Extensions thiết yếu thuộc 3 nhóm: Dev Suite (soi JSON), Productivity (chấm mã màu), và Security (chặn quảng cáo).
    
-   **Chức năng 2 (Phân quyền):** Thiết lập chế độ Site Access (On click) để hạn chế quyền đọc dữ liệu nhạy cảm của các tiện ích mở rộng.

# Vấn đề:

Đội ngũ kỹ sư GreenLogistics cần một môi trường làm việc số chuyên nghiệp để soi API dữ liệu GPS và chặn các quảng cáo độc hại có thể làm chậm quá trình điều phối xe.

# Cách làm:

## Phần 1. Phân tích: Vai trò của JSON Viewer trong gỡ lỗi API:

-   **Bản chất:** Dữ liệu phản hồi (response) thô từ máy chủ API thường là một chuỗi văn bản JSON liền mạch, dày đặc và khó đọc bằng mắt thường.
    
-   **Vai trò của JSON Viewer:** Tiện ích này tự động phân tích cú pháp (parse), định dạng lại cấu trúc cây (tree view) với các màu sắc phân biệt rõ ràng giữa các kiểu dữ liệu (key, string, number, boolean) và hỗ trợ tính năng thu gọn/mở rộng các nhánh dữ liệu phức tạp. Điều này giúp kỹ sư điều phối nhanh chóng định vị tọa độ GPS, trạng thái xe, phát hiện lỗi cú pháp hoặc sai lệch trường dữ liệu ngay trong tab Network mà không mất thời gian đọc chuỗi thô.
    

## Phần 2. Triển khai: Danh sách 5 tiện ích thiết yếu và cách ghim Toolbar:

**5 tiện ích mở rộng chia theo 3 nhóm:**

1.  **Dev Suite (Soi API/JSON):**
    
    -   _JSON Formatter_ (hoặc _JSON Viewer_): Định dạng cấu trúc dữ liệu API trực quan.
        
    -   _ModHeader_ (hoặc _Network Interceptor_): Chỉnh sửa HTTP request headers phục vụ kiểm thử hệ thống GPS.
        
2.  **Productivity (Chấm mã màu & Tiện ích):**
    
    -   _ColorZilla_: Công cụ hút và chấm mã màu trực tiếp trên giao diện bản đồ điều phối.
        
    -   _Dark Reader_: Tối ưu hóa giao diện tối cho toàn bộ trang quản trị, bảo vệ mắt khi trực ca đêm.
        
3.  **Security (Chặn quảng cáo độc hại):**
    
    -   _uBlock Origin_: Trình chặn mã độc, quảng cáo và các tập lệnh ngầm gây nặng trình duyệt, giải phóng RAM để nạp biểu đồ Waterfall mượt mà.
        

**Cách ghim (Pin) tiện ích lên Toolbar:**

1.  Click vào biểu tượng **Extensions (hình mảnh ghép)** ở góc trên bên phải thanh công cụ trình duyệt.
    
2.  Tìm đến tiện ích cần dùng trong danh sách thả xuống.
    
3.  Click vào **biểu tượng Ghim (Pin)** bên cạnh tên tiện ích để đưa biểu tượng đó hiển thị cố định trực tiếp lên thanh Toolbar, giúp thao tác nhanh chóng khi cần.
    

### Phần 3. Kiểm thử: Kiểm tra mức tiêu thụ tài nguyên của Extension

Khi trình duyệt bị lag hoặc chậm khi tải biểu đồ Waterfall, thực hiện quy trình kiểm tra tài nguyên như sau:

1.  Nhập hoặc sao chép đường dẫn **`chrome://extensions`** vào thanh địa chỉ của trình duyệt rồi nhấn **Enter**.
    
2.  Bật công tắc **Developer mode (Chế độ nhà phát triển)** ở góc trên bên phải trang quản lý.
    
3.  Nhìn lên góc trên bên phải của cửa sổ trình duyệt, click vào biểu tượng **Task Manager (Trình quản lý tác vụ)** — hoặc nhấn tổ hợp phím tắt **`Shift + Esc`**.
    
4.  Trong cửa sổ Task Manager hiện ra, tìm các tiến trình bắt đầu bằng tiền tố **`Extension:`**.
    
5.  Quan sát cột **Memory footprint (Bộ nhớ)** và **CPU** để xác định tiện ích nào đang ngốn nhiều tài nguyên nhất, sau đó tiến hành bấm chọn và chọn **End process** hoặc gỡ bỏ tiện ích đó.

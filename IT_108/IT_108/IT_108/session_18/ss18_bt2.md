# Yêu cầu:
-   **Chức năng 1 (Duy trì trạng thái):** Vận dụng kiến thức về Persistent Cookies để thiết lập cơ chế ghi nhớ phiên làm việc thay vì sử dụng Session Cookies.
    
-   **Chức năng 2 (Bảo mật):** Thiết lập các cờ bảo mật HttpOnly và Secure để ngăn chặn hành vi đánh cắp Session (Session Hijacking).

# Vấn đề:
- Hệ thống vận tải yêu cầu shipper phải đăng nhập để nhận đơn. Tuy nhiên, mỗi lần shipper đóng trình duyệt hoặc load lại trang, giỏ hàng phụ tùng xe lại bị trống rỗng và shipper phải đăng nhập lại từ đầu.
- 
# Cách làm:

## Phần 1. Phân tích: Đánh đổi giữa Cache và Cookies

-   **Cookies (~4KB):**
    
    -   **Ưu điểm:** Dung lượng nhỏ gọn, được đính kèm tự động vào mọi HTTP request gửi lên server, rất phù hợp để lưu trữ token định danh phiên làm việc (Session ID).
        
    -   **Nhược điểm:** Dung lượng cực kỳ hạn chế (tối đa ~4KB), không phù hợp để chứa dữ liệu lớn như giỏ hàng phức tạp hay tài nguyên giao diện.
        
-   **Cache (MB/GB):**
    
    -   **Ưu điểm:** Dung lượng lớn (lên tới hàng GB), lưu trữ các tệp tĩnh (HTML, CSS, JS, hình ảnh) trực tiếp trên máy người dùng giúp tăng tốc độ tải trang và giảm tải cho server.
        
    -   **Nhược điểm:** Không dùng để lưu trữ dữ liệu định danh bảo mật hoặc trạng thái đăng nhập của người dùng do dữ liệu cache có thể bị xóa hoặc ghi đè bất cứ lúc nào.

## Phần 2:
Để duy trì phiên đăng nhập qua các lần đóng/mở trình duyệt (Persistent Cookie) và đáp ứng yêu cầu chống truy cập từ JavaScript, cấu trúc mẫu tin `Set-Cookie` :

-   **`auth_token`**: Chuỗi mã hóa định danh người dùng (giúp shipper không bị mất trạng thái đăng nhập).
    
-   **`Max-Age=2592000`**: Thiết lập thời gian sống của Cookie là 30 ngày (tính bằng giây), chuyển đổi từ Session Cookie sang Persistent Cookie để lưu trữ qua việc đóng trình duyệt.
    
-   **`HttpOnly`**: Ngăn chặn hoàn toàn việc mã JavaScript phía Client (như các đoạn mã XSS độc hại) đọc hoặc ghi dữ liệu token này.
    
-   **`Secure`**: Đảm bảo Cookie chỉ được truyền tải qua các kết nối HTTPS được mã hóa an toàn.
    
-   **`SameSite=Strict`**: Bảo vệ chống lại tấn công giả mạo yêu cầu chéo trang (CSRF).

## Phần 3. Kiểm thử: Thao tác Hard Reload

Khi shipper đã thay đổi giao diện/mã nguồn nhưng trình duyệt vẫn hiển thị dữ liệu cũ do lưu đệm trong Cache, thực hiện thao tác **Hard Reload** để xóa bộ nhớ đệm:

-   **Trên Windows / Linux:** Nhấn tổ hợp phím **`Ctrl + Shift + R`** / **`Ctrl + F5`**.
    
-   **Thao tác qua Developer Tools:**
    
    1.  Nhấn **`F12`** (hoặc chuột phải chọn _Inspect_).
        
    2.  Click chuột phải vào **nút Reload (biểu tượng mũi tên xoay)** nằm cạnh thanh địa chỉ trình duyệt.
        
    3.  Chọn **Empty Cache and Hard Reload** (Xóa bộ nhớ đệm và tải lại hoàn toàn).

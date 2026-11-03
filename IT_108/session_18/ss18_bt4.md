# Yêu cầu:
-   **Chức năng 1 (Cách ly dữ liệu):** Thiết lập mô hình 3 Profile độc lập (Personal - Work - Sandbox) để triệt tiêu hoàn toàn rủi ro văng tài khoản.
    
-   **Chức năng 2 (Tổ chức Bookmark):** Xây dựng cấu trúc cây thư mục Bookmark khoa học để truy cập nhanh các công cụ như GitHub, Canvas LMS và Portal công ty.

# Vấn đề:
Một quản trị viên điều phối cần quản lý đồng thời: tài khoản cá nhân, tài khoản quản trị hệ thống GreenLog, và tài khoản kiểm thử (Sandbox). Việc dùng chung một cửa sổ trình duyệt khiến các phiên đăng nhập bị xung đột **(Session Conflict)**.

# Cách làm:

## Phần 1. Phân tích: Incognito Mode vs. Dedicated Profile

-   **Incognito Mode (Chế độ ẩn danh):**
    
    -   **Lưu trữ:** Tạm thời trên RAM và bộ nhớ đệm trong suốt phiên làm việc.
        
    -   **Đặc điểm:** Toàn bộ lịch sử, cookie và dữ liệu phiên đăng nhập sẽ tự động bị xóa sạch ngay khi đóng cửa sổ ẩn danh. Không thể duy trì đăng nhập lâu dài hoặc đồng bộ hóa cá nhân.
        
-   **Dedicated Profile (Hồ sơ chuyên dụng):**
    
    -   **Lưu trữ:** Lưu trữ lâu dài trên ổ cứng thiết bị.
        
    -   **Đặc điểm:** Tách biệt hoàn toàn cookie, bộ nhớ cache, lịch sử và mật khẩu giữa các tài khoản. Cho phép duy trì trạng thái đăng nhập liên tục qua nhiều lần khởi động lại trình duyệt và hỗ trợ đồng bộ đám mây (Cloud Sync).
        

## Phần 2. Triển khai: Quy trình tạo và đồng bộ hóa Cloud Sync

Để tạo hồ sơ độc lập và bảo vệ dữ liệu Bookmark khi chuyển máy tính, thực hiện quy trình sau (trên Google Chrome):

1.  **Tạo Profile mới:**
    
    -   Click vào **ảnh đại diện** (hoặc biểu tượng hồ sơ) ở góc trên cùng bên phải cửa sổ trình duyệt.
        
    -   Chọn **Add (Thêm)**, nhập tên hồ sơ (Ví dụ:  _Work_,  _Sandbox_), chọn một biểu tượng và nhấn **Done**.
        
2.  **Kích hoạt Cloud Sync (Đồng bộ hóa đám mây):**
    
    -   Trong cửa sổ Profile mới mở, nhấn **Turn on sync (Bật đồng bộ)**.
        
    -   Đăng nhập bằng tài khoản Google tương ứng với Profile đó.
        
    -   Bật tùy chọn đồng bộ cho **Bookmarks** để dữ liệu tự động lưu trữ trên đám mây, giúp khôi phục nguyên vẹn khi đăng nhập tài khoản này trên máy tính mới.
        

## Phần 3. Kiểm thử: Nguyên tắc sử dụng Guest Profile trên máy tính công cộng

Khi làm việc trên máy tính công cộng hoặc mượn thiết bị của người khác, cần tuân thủ quy tắc sử dụng **Guest Profile**:

-   **Sử dụng chế độ Khách thay vì tài khoản chính:** Mở trình duyệt dưới dạng **Guest Profile** để đảm bảo trình duyệt không lưu lại bất kỳ lịch sử duyệt web, cookie hay mật khẩu nào sau khi đóng cửa sổ.
    
-   **Xóa dấu vết phiên làm việc:** Đảm bảo tắt toàn bộ cửa sổ Khách ngay khi kết thúc công việc để tự động xóa sạch dữ liệu phiên làm việc, ngăn chặn rò rỉ thông tin cá nhân hoặc tài khoản quản trị hệ thống ra bên ngoài.

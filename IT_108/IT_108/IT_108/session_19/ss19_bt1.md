# Yêu cầu:
**_Báo cáo phân tích (IPO)_**

-   Xác định Input (Dấu hiệu nhiễm), Process (Các bước xử lý), Output (Hệ thống sạch).
    

**_Triển khai_**

-   Mô tả chi tiết cách thực hiện "Đổi mật khẩu từ thiết bị khác" và "Revoke Token" trên GitHub.

# Vấn đề: 
- Máy tính của bạn có dấu hiệu bị nhiễm **Infostealer** (mất quyền kiểm soát Facebook, Gmail liên tục).

# Cách làm:

## 1. Báo cáo phân tích (IPO):

-   **Input (Dấu hiệu nhận biết):** Tài khoản Facebook, Gmail bị đăng xuất đột ngột, xuất hiện lịch sử đăng nhập từ thiết bị lạ, hoặc mất quyền kiểm soát do mã độc Infostealer đánh cắp cookie phiên làm việc và thông tin đăng nhập.
    
-   **Process (Quy trình 4 bước xử lý khẩn cấp):**
    
    1.  **Ngắt kết nối mạng:** Ngắt ngay Wi-Fi/Ethernet trên máy tính bị nhiễm để chặn mã độc truyền dữ liệu về máy chủ điều khiển (C2).
        
    2.  **Đổi mật khẩu từ thiết bị khác:** Sử dụng điện thoại/máy tính hoàn toàn an toàn khác để đổi mật khẩu và buộc đăng xuất toàn bộ phiên làm việc hiện tại.
        
    3.  **Thu hồi quyền truy cập (Revoke Token):** Vô hiệu hóa các Session Token, OAuth App token và Personal Access Token đang cấp quyền cho ứng dụng/kẻ tấn công.
        
    4.  **Làm sạch hệ thống:** Quét phần mềm độc hại chuyên sâu hoặc cài đặt lại hệ điều hành  để triệt tiêu hoàn toàn mã độc ẩn sâu.
        
-   **Output (Hệ thống sạch):** Thiết bị được loại bỏ mã độc; tài khoản an toàn với mật khẩu mới, kích hoạt xác thực 2 bước (2FA) và toàn bộ token độc hại đã bị thu hồi.

## 2.Cách thực hiện chi tiết:

### A. Đổi mật khẩu từ thiết bị khác:

1.  Dùng một thiết bị hoàn toàn an toàn (điện thoại/máy tính sạch).
    
2.  Đăng nhập vào tài khoản cần bảo vệ (Gmail/Facebook).
    
3.  Truy cập phần **Cài đặt bảo mật & đăng nhập**.
    
4.  Tiến hành **Đổi mật khẩu mới mạnh hơn** và bắt buộc chọn tùy chọn **"Đăng xuất khỏi tất cả các thiết bị khác" (Log out of all sessions)** để vô hiệu hóa lập tức các cookie phiên mà mã độc đã đánh cắp.
    

### B. Thu hồi Token (Revoke Token) trên GitHub:

1.  Đăng nhập vào tài khoản GitHub từ thiết bị sạch.
    
2.  Nhấp vào ảnh đại diện ở góc trên bên phải -> chọn **Settings**.
    
3.  Cuộn xuống mục **Developer settings** ở thanh menu bên trái.
    
4.  Chọn **Personal access tokens** (hoặc mục **OAuth Apps** / **GitHub Apps** tương ứng).
    
5.  Kiểm tra danh sách các token/ứng dụng bên thứ ba đang hoạt động. Nhấn nút **Revoke** đối với các token hoặc ứng dụng khả nghi để cắt đứt quyền truy cập API vào kho mã nguồn.


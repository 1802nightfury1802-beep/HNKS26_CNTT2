# Yêu cầu:
**_Thiết kế kiến trúc_**

-   Vẽ sơ đồ luồng dữ liệu giải thích cách 3 lớp bảo vệ phối hợp với nhau để ngăn chặn hacker kể cả khi chúng có mật khẩu.
    

**_Xử lý bẫy (Edge Case)_**

-   Nếu người dùng đang ở trên máy bay (không có internet/sóng điện thoại), làm sao họ vẫn có thể lấy mã OTP để thực hiện giao dịch?

# Vấn đề:
- Sinh viên nộp một đoạn mã giả lập kiểm tra chuỗi URL nhưng lại bỏ qua việc kiểm tra các ký tự Unicode gây nhầm lẫn (Homograph attack).

# Cách làm:

### 1. Thiết kế kiến trúc 3 lớp bảo vệ (MFA + TOTP)

Quy trình xác thực kết hợp 3 lớp bảo vệ độc lập nhằm vô hiệu hóa hoàn toàn tình trạng rò rỉ mật khẩu:

-   **Lớp 1 (Something you know):** Mật khẩu chính (Master Password) / PIN đã được băm an toàn (hashing với salt) tại Server.
    
-   **Lớp 2 (Something you have):** Mã **TOTP** (Time-based One-Time Password) sinh ra từ ứng dụng xác thực (Google Authenticator, Authy) hoặc khóa phần cứng (YubiKey).
    
-   **Lớp 3 (Something you are / Device Binding):** Xác thực sinh trắc học (Vân tay/Face ID) hoặc mã khóa phần cứng trên thiết bị tin cậy để cấp quyền ký giao dịch .
    

**Luồng dữ liệu và cơ chế ngăn chặn hacker:**

1.  Người dùng nhập Mật khẩu (Lớp 1) --> Server xác thực thành công.
    
2.  Server yêu cầu mã OTP --> Người dùng nhập mã TOTP từ thiết bị cá nhân (Lớp 2).  **Hacker dù có mật khẩu (Lớp 1) cũng bị chặn tại đây** vì không sở hữu điện thoại/thiết bị sinh mã TOTP thay đổi liên tục mỗi 30 giây.
    
3.  Khi thực hiện giao dịch crypto, ứng dụng yêu cầu quét sinh trắc học (Lớp 3) để mở khóa Private Key mã hóa cục bộ.  **Hacker dù chiếm được quyền điều khiển phiên đăng nhập từ xa cũng không thể vượt qua Lớp 3** do thiếu dấu vân tay/khuôn mặt của chủ ví.
    

### 2. Xử lý bẫy (Edge Case): Lấy mã OTP khi ở trên máy bay (Không có internet/sóng)

-   **Giải pháp:** Sử dụng đặc tính **hoạt động ngoại tuyến (offline)** của thuật toán **TOTP**.
    
-   **Giải thích:**
    
    -   Thuật toán TOTP **không cần kết nối internet** hay sóng di động để tạo mã.
        
    -   Mã OTP được ứng dụng tự sinh ra dựa trên sự kết hợp giữa **Khóa bí mật (Secret Key)** đã được lưu trữ sẵn trên thiết bị từ lúc thiết lập và **Thời gian thực** của thiết bị.
        
    -   Do đó, khi ở trên máy bay, người dùng chỉ cần mở ứng dụng xác thực trên điện thoại (đang bật chế độ máy bay) để lấy mã TOTP 6 chữ số nhập vào ví. Phía server khi nhận được mã này sau khi kết nối lại internet sẽ đối chiếu dựa trên đồng hồ hệ thống (có độ trễ cho phép tính bằng vài khoảng thời gian 30 giây) để xác thực hợp lệ.



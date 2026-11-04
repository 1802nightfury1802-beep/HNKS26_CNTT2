# Yêu cầu:
-   Nhận diện **Phishing** và **Mã độc Crack**; ghi nhớ **Quy tắc 5 KHÔNG** và **Quy trình Cấp cứu 4 Bước**
    
-   Nguyên lý **Password Manager** và **Zero-Knowledge Architecture**
    
-   Thiết lập **2FA/TOTP** qua **Authenticator App**
    
-   Bảo vệ **Secrets** bằng bộ đôi `.env` / `.gitignore`

# Vấn đề:
-   **Tình huống 1:** Email tiêu đề _"GitHub Security Alert: Tài khoản của bạn đã bị khóa"_ yêu cầu bấm vào link `https://githuh-security.com/verify` để "mở khóa" bằng cách nhập lại mật khẩu.
    
-   **Tình huống 2:** Một trang web quảng cáo _"Crack Adobe Photoshop 2026 Full – Tải Miễn phí"_ kèm hướng dẫn: _"Vui lòng tắt Windows Defender trước khi giải nén file để tránh bị xóa nhầm."_
- 
# Cách làm:

## Phần 1 – Nhận diện rủi ro và xử lý sự cố

1.  **Tình huống 1:**
    
    -   **Tên loại tấn công:** Phishing kết hợp **Typosquatting** (giả mạo tên miền giống GitHub nhưng sai chính tả:  `githuh-security.com`).
        
    -   **Chi tiết giả mạo:** Sử dụng tên miền sai lệch (`githuh` thay vì `github.com`) và dùng chiêu trò hù dọa khóa tài khoản nhằm ép người dùng bấm link đăng nhập giả để đánh cắp thông tin.
        
2.  **Tình huống 2:**
    
    -   **Tên cạm bẫy:** Mã độc ngụy trang / Crack phần mềm độc hại (Infostealer).
        
    -   **Lý do nguy hiểm:** Yêu cầu "tắt Windows Defender" là dấu hiệu cấu hình để vô hiệu hóa lớp phòng thủ cốt lõi của hệ điều hành, cho phép mã độc (như Infostealer) âm thầm chạy nền, đánh cắp cookie, session token, thông tin ví và mật khẩu lưu trên trình duyệt.
        
3.  **Áp dụng Quy tắc 5 KHÔNG:**
    
    -   **Tình huống 1 (Email giả mạo):** Áp dụng **KHÔNG bấm linh tinh** (không click vào các đường link lạ từ email cảnh báo chưa rõ nguồn gốc).
        
    -   **Tình huống 2 (File Crack):** Áp dụng **KHÔNG tải bừa** (không tải phần mềm bẻ khóa, không rõ nguồn gốc) và **KHÔNG tắt các phần mềm bảo mật/Antivirus**.
        
4.  **Quy trình Cấp cứu 4 Bước (nếu đã chạy file crack):**
    
    1.  **Ngắt kết nối mạng:** Ngắt ngay Wi-Fi/Ethernet để chặn mã độc truyền dữ liệu đánh cắp ra ngoài (C2 server).
        
    2.  **Đổi mật khẩu từ thiết bị sạch:** Dùng điện thoại hoặc thiết bị an toàn khác để đổi toàn bộ mật khẩu tài khoản quan trọng và buộc đăng xuất các phiên hiện tại.
        
    3.  **Thu hồi quyền truy cập (Revoke Token):** Vô hiệu hóa các session token, OAuth token, Personal Access Token trên các nền tảng (GitHub, Google, Vercel,...).
        
    4.  **Làm sạch hệ thống:** Quét phần mềm độc hại chuyên sâu hoặc tiến hành cài đặt lại hệ điều hành để dứt điểm mã độc ẩn sâu.
        

## Phần 2 – Chuyển sang Password Manager

1.  **Hậu quả & Kiểu tấn công:**
    
    -   Nếu email nhóm bị lộ mật khẩu, toàn bộ tài khoản GitHub và Vercel cũng bị xâm phạm ngay lập tức vì dùng chung một mật khẩu.
        
    -   **Tên kiểu tấn công:**  **Tấn công nhồi mật khẩu (Credential Stuffing)** hoặc **Hiệu ứng domino tài khoản (Account Takeover via Shared Passwords)**.
        
2.  **Zero-Knowledge Architecture:**
    
    -   Kiến trúc Không-hiểu-biết nghĩa là dữ liệu được mã hóa/giải mã hoàn toàn phía client  trước khi truyền và lưu trữ trên máy chủ Bitwarden. Máy chủ hoàn toàn không nắm giữ Master Password hay khóa giải mã, do đó hacker dù hack được server cũng chỉ thu được các chuỗi dữ liệu mã hóa vô nghĩa.
        
3.  **Thông số cấu hình Password Generator:**

|Thông số|Giá trị cấu hình | 
|-|-|
|Độ dài |Tối thiểu 16 - 20 ký tự |
|Chữ hoa |Có (Bật) |
|Chữ thường |Có (Bật) |
|Chữ số |Có (Bật) |
|Ký tự đặc biệt |Có (Bật) | 

## Phần 3 – Kích hoạt 2FA cho tài khoản GitHub tổ chức

1.  **Lý do chọn Authenticator App thay vì SMS OTP:**
    
    -   **2 Nhược điểm lớn của SMS OTP:**
        
        1.  Dễ bị tấn công **SIM Swapping** (chiếm đoạt số điện thoại qua nhà mạng) / đánh cắp tín hiệu sóng.
            
        2.  Không nhận được mã khi điện thoại mất sóng, đi nước ngoài hoặc đang trên máy bay.
            
2.  **Thứ tự các bước kích hoạt 2FA (Google Authenticator) trên GitHub:**
    
    1.  Đăng nhập GitHub -> Nhấp vào ảnh đại diện chọn **Settings**.
        
    2.  Chọn **Password and authentication** ở menu bên trái.
        
    3.  Tại mục **Two-factor authentication**, nhấn **Enable two-factor authentication**.
        
    4.  Chọn phương thức **Set up using an app** (quét mã QR = Google Authenticator).
        
    5.  Dùng ứng dụng Authenticator quét mã QR xuất hiện trên màn hình -> Nhập mã OTP 6 số do ứng dụng cung cấp vào GitHub để xác nhận hoàn tất.
        
3.  **Quản lý Mã khôi phục (Recovery Codes):**
    
    -   **Nơi nên lưu trữ:** In ra giấy cất vào két sắt cá nhân hoặc lưu mã hóa an toàn trong Password Manager.
        
    -   **Nơi không nên lưu:** Chụp ảnh màn hình lưu trên điện thoại/Cloud công khai, lưu dưới dạng file text (plaintext) trên Desktop, hoặc gửi qua email/chat nhóm.

### **Phần 4 –** Bảo vệ Secrets trước khi push code ( Em muốn lên lớp hỏi thầy Hai )

### 1. Pre-push Checklist (Quét API Keys hardcode)

Trước khi thực hiện lệnh `git push` lên GitHub Public, team cần tuân thủ checklist kỹ thuật sau:

-   **Sử dụng công cụ quét tự động (Secrets Scanning):**
    
    -   Tích hợp **GitGuardian CLI** hoặc **TruffleHog** vào máy tính cá nhân để quét toàn bộ lịch sử Git trước khi push.
        
    -   Cài đặt **GitHub Secret Scanning** trên repository để GitHub tự động chặn nếu phát hiện token/key nhạy cảm.
        
-   **Cấu hình Git Hook (`pre-push`):**
    
    -   Tạo tệp `.git/hooks/pre-push` (hoặc sử dụng thư viện `husky`) để chạy script kiểm tra tự động các chuỗi mẫu như `api_key`,  `password`,  `bearer`,  `secret` trong các tệp sắp được đẩy lên.
        
-   **Kiểm tra thủ công nhanh:**
    
    -   Chạy lệnh tìm kiếm trong terminal:  `git diff --cached` / sử dụng tính năng tìm kiếm của VS Code rà soát toàn bộ các tệp cấu hình, file `config.js`,  `settings.py` xem còn sót giá trị hardcode nào không.
        

### 2. Cấu trúc tệp môi trường (`.env` và `.env.example`)

#### a. Tuyệt đối không đưa tệp `.env` chứa dữ liệu thật lên Git. Thay vào đó, sử dụng tệp `.env.example` làm bản mẫu chung cho các môi trường (Dev, Test, Production).

#### b.  **Quy chuẩn triển khai cho từng môi trường:**

    -   **Dev:** Mỗi lập trình viên tự copy tệp `.env.example` thành `.env` trên máy cá nhân và điền thông số kết nối cục bộ của mình.
        
    -   **Test / Staging:** Cấu hình biến môi trường trực tiếp trên hệ thống CI/CD hoặc giao diện quản lý của nền tảng Hosting (Vercel, Render, AWS).
        
    -   **Production:** Sử dụng dịch vụ quản lý bảo mật chuyên dụng (AWS Secrets Manager, Doppler, Vault) hoặc thiết lập bảo mật mã hóa nghiêm ngặt trên server thực tế.
        

### 3. Hướng dẫn kích hoạt bắt buộc 2FA cho Repository

- Để đảm bảo an toàn tuyệt đối cho mã nguồn, Trưởng nhóm (Owner/Admin) cần cấu hình chính sách bảo mật bắt buộc trên GitHub:

**1.Truy cập Cài đặt Bảo mật Tổ chức/Repository:**

- Vào trang chính của Repository trên GitHub --> Chọn tab **Settings** --> Nhấp vào **Code security and analysis** (hoặc mục **Security** trong phần cài đặt của Organization nếu dùng tài khoản tổ chức).

**2.Bật yêu cầu 2FA (Two-Factor Authentication):**

- Tìm đến phần **Two-factor authentication** --> Tích chọn ô yêu cầu tất cả các thành viên và cộng tác viên tham gia vào repository phải kích hoạt xác thực hai yếu tố.

**3.Thông báo và Xác nhận thành viên:**

- Gửi thông báo cho team yêu cầu bật 2FA qua ứng dụng (như Google Authenticator/GitHub Mobile). Hệ thống sẽ tự động vô hiệu hóa quyền truy cập của các tài khoản chưa bật 2FA cho đến khi họ hoàn tất xác thực.

### 4. Báo cáo đánh giá rủi ro nếu thiếu tệp `.gitignore`

Nếu quên cấu hình tệp `.gitignore` để chặn các tệp nhạy cảm, dự án sẽ phải đối mặt với các rủi ro cực kỳ nghiêm trọng:

-   **Rò rỉ thông tin xác thực vĩnh viễn:** Ngay cả khi phát hiện lỗi và xóa tệp `.env` rồi push lại, tệp đó vẫn nằm trong **Git History**. Kẻ gian có thể dùng lệnh `git log` để khôi phục và đánh cắp toàn bộ API keys, Database credentials hoặc Secret tokens.
    
-   **Thiệt hại tài chính trực tiếp:** Nếu các API Key liên quan đến cổng thanh toán hoặc dịch vụ đám mây (AWS, Google Cloud) bị lộ trên Public Repository, bot tự động của hacker sẽ quét thấy trong vòng vài phút, chiếm đoạt tài nguyên và gây phát sinh cước phí khổng lồ.
    
-   **Nguy cơ tấn công leo thang :** Kẻ tấn công có thể lợi dụng thông tin truy cập cơ sở dữ liệu bị lộ để xâm nhập vào hệ thống backend, đánh cắp dữ liệu khách hàng hoặc cài mã độc vào mã nguồn dự án, ảnh hưởng trực tiếp đến uy tín của doanh nghiệp và đối tác kiểm tra.

# Yêu cầu:
-   Phân tích 3 lớp yếu tố xác thực danh tính số (Something You Know, Something You Have, Something You Are).
    
-   Đánh giá sự đánh đổi (Trade-off) giữa tính tiện lợi và mức độ bảo mật giữa SMS OTP và Thuật toán TOTP (Time-based One-Time Password) qua ứng dụng Authenticator, làm chủ quy trình quản lý Backup Codes.

# Vấn đề:
- Nhóm A (SMS OTP): Cho rằng nên dùng tin nhắn SMS gửi mã 6 số về số điện thoại vì tiện lợi, quen thuộc, ai cũng có SIM điện thoại, không cần cài đặt thêm ứng dụng nào.  

- Nhóm B (Authenticator App - TOTP): Cho rằng SMS đã lỗi thời và chứa nhiều lỗ hổng nghiêm trọng, bắt buộc phải dùng ứng dụng sinh mã TOTP như Google Authenticator hoặc Microsoft Authenticator.

# Cách làm:

## **Phần 1: Phân tích 2 Giải pháp Xác thực**

###  1. Yếu tố xác thực danh tính số:
#### a. 3 yếu tố:
- Know (Biết): Thông tin trí nhớ (Mật khẩu, PIN, câu hỏi bảo mật).
- Have (Có): Thiết bị vật lý hoặc token sở hữu (Điện thoại, SIM, YubiKey, App Authenticator).
- Are (Là): Trắc học hành vi/sinh trắc học (Vân tay, khuôn mặt FaceID, mống mắt).

#### b. Trong mô hình 2FA:
-   **Mật khẩu** đại diện cho ** Know**.
-   **Mã OTP (SMS/TOTP)** đại diện cho ** Have** (chứng minh bạn đang nắm giữ thiết bị nhận SMS hoặc điện thoại chứa app Authenticator).

### 2. Nguyên lý hoạt động của TOTP trong Chế độ Máy bay:

- Shared Secret (Khóa bí mật chia sẻ): Khi quét mã QR thiết bị, một chuỗi khóa bí mật ($K$) được lưu đồng thời trên server và bộ nhớ an toàn của điện thoại.
- Lấy thời gian hiện tại kết hợp với *Secret*

## Phần 2: Lập bảng So sánh Trade-off & Ra quyết định

### 3. Bảng so sánh chi tiết:
|**Tiêu chí đánh giá**|**Giải pháp 1: SMS OTP**|**Giải pháp 2: TOTP Authenticator** |
|-|-|-|
|1. Khả năng chống SIM Swapping & SS7 |**Rất kém:** Dễ bị chiếm đoạt SIM qua Social Engineering hoặc nghe lén qua lỗ hổng hạ tầng SS7. |**Tối ưu:** Khóa bí mật ($K$) nằm trong chip thiết bị, không thể bị đánh cắp từ xa qua hạ tầng viễn thông. |
|2. Tính sẵn sàng khi Offline / Nước ngoài |**Phụ thuộc mạng:** Mất sóng, nghẽn mạng hoặc công tác nước ngoài (chưa Roaming) sẽ không nhận được mã. |**Sẵn sàng 100%:** Hoạt động Offline hoàn toàn, mọi lúc mọi nơi kể cả trên máy bay. |
|3. Độ tiện dụng & Chi phí vận hành |**Tốn chi phí:** Quen thuộc với người dùng phổ thông nhưng doanh nghiệp phải trả phí SMS Gateway duy trì.|**Miễn phí & Tiện lợi:** Miễn phí 100% vận hành, thao tác quét mã/nhập OTP từ app nhanh chóng. |
|4. Rủi ro khi mất điện thoại |**Dễ khôi phục nhưng rủi ro:** Làm lại SIM là lấy lại được mã, nhưng nguy cơ lộ tin nhắn trên màn hình khóa. |**Cần cơ chế khôi phục:** Phải dùng Backup Codes hoặc tính năng mã hóa Cloud Sync để khôi phục. |


### 4. Kết luận & Khuyến nghị cho PixelForge Studio

-   **Giải pháp lựa chọn:** Bắt buộc áp dụng **TOTP Authenticator** (Giải pháp 2) cho toàn bộ nhân sự và tài khoản GitHub Enterprise.
    
-   **Lý do:**
    
    1.  **Chống SIM Swapping:** Loại bỏ hoàn toàn nguy cơ kẻ xấu tấn công nhà mạng để chiếm đoạt tài khoản quản trị kho mã nguồn chứa tài sản hàng trăm ngàn USD.
        
    2.  **Đáp ứng linh hoạt:** Đảm bảo lập trình viên làm việc liên tục khi bay, công tác nước ngoài (GDC) hoặc ở khu vực không có sóng di động vẫn sinh được mã 2FA.
        

## Phần 3: Quản lý Rủi ro & Backup Codes

### 5. Quản lý Backup Codes

-   **Mục đích:** Là cơ chế cấp cứu khẩn cấp (mỗi mã dùng 1 lần) giúp đăng nhập tài khoản khi bị mất điện thoại, hỏng ứng dụng Authenticator hoặc đổi máy mới.
    
-   **2 Vị trí lưu trữ an toàn tuyệt đối:**
    
    1.  In ra giấy và cất trong **két sắt / tủ khóa cá nhân**.
        
    2.  Lưu trữ trong **Trình quản lý mật khẩu mã hóa** có bảo mật master key.
        
-   **1 Sai lầm tai hại cần tránh:** Lưu bản rõ (plaintext) trong các ứng dụng ghi chú online không mã hóa, chụp ảnh màn hình lưu trong Cloud Photos, hoặc gửi qua tin nhắn/email cá nhân.

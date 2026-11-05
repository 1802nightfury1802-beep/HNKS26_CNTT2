# Yêu cầu:
-   Chỉ ra ký tự lạ trong URL trên và giải thích tại sao nó có thể đánh lừa người dùng.
    
-   Đề xuất quy trình kiểm tra URL nhanh bằng mắt thường và công cụ hỗ trợ trước khi nhập Master Password.
# Vấn đề:
- Sinh viên nộp một đoạn mã giả lập kiểm tra chuỗi URL nhưng lại bỏ qua việc kiểm tra các ký tự Unicode gây nhầm lẫn (Homograph attack).

# Cách làm:

### 1. Phân tích ký tự lạ và nguyên nhân

-   Ký tự lạ: Chữ **`ú`** trong từ `githúb`.
    
-   Giải thích: Đây là cuộc tấn công **Homograph (IDN Homograph Attack)**. Ký tự `ú` có hình dáng rất giống chữ `u` thông thường, khiến mắt người dễ bị đánh lừa tưởng đây là trang GitHub chính chủ. Thực chất, tên miền này chứa ký tự Unicode khác biệt hoàn toàn, dẫn người dùng đến một website giả mạo do kẻ gian kiểm soát nhằm đánh cắp tài khoản.
    

### 2. Quy trình kiểm tra nhanh trước khi nhập mật khẩu

-   Kiểm tra bằng mắt thường:
    
    -   **Soi kỹ tên miền chính (Domain):** Luôn nhìn vào phần ngay trước dấu `/` đầu tiên (phải chính xác là `github.com`).
        
    -   **Cảnh giác với ký tự bất thường:** Chú ý các dấu phụ hoặc các cặp ký tự dễ nhầm lẫn .
        
-   **Sử dụng công cụ hỗ trợ:**
    
    -   Trình quản lý mật khẩu (Password Manager): Sử dụng các tiện ích như Bitwarden, 1Password hoặc trình duyệt. Nếu trình quản lý mật khẩu **không tự động điền thông tin**, đó là dấu hiệu gần như chắc chắn tên miền là giả mạo (vì tên miền không khớp với dữ liệu lưu trữ của `github.com`).
        
    -   Công cụ quét an toàn: Dán URL vào các nền tảng kiểm tra uy tín như **VirusTotal**/ **Google Safe Browsing** nếu có nghi ngờ.

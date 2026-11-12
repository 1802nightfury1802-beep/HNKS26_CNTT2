# Vấn đề:
Lan cho rằng Web UI cá nhân là riêng tư, nhưng theo điều khoản của Public LLM, dữ liệu này sẽ bị lưu trữ và dùng để huấn luyện lại (Re-training) mô hình AI, khiến PII bị lọt lướt ra toàn thế giới.

# Yêu cầu:
- **Phần 1 (Rà soát & Phân loại):** Dựa vào Mục 2.1 Lesson 02, liệt kê 3 loại dữ liệu thuộc "Vùng cấm tuyệt đối". Đối chiếu với Bảng dữ liệu trên và chỉ ra chính xác từng trường thông tin vi phạm nhóm dữ liệu nào.

- **Phần 2 (Xử lý sự cố):** Đánh giá nguy cơ pháp lý MartX phải chịu và đề xuất 3 bước xử lý sự cố khẩn cấp cho Phòng IT.

# Cách làm:

### Phần 1: Rà soát & Phân loại dữ liệu thuộc "Vùng cấm tuyệt đối"

Theo chính sách an toàn AI doanh nghiệp, 3 nhóm dữ liệu thuộc **Vùng cấm tuyệt đối** (tuyệt đối không đưa lên các công cụ AI công cộng) bao gồm:

1.  **Dữ liệu định danh cá nhân (PII - Personally Identifiable Information):** Thông tin giúp nhận diện trực tiếp một cá nhân cụ thể.
    
2.  **Dữ liệu tài chính & thanh toán nhạy cảm (PCI / Financial Data):** Thông tin tài khoản, thẻ ngân hàng, mã bảo mật, lịch sử giao dịch hoặc hạn mức tài chính.
    
3.  **Bí mật kinh doanh & Dữ liệu nội bộ độc quyền (Confidential / Proprietary Business Data):** Danh sách khách hàng cốt lõi (VIP), chiến lược giá, mã nguồn, tài liệu nội bộ chưa công bố.
    

**Đối chiếu chi tiết các trường dữ liệu bị rò rỉ của MartX:**

|Trường dữ liệu trong bảng |Dữ liệu thực tế bị lộ |Nhóm dữ liệu vi phạm |
|-|-|-|
|Họ và tên Khách hàng |Nguyễn Thị Mai, Trần Văn Hùng, Lê Hoàng Nam |1. Dữ liệu định danh cá nhân (PII)|
|Số điện thoại |`0912.345.678`, `0988.777.666`, `0903.111.222` |1. Dữ liệu định danh cá nhân (PII) |
|Địa chỉ nhà |123 Nguyễn Trãi (Q1), Biệt thự 15 Thảo Điền, Số 45 Lê Lợi (Q3) |1. Dữ liệu định danh cá nhân (PII) |
|Thông tin Thẻ / Tài chính |Số thẻ ATM (`9704...`), Hạn mức tín dụng (`500 triệu`), **Mã PIN/CVV (`888`)** |2. Dữ liệu tài chính & thanh toán nhạy cảm _(Mức độ nghiêm trọng cực cao)_ |
|Tệp danh sách khách hàng VIP |Toàn bộ bảng phân hạng khách hàng VIP của MartX |3. Dữ liệu nội bộ & Bí mật kinh doanh |

### Phần 2: Đánh giá nguy cơ pháp lý & Quy trình xử lý sự cố

**1. Nguy cơ pháp lý MartX phải đối mặt:**

-   **Vi phạm pháp luật bảo vệ dữ liệu cá nhân:** Vi phạm **Nghị định 13/2023/NĐ-CP** của Việt Nam về Bảo vệ dữ liệu cá nhân (làm lộ dữ liệu cá nhân cơ bản và dữ liệu cá nhân nhạy cảm như thông tin tài chính mà không có sự đồng ý của chủ thể).
    
-   **Vi phạm tiêu chuẩn bảo mật thanh toán:** Vi phạm nghiêm trọng chuẩn bảo mật thẻ thanh toán **PCI-DSS** (đặc biệt là hành vi lưu trữ và làm lộ mã CVV/PIN).
    
-   **Rủi ro kiện tụng và mất uy tín:** Khách hàng VIP có thể khởi kiện yêu cầu bồi thường thiệt hại nếu tài khoản bị chiếm đoạt; MartX đối mặt với án phạt hành chính nặng và khủng hoảng niềm tin thương hiệu.
    

**2. 3 bước xử lý sự cố khẩn cấp dành cho Phòng IT:**

1.  **Bước 1: Khoanh vùng & Thu hồi dữ liệu :**
    
    -   Yêu cầu Lan xóa ngay lập tức đoạn hội thoại chứa dữ liệu trên ChatGPT, đồng thời vào phần cài đặt tắt tính năng _"Improve the model for everyone"_ (không cho phép dùng dữ liệu huấn luyện).
        
    -   Liên hệ bộ phận hỗ trợ của nhà cung cấp AI (OpenAI) để gửi yêu cầu xóa dữ liệu khỏi máy chủ (Data Deletion Request) theo quy định bảo vệ dữ liệu.
        
2.  **Bước 2: Phong tỏa & Bảo vệ tài khoản khách hàng :**
    
    -   Phối hợp ngay với bộ phận vận hành/ngân hàng liên kết để **khóa tạm thời thẻ ATM, vô hiệu hóa mã PIN/CVV (`888`)** của tài khoản MartX Pay và yêu cầu khách hàng Lê Hoàng Nam, Nguyễn Thị Mai cấp lại thông tin bảo mật mới nhằm ngăn chặn giao dịch gian lận.
        
3.  **Bước 3: Kiểm toán, Báo cáo & Chặn kỹ thuật :**
    
    -   Rà soát toàn bộ lịch sử truy cập (DLP - Data Loss Prevention) để kiểm tra xem còn nhân viên nào từng tải file nội bộ lên AI hay không.
        
    -   Kích hoạt tường lửa/chính sách chặn truy cập các trang Public AI trên mạng nội bộ công ty, đồng thời báo cáo sự cố tới cơ quan chức năng trong vòng 72 giờ.

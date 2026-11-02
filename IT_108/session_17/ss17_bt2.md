# Yêu cầu:
- Viết lại biên bản giải trình kỹ thuật chuẩn xác theo đúng 4 bước vòng đời của HTTP Request khi bệnh nhân truy cập kết quả xét nghiệm.

- Giải thích rõ ràng bằng nguyên lý bộ nhớ: Tại sao hành động sửa chữ trên Tab Elements của bạn thực tập sinh hoàn toàn không có giá trị lưu trữ trên máy chủ CarePulse?



# Vấn đề: 
- Biên bản chứa nhiều nhận định sai lầm nghiêm trọng về kiến trúc mạng và nguyên lý trình duyệt web:



# Cách làm:

## Phần 1: Phân tích vấn đề

### 1. Chỉ ra 4 điểm sai lệch kỹ thuật của thực tập sinh

1.  **Sai lệch về vai trò DNS:** Trình duyệt **luôn bắt buộc** phải thông qua hệ thống phân giải tên miền (DNS) để dịch tên miền `carepulse.vn` thành địa chỉ IP của máy chủ trước khi có thể thiết lập kết nối, chứ không thể gửi thẳng URL tới máy chủ mà bỏ qua DNS.
    
2.  **Sai lệch về quy trình TCP/TLS:** Giao thức HTTPS không thể tự động mở kết nối mà không cần bắt tay. Trình duyệt phải thực hiện quá trình bắt tay TCP (3-way handshake) kết hợp bắt tay TLS (đối với HTTPS) để thiết lập kênh truyền mã hóa an toàn trước khi gửi bất kỳ dữ liệu nào.
    
3.  **Sai lệch về mã trạng thái HTTP (404 vs 500):** Khi cơ sở dữ liệu backend bị sập nguồn hoặc gặp lỗi mã nguồn xử lý truy vấn, mã phản hồi chuẩn từ Web Server phải là **500 Internal Server Error** (lỗi phía máy chủ), chứ không phải **404 Not Found** (lỗi không tìm thấy đường dẫn/tài nguyên). Giải thích với bệnh nhân rằng hồ sơ "đã bị xóa vĩnh viễn" là cực kỳ vô trách nhiệm và sai bản chất kỹ thuật.
    
4.  **Sai lệch về cơ chế DevTools :** Thao tác chỉnh sửa mã HTML trên Tab Elements của Chrome DevTools chỉ thay đổi cấu trúc hiển thị tạm thời trên **bộ nhớ RAM của máy cục bộ **. Thao tác này hoàn toàn không tác động hay lưu trữ được gì lên cơ sở dữ liệu gốc nằm ở phía máy chủ.
    

### 2. Phân tích mã lỗi HTTP và hậu quả tâm lý bệnh nhân

-   **Vì sao phải là mã 500 thay vì 404?**
    
    -   Mã **404 Not Found** có nghĩa là đường dẫn URL (`/records/patient8821`) không tồn tại trên hệ thống hoặc đã bị gỡ bỏ vĩnh viễn.
        
    -   Mã **500 Internal Server Error** biểu thị rằng máy chủ vẫn nhận được yêu cầu nhưng gặp sự cố kỹ thuật bên trong (như sập database, lỗi code backend) không thể xử lý hoàn tất. Do hệ thống "CarePulse" vẫn tồn tại đường dẫn hồ sơ của bệnh nhân nhưng máy chủ CSDL bị quá tải/sập, mã chính xác phải là **500**.
        
-   **Hậu quả tai hại đối với tâm lý bệnh nhân:** Nếu thông báo nhầm rằng hồ sơ "đã bị xóa vĩnh viễn" (mã 404), bệnh nhân sẽ rơi vào trạng thái hoảng loạn, lo sợ mất toàn bộ lịch sử y tế, mất niềm tin tuyệt đối vào tính bảo mật và sự chuyên nghiệp của nền tảng y tế, thậm chí dẫn đến khiếu nại pháp lý không đáng có.
    

## Phần 2: Sửa lỗi & Hoàn thiện giải pháp

### 3. Biên bản giải trình kỹ thuật chuẩn xác 

**[BIÊN BẢN SỰ CỐ KỸ THUẬT CAREPULSE - CA BỆNH ÁN #8821 (ĐÃ HIỆU CHỈNH)]**

-   **Bước 1 :** Khi bệnh nhân Nguyễn Văn A bấm vào nút "Xem Kết Quả Xét Nghiệm Máu", trình duyệt tiếp nhận URL và truy vấn hệ thống DNS để chuyển đổi tên miền `carepulse.vn` thành địa chỉ IP chính xác của máy chủ CarePulse.
    
-   **Bước 2 :** Trình duyệt thực hiện quá trình bắt tay TCP (3-way handshake) để thiết lập kết nối mạng với máy chủ, tiếp theo là quá trình bắt tay TLS để thiết lập kênh truyền dữ liệu mã hóa an toàn (HTTPS).
    
-   **Bước 3 :** Trình duyệt gửi gói tin HTTP GET Request kèm định danh bệnh nhân tới máy chủ. Do máy chủ cơ sở dữ liệu gặp sự cố quá tải/sập nguồn, hệ thống không thể truy vấn dữ liệu và trả về mã lỗi **500 Internal Server Error** kèm giao diện thông báo lỗi hệ thống tạm thời.
    
-   **Bước 4 :** Trình duyệt tiếp nhận mã phản hồi lỗi, phân tích cấu trúc HTML để dựng cây DOM Tree, kết hợp CSSOM để xử lý giao diện Layout và hiển thị thông báo lỗi lên màn hình cho người dùng.
    

### 4. Giải thích nguyên lý bộ nhớ: Tại sao sửa chữ trên Tab Elements không lưu lên máy chủ?

Hành động gõ sửa chữ trên Tab Elements của Chrome DevTools chỉ can thiệp vào **bộ nhớ RAM tạm thời của trình duyệt trên máy cục bộ (Client-side)**. Dữ liệu gốc của hồ sơ bệnh án được lưu trữ an toàn trên **Cơ sở dữ liệu của máy chủ **. Ngay khi người dùng tải lại trang (`F5` hoặc `Reload`), trình duyệt sẽ gửi lại yêu cầu mới tới máy chủ và toàn bộ các thay đổi cục bộ trên DevTools sẽ bị xóa sạch, trả lại nguyên trạng dữ liệu từ hệ thống.

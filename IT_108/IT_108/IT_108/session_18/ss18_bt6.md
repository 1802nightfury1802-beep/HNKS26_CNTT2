# Yêu cầu:
-   **Chức năng 1 (Phân tích hiệu năng):** Sử dụng tab Network và tính năng Disable Cache để phân tích thời gian nạp của từng gói tin.
    
-   **Chức năng 2 (Gỡ lỗi mạng):** Xác định các Request bị tô đỏ (Status 404) và các file hình ảnh dung lượng quá lớn làm kéo dài biểu đồ Waterfall.

# Vấn đề:
- Trang chủ [**portal.greenlog.vn**](http://portal.greenlog.vn) tải mất **20 giây** mới hiện đầy đủ. Shipper phàn nàn rằng họ không thấy hình ảnh bản đồ lộ trình dù mạng vẫn khỏe.

# Cách làm:

### Phần 1. Phân tích: Xác định nút thắt cổ chai (Bottleneck) qua biểu đồ Waterfall

-   **Nút thắt cổ chai:** Trên biểu đồ Waterfall, nút thắt chính là các **tệp hình ảnh bản đồ lộ trình có dung lượng quá lớn** (chưa được tối ưu/nén) và các **request bị lỗi 404 Not Found** (tệp bị đứt link, cố gắng tải nhưng không thành công).
    
-   **Hậu quả:** Các tệp hình ảnh nặng chiếm toàn bộ băng thông mạng, làm chậm thời gian tải xuống, khiến biểu đồ Waterfall kéo dài lê thê và Rendering Engine bị kẹt, dẫn đến việc giao diện bản đồ không hiển thị kịp thời cho shipper.
    

### Phần 2. Triển khai: Quy trình 3 bước tối ưu hiệu năng Portal

1.  **Bước 1: Khắc phục lỗi đứt link (404):**
    
    -   Kiểm tra lại đường dẫn (URL) của các tài nguyên bị tô đỏ trong tab Network, cập nhật lại đường dẫn chính xác hoặc khôi phục các tệp bị thiếu trên máy chủ để loại bỏ thời gian chờ vô ích từ các request lỗi.
        
2.  **Bước 2: Nén tài nguyên hình ảnh:**
    
    -   Sử dụng các công cụ nén ảnh (như: TinyPNG, WebP conversion) để giảm kích thước dung lượng file hình ảnh bản đồ lộ trình xuống mức tối thiểu mà vẫn đảm bảo chất lượng hiển thị, giúp tăng tốc độ truyền tải trên mạng.
        
3.  **Bước 3: Bật cơ chế Browser Cache cho tài nguyên tĩnh:**
    
    -   Cấu hình HTTP Headers (như `Cache-Control` hoặc `ETag`) phía máy chủ để trình duyệt lưu trữ các tệp tĩnh (CSS, JS, hình ảnh) vào bộ nhớ đệm cục bộ, tránh việc phải tải lại toàn bộ ở các lần truy cập sau.
        

### Phần 3. Kiểm thử: Ý nghĩa của mã 304 Not Modified

Khi reload trang mà nhận mã **304 Not Modified**, đây là một **tín hiệu rất tốt** vì những lý do sau:

-   **Tiết kiệm băng thông tối đa:** Máy chủ không cần phải truyền tải lại toàn bộ nội dung tệp (CSS, JS, hình ảnh) vì trình duyệt xác nhận rằng bản lưu trong bộ nhớ đệm (Cache) vẫn còn hoàn toàn đồng bộ và mới nhất.
    
-   **Tăng tốc độ tải trang:** Giảm thiểu đáng kể thời gian chờ đợi phản hồi từ mạng, giúp trang web hiển thị gần như tức thì và giảm tải áp lực xử lý cho máy chủ hệ thống.

# Vấn đề:

- Nhân viên CSKH MartX tư vấn cho khách hàng trên 1 phiên chat ChatGPT duy nhất qua 45 lượt liên tục.
- Sau đó nhân viên thắc mắc: "Tại sao mới nói lúc đầu phiên chat mà AI đã bị trí nhớ ngắn hạn quên mất?"

# Yêu cầu:

- **Phần 1: Giải thích hình tượng Chiếc cốc nước**

Dùng hình ảnh ẩn dụ "Chiếc cốc nước" giải thích cho nhân viên lý do AI quên thông tin ở Lượt 1.

- **Phần 2: Phương án quản lý RAM bộ nhớ**

Đề xuất 2 phương án (thao tác người dùng & thiết kế hệ thống) để luồng tư vấn không bị tràn cốc.

# Cách làm:

### Phần 1: Giải thích hình tượng "Chiếc cốc nước" (Context Window)

Hãy hình dung bộ nhớ ngắn hạn của AI giống như **một chiếc cốc nước có dung tích cố định**.

-   **Quy tắc hoạt động của cốc:** Mỗi khi bạn hoặc AI nhắn một câu, nước sẽ được rót thêm vào cốc (tính tổng token của cả lịch sử trò chuyện).
    
-   **Hiện tượng tràn cốc :** Khi phiên chat kéo dài qua 45 lượt với hàng loạt câu trả lời dông dài, lượng nước đã đổ đầy tràn miệng cốc. Vì dung tích có hạn, hệ thống buộc phải **đổ bớt phần nước ở đáy cốc đi** (các tin nhắn cũ từ Lượt 1) để lấy chỗ chứa cho dòng nước mới đang tràn vào.
    
-   **Nguyên nhân AI hỏi lại mã đơn ở Lượt 42:** Do Lượt 1 (`#MTX-9988`) nằm ở đáy cốc và đã bị văng ra ngoài từ lâu do cơ chế cắt gọt dữ liệu cũ (Truncation), AI hoàn toàn không còn dữ liệu đó trong bộ nhớ RAM tạm thời nữa. Việc AI gọi khách là "chị Mai" và quên mã đơn là hậu quả tất yếu của việc phiên chat quá dài dòng mà không được dọn dẹp.
    

### Phần 2: Phương án quản lý RAM bộ nhớ chống tràn cốc

Để giải quyết triệt để tình trạng "mất trí nhớ" của AI trong các phiên tư vấn CSKH dài, cần áp dụng đồng thời hai giải pháp:

#### 1. Phương án thao tác từ người dùng (Vận hành thủ công)

-   **Nguyên tắc "Đóng phiên cũ, mở phiên mới":**
    
    -   Khi chuyển sang vấn đề mới hoặc sau khi chốt xong một vấn đề chính (ví dụ: tư vấn xong danh mục rau củ), nhân viên CSKH phải **tạo một phiên chat  hoàn toàn mới**.
        
    -   Không dùng duy nhất 1 link chat kéo dài qua hàng chục lượt cho nhiều vấn đề khác nhau.
        
-   **Kỹ thuật ghim thông tin :**
    
    -   Ở đầu mỗi phiên chat mới hoặc mỗi khi sang vấn đề đổi trả/hoàn tiền, nhân viên cần chủ động tóm tắt lại thông tin cốt lõi, thay vì mặc định AI vẫn nhớ từ đầu buổi.
        

#### 2. Phương án thiết kế hệ thống (Tự động hóa kỹ thuật)

-   **Sử dụng cơ chế RAG (Retrieval-Augmented Generation) + Memory Vector:**
    
    -   Xây dựng hệ thống CSKH tích hợp bộ nhớ dài hạn tự động trích xuất thông tin định danh (Tên, Mã đơn hàng) lưu vào cơ sở dữ liệu nền, thay vì bắt LLM phải nhớ toàn bộ đoạn chat thô.
        
-   **Cấu hình Truncation thông minh (Smart Summarization):**
    
    -   Thay vì xóa văng các tin nhắn cũ ở đáy cốc, hệ thống backend phải tích hợp mô hình phụ để **tự động tóm tắt** các lượt chat cũ thành một đoạn ngắn gọn. Đoạn tóm tắt này chiếm rất ít token và luôn được giữ lại trong "cốc" giúp AI không bao giờ bị quên gốc gác khách hàng.

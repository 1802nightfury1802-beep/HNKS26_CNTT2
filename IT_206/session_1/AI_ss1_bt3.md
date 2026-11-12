# Vấn đề:

Bạn được giao nhiệm vụ viết một cuốn cẩm nang ngắn hướng dẫn sinh viên khóa mới cách học lập trình cùng AI an toàn và hiệu quả.

# Yêu cầu:
Sử dụng kỹ thuật chia nhỏ prompt (Prompt Chaining) để viết cẩm nang theo từng phần:

- Phần 1: Cách AI đoán từ (LLM hoạt động thế nào).

- Phần 2: 3 cách nhận diện ảo giác của AI.

- Phần 3: Cấu trúc prompt mẫu tối ưu bằng khung CREATE.

# Cách làm:

### Phần 1: Cách AI đoán từ (LLM hoạt động thế nào)

Large Language Models (LLM) không "hiểu" code hay ngôn ngữ theo tư duy con người, mà hoạt động dựa trên **xác suất toán học**:

-   **Cơ chế Token hóa:** Văn bản được chia thành các mảnh nhỏ gọi là token (từ, âm tiết hoặc ký tự).
    
-   **Dự đoán từ tiếp theo:** Dựa trên hàng tỷ tham số đã huấn luyện, AI tính toán xác suất từ nào có khả năng xuất hiện cao nhất tiếp theo trong chuỗi ngữ cảnh.
    
-   **Hệ quả cho lập trình viên:** AI không có ý thức đúng/sai tuyệt đối; nó chỉ đang "nối từ" sao cho mượt mà nhất. Do đó, nếu prompt không rõ ràng, AI rất dễ sinh ra các đoạn code trông có vẻ chuẩn cú pháp nhưng thực chất chứa logic sai hoặc hàm ảo.
    

### Phần 2: 3 cách nhận diện ảo giác của AI (Hallucination)

Khi học lập trình, ảo giác của AI cực kỳ nguy hiểm vì code sai có thể gây lỗi biên dịch hoặc lỗ hổng bảo mật. Hãy áp dụng 3 cách nhận diện sau:

1.  **Kiểm tra thư viện/API "ma":**
    
    -   _Dấu hiệu:_ AI tự bịa ra các hàm, phương thức hoặc tên thư viện không hề tồn tại trong tài liệu chính thức (documentation) của ngôn ngữ/framework đó.
        
    -   _Cách check:_ Luôn tra cứu trang chủ chính thức của thư viện.
        
2.  **Lỗi logic ẩn cấu trúc:**
    
    -   _Dấu hiệu:_ Code chạy được ở bài toán nhỏ nhưng sập khi gặp ngoại lệ (edge cases) hoặc dùng sai kiểu dữ liệu ngầm định.
        
    -   _Cách check:_ Yêu cầu AI tự viết test cases (unit test) để kiểm chứng.
        
3.  **Mâu thuẫn ngữ cảnh trực diện:**
    
    -   _Dấu hiệu:_ Câu trả lời trước đá chân câu trả lời sau, hoặc giải pháp đưa ra đi ngược lại với ràng buộc kỹ thuật bạn đã đặt ra ở đầu prompt.
        

### Phần 3: Cấu trúc Prompt mẫu tối ưu bằng khung CREATE

Khung **CREATE** giúp bạn kiểm soát hoàn toàn câu lệnh khi nhờ AI viết hoặc giải quyết bài toán code:

-   **C (Character - Vai trò):** Đóng vai kỹ sư phần mềm cao cấp, mentor lập trình tận tâm.
    
-   **R (Request - Yêu cầu):** Viết hàm Python đọc file CSV và lọc các dòng có giá trị vượt ngưỡng.
    
-   **E (Example - Ví dụ mẫu):** Cung cấp cấu trúc mẫu dữ liệu đầu vào và kết quả đầu ra mong đợi.
    
-   **A (Adjustment - Ràng buộc / Ngoại lệ):** Xử lý trường hợp file trống, thiếu cột hoặc định dạng sai; tối ưu hiệu suất bộ nhớ.
    
-   **T (Tone - Văn phong / Định dạng):** Ngắn gọn, chuyên nghiệp, giải thích rõ các bước logic quan trọng bằng comment trong code.
    
-   **E (Evaluation - Tiêu chí đánh giá):** Code phải chạy đúng, có xử lý ngoại lệ (`try-except`) và tuân thủ chuẩn PEP 8.
    

> **Prompt mẫu hoàn chỉnh:** *"Bạn là kỹ sư phần mềm cao cấp. Hãy viết giúp tôi một hàm Python đọc file CSV và lọc các dòng có doanh thu vượt ngưỡng X.
> 
> Định dạng dữ liệu mẫu: `[ {'id': 1, 'revenue': 500}, ... ]`.
> 
> **Ràng buộc:** Bắt buộc phải xử lý ngoại lệ khi file không tồn tại hoặc dữ liệu bị thiếu cột `revenue`.
> 
> Trình bày code gọn gàng, kèm giải thích ngắn gọn qua comment, tuân thủ chuẩn PEP 8."*

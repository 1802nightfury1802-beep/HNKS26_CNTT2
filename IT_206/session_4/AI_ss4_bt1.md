# Vấn đề:
- Cửa hàng cần tự động hóa quy trình xử lý thông tin liên quan đến Chain-of-Thought, Prompt Chaining, xử lý đứt gãy.

# Yêu cầu:
-  **Bước 1: Thiết kế giải pháp (I/O)**

Xác định rõ Input của bài toán gồm những gì, và cấu trúc Output mong muốn.

- **Bước 2: Viết prompt và chạy thử**

Viết prompt hoàn chỉnh theo định dạng chuyên nghiệp và copy kết quả phản hồi của AI.

# Cách làm:
### Bước 1: Thiết kế giải pháp (I/O)

-   **Input (Đầu vào):**
    
    -   `customer_input`: Dữ liệu thô từ khách hàng (có thể bao gồm thông tin khiếu nại, yêu cầu đổi trả, hoặc câu hỏi, đôi khi bị trống trường tên hoặc thiếu mã đơn hàng).
        
    -   `order_context`: Thông tin hệ thống đơn hàng (nếu có, dạng JSON hoặc text).
        
-   **Output (Đầu ra cấu trúc):**
    
    -   Trả về định dạng JSON gồm các trường:
        
        -   `status`: Trạng thái xử lý (`SUCCESS`,  `MISSING_DATA`,  `ERROR`).
            
        -   `reasoning_steps`: Các bước tư duy logic của AI để phân tích vấn đề (Chain-of-Thought).
            
        -   `extracted_info`: Thông tin đã trích xuất (Mã đơn, Vấn đề chính).
            
        -   `action_plan`: Hướng giải quyết tiếp theo cho nhân viên hoặc hệ thống.
            
        -   `response_template`: Mẫu câu trả lời chuyên nghiệp gửi khách hàng.
            

### Bước 2: Viết prompt hoàn chỉnh:

Bạn có thể sử dụng mẫu Prompt chuyên nghiệp sau đây:

Markdown

```
Role: Bạn là Chuyên gia Tự động hóa Dịch vụ Khách hàng và Xử lý Lôgic Dữ liệu.
Task: Phân tích yêu cầu khách hàng, áp dụng tư duy chuỗi logic (Chain-of-Thought), kiểm tra lỗi dữ liệu trống/sai lệch và đưa ra phương án xử lý theo chuẩn JSON cấu trúc.

---
[DỮ LIỆU ĐẦU VÀO]
- Khách hàng gửi: "{{customer_input}}"
- Dữ liệu đơn hàng hệ thống: "{{order_context}}"

---
[QUY TRÌNH XỬ LÝ - CHAIN OF THOUGHT]
Thực hiện tuần tự các bước tư duy sau trước khi đưa ra kết quả:
Bước 1: Kiểm tra tính toàn vẹn của dữ liệu `customer_input` và `order_context`. Nếu thiếu thông tin cốt lõi (như Mã đơn hàng hoặc nội dung phản hồi trống), đánh dấu lỗi `MISSING_DATA`.
Bước 2: Phân loại bản chất yêu cầu (Khiếu nại, Đổi trả, Tư vấn sản phẩm, hay Phản hồi chung).
Bước 3: Suy luận nguyên nhân logic dựa trên ngữ cảnh cửa hàng.
Bước 4: Đề xuất hành động xử lý và soạn thảo câu trả lời phù hợp, lịch sự cho khách.

---
[RÀNG BUỘC & XỬ LÝ LỖI]
- Nếu phát hiện trường thông tin bắt buộc bị trống hoặc không khớp, KHÔNG ĐƯỢC tự bịa đặt. Phải chuyển `status` thành "MISSING_DATA" và yêu cầu bổ sung đúng trường còn thiếu tại phần `action_plan`.
- Kết quả đầu ra BẮT BUỘC phải là một định dạng JSON hợp lệ, không kèm theo văn bản giải thích ngoài JSON.

---
[CẤU TRÚC KẾT QUẢ MONG MUỐN (JSON)]
```{ 
  "status": "SUCCESS / MISSING_DATA ERROR", 
"reasoning_steps": 
{ 
"step_1_validation": "...", 
"step_2_classification": "...", "step_3_logic_analysis": "..." }, 
"extracted_info": { 
"order_id": "...", 
"issue_type": "..." }, 
"action_plan": "...", 
"response_template": "..."
 }

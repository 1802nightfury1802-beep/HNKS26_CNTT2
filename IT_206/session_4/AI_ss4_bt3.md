# Vấn đề:
Xây dựng giải pháp hoàn chỉnh giải quyết yêu cầu tích hợp liên quan đến Chain-of-Thought, Prompt Chaining, xử lý đứt gãy.

# Yêu cầu:
Báo cáo thiết kế giải pháp + prompt thực thi các bước + kết quả đầu ra sạch lỗi của AI.

# Cách làm:
### 1. Báo cáo thiết kế giải pháp (Solution Design Report)

-   **Bài toán thực tế:** Xây dựng hệ thống tự động xử lý và phản hồi yêu cầu hỗ trợ khách hàng cho một nền tảng Thương mại Điện tử.
    
-   **Kiến trúc Prompt Chaining (3 bước tuần tự khép kín):**
    
    -   **Bước 1 (Phân tích & Trích xuất - CoT):** Nhận raw ticket, sử dụng Chain-of-Thought để suy luận phân loại lỗi, mức độ ưu tiên và trích xuất thực thể (entity).
        
    -   **Bước 2 (Xử lý nghiệp vụ & Phòng thủ dị biệt):** Tiếp nhận dữ liệu chuẩn hóa từ Bước 1, tra cứu logic xử lý và áp dụng cơ chế _fallback/xử lý đứt gãy_ nếu dữ liệu đầu vào thiếu hoặc mâu thuẫn.
        
    -   **Bước 3 (Kiểm định & Tối ưu token):** Làm sạch kết quả, định dạng JSON/Text chuẩn hóa, tối ưu hóa số lượng token trước khi trả về hệ thống đích.
        

### 2. Chuỗi Prompt thực thi (Executable Prompts)

#### Bước 1: Phân tích và Trích xuất (CoT)

Plaintext

```
[Role] Bạn là chuyên gia phân tích dữ liệu hệ thống CSKH.
[Context] Đọc nội dung yêu cầu thô từ khách hàng dưới đây và thực hiện suy luận từng bước (Chain-of-Thought):
1. Xác định ý định chính (Intent) và mức độ khẩn cấp (Urgency: Low/Medium/High/Critical).
2. Trích xuất thông tin cốt lõi: Mã đơn hàng, sản phẩm, vấn đề gặp phải.
3. Phát hiện dữ liệu dị biệt hoặc thiếu sót (nếu có).

[Input Data] "{{raw_ticket_content}}"

[Output Format] Trả về dạng JSON cấu trúc rõ ràng:
{
  "thought_process": "...",
  "intent": "...",
  "urgency": "...",
  "entities": {"order_id": "...", "product": "...", "issue": "..."},
  "has_anomaly": true/false
}

```

#### Bước 2: Xử lý nghiệp vụ & Phòng thủ dị biệt (Fault Handling)

Plaintext

```
[Role] Bạn là hệ thống xử lý logic nghiệp vụ đổi trả/bảo hành.
[Context] Nhận dữ liệu JSON từ Bước 1 để đưa ra hướng giải quyết. 
- Cơ chế phòng thủ: Nếu `has_anomaly` là true hoặc thiếu `order_id`, KHÔNG được crash hệ thống. Hãy gán nhãn `requires_human_review: true` và đưa ra phản hồi yêu cầu khách hàng bổ sung thông tin.
- Nếu dữ liệu hợp lệ, đưa ra giải pháp chuẩn (Hoàn tiền / Đổi trả / Hướng dẫn kỹ thuật).

[Input JSON] "{{json_from_step_1}}"

[Output Format]
{
  "resolution_status": "AUTO_RESOLVED" | "MANUAL_REVIEW",
  "action_plan": "...",
  "draft_response": "..."
}

```

#### Bước 3: Định dạng đầu ra & Tối ưu token

Plaintext

```
[Role] Bạn là trình tối ưu hóa giao diện hệ thống.
[Context] Nhận kết quả từ Bước 2, nén gọn văn bản phản hồi gửi khách hàng sao cho lịch sự, đúng trọng tâm, tối ưu số lượng token (ngắn gọn dưới 100 từ) và loại bỏ các ký tự rác.

[Input Data] "{{json_from_step_2}}"

[Output] Nội dung phản hồi cuối cùng sạch lỗi, sẵn sàng tích hợp API.

```

### 3. Kết quả đầu ra mẫu (Sample Execution Output)

-   **Input giả lập dị biệt:**  `"Tôi mua hàng ko rõ mã đơn, giao sai mẫu, shop giải quyết ngay!!!"`
    
-   **Kết quả đầu ra sạch lỗi từ chuỗi AI:**
    

JSON

```
{
  "status": "success",
  "routing": "MANUAL_REVIEW",
  "customer_message": "Chào bạn, hệ thống ghi nhận yêu cầu đổi trả mẫu sản phẩm của bạn. Do chưa tìm thấy mã đơn hàng, bạn vui lòng cung cấp thêm hình ảnh sản phẩm nhận được và mã đơn để nhân viên hỗ trợ xử lý ngay nhé!"
}
```

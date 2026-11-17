# Vấn đề:
- Bài toán yêu cầu thực hiện tối ưu hóa quy trình Chain-of-Thought, Prompt Chaining, xử lý đứt gãy.

# Yêu cầu:
**Bước 1: Đề xuất 2 prompt mẫu**

Viết rõ 2 prompt tương ứng với 2 phương án giải quyết.

**Bước 2: Lập bảng so sánh Trade-off**

Lập bảng so sánh tiêu chí.

# Cách làm:
### Bước 1: Đề xuất 2 prompt mẫu

#### Giải pháp 1: Prompt Đơn giản (Định hướng nhanh, cấu trúc tối giản)

Plaintext

```
Phân tích yêu cầu khách hàng: "{{ticket}}"
1. Suy luận nhanh nguyên nhân vấn đề (Chain-of-Thought).
2. Xử lý lỗi nếu thiếu dữ liệu (fallback: yêu cầu bổ sung).
3. Đưa ra hướng giải quyết và phản hồi ngắn gọn.

```

#### Giải pháp 2: Prompt Chi tiết (Kiểm soát chặt chẽ, nhiều ràng buộc & phòng thủ)

Plaintext

```
[Role] Bạn là hệ thống điều phối CSKH tự động cao cấp.
[Workflow - Prompt Chaining]
Bước 1 (CoT): Phân tích chi tiết mức độ khẩn cấp (Low/High), trích xuất entities (order_id, issue).
Bước 2 (Fault Handling): Kiểm tra dữ liệu dị biệt. Nếu thiếu order_id hoặc input bất thường, kích hoạt cơ chế `requires_human_review: true`, TUYỆT ĐỐI KHÔNG crash hệ thống.
Bước 3 (Output Generation): Trả về JSON chuẩn cấu trúc kèm thông điệp phản hồi lịch sự, tối ưu hóa token.

[Input] "{{ticket}}"
[Output Format JSON] { "status": "...", "action": "...", "response": "..." }

```

### Bước 2: Lập bảng so sánh Trade-off
|Tiêu chí |Phương pháp 1(đơn giản) |Phương pháp 2(chi tiết) |
|-|-|-|
|Độ dễ hiểu |Cao (dễ viết, dễ bảo trì thủ công) |Trung bình (cần cấu trúc phân tầng rõ ràng) |
|Tốn token |Ít (tiết kiệm chi phí gọi API) |Nhiều hơn (do prompt dài, nhiều ràng buộc hệ thống) |
|Chặn lỗi biên (Robustness) |Trung bình (dễ hallucination khi gặp dữ liệu lạ) |Cực tốt (kiểm soát chặt chẽ nhờ quy tắc phòng thủ) |
|Tính ổn định đầu ra |Thấp/Biến động |Cao, chuẩn hóa định dạng JSON |


### Bước 3: Lựa chọn và Chạy thử

-   **Phương án tối ưu được chọn:**  **Giải pháp 2 (Chi tiết)**.
    
-   **Lý do:** Đối với các bài toán logic phức tạp đòi hỏi Prompt Chaining và xử lý đứt gãy (fault handling), tính ổn định, an toàn hệ thống và khả năng chống dị biệt quan trọng hơn việc tiết kiệm một ít token. Giải pháp 2 giúp kiểm soát luồng dữ liệu chính xác qua từng bước.
    
-   **Kết quả chạy thử (với input giả lập dị biệt: _"Tôi mua nhầm sản phẩm, giải quyết gấp"_):**
    

JSON

```
{
  "status": "MANUAL_REVIEW",
  "action": "Yêu cầu cung cấp mã đơn hàng và ảnh sản phẩm",
  "response": "Chào bạn, hệ thống ghi nhận vấn đề của bạn. Do thiếu mã đơn hàng, bạn vui lòng cung cấp thêm thông tin để nhân viên hỗ trợ đổi trả ngay nhé!"
}
```

# Vấn đề:
Lập trình viên backend phát hiện log hệ thống liên tục báo lỗi: `JSON.parse Error: Unexpected token 'D' in position 0`.

# Yêu cầu:
1. Chỉ ra lý do tại sao AI thường có thói quen tự động sinh ra lời chào hỏi và lời chúc kết luận.

- **Phần 2: Hoàn thiện Prompt ép cấu trúc**

2. Viết lại Prompt hoàn chỉnh với kỹ thuật Negative Constraint và Định dạng đầu ra nghiêm ngặt

# Cách làm:

### Phần 1: Phân tích nguyên nhân lỗi `JSON.parse Error`

-   **Lý do AI tự động sinh lời chào/kết luận:** Các mô hình ngôn ngữ lớn (LLM) được huấn luyện từ tập dữ liệu khổng lồ bao gồm các văn bản hội thoại của con người, mang bản chất trợ lý thân thiện và lịch sự. Do đó, khi nhận prompt mà thiếu đi các ràng buộc phủ định nghiêm ngặt, AI sẽ tự động kích hoạt văn phong giao tiếp xã giao quen thuộc (chào hỏi đầu câu, chúc tụng cuối câu).
    
-   **Hậu quả kỹ thuật:** Khi tích hợp vào hệ thống Backend tự động hóa, hàm `JSON.parse()` yêu cầu chuỗi đầu vào phải là cú pháp JSON thuần túy. Việc AI chèn các ký tự văn bản tự do (ví dụ chữ `D` ở vị trí đầu tiên của lời chào) khiến hàm parse bị lỗi cú pháp `Unexpected token`, làm gián đoạn toàn bộ API pipeline.
    

### Phần 2: Hoàn thiện Prompt ép cấu trúc (Structured Output)

Dưới đây là mẫu Prompt chuẩn được thiết kế áp dụng **Negative Constraint** và ép định dạng nghiêm ngặt để Backend parse thành công 100%:

Markdown

```
# Role & Context
Bạn là một API xử lý dữ liệu tự động cho hệ thống ERP của TechShop. Nhiệm vụ của bạn là nhận biên bản tiếp nhận bảo hành dạng văn bản thô và chuyển đổi thành cấu trúc JSON phục vụ nạp Database.

# Constraints & Negative Prompting (Ràng buộc nghiêm ngặt)
- TUYỆT ĐỐI KHÔNG viết lời chào mở đầu (ví dụ: "Dạ em chào...", "Dưới đây là...").
- TUYỆT ĐỐI KHÔNG viết lời chúc hoặc kết luận ở cuối.
- Không bọc chuỗi JSON trong thẻ markdown code block (không dùng ```json ... ```).
- Chuỗi trả về BẮT BUỘC phải bắt đầu chính xác bằng ký tự `{` và kết thúc bằng ký tự `}`. Nếu vi phạm, hệ thống sẽ bị lỗi.

# Task (Nhiệm vụ)
Chuyển đổi biên bản thô sau thành đối tượng JSON gồm 3 trường: `customer_name`, `device`, `issue`.

# Input Data (Dữ liệu thô)
"Khách hàng Trần Văn A mang máy đến bảo hành chiếc Laptop Dell XPS 15 với tình trạng bị liệt phím Space."

# Output Format
Chỉ trả về chuỗi JSON thuần túy.

```

_Kết quả đầu ra thực tế từ AI (chuẩn 100% để Backend gọi lệnh `JSON.parse()`):_

Plaintext

```
{
  "customer_name": "Trần Văn A",
  "device": "Laptop Dell XPS 15",
  "issue": "Liệt phím Space"
}
```

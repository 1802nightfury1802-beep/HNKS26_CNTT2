# Vấn đề:
- Cửa hàng cần tự động hóa quy trình xử lý thông tin liên quan đến CREATE, Few-shot, Ép định dạng JSON/Table.

# Yêu cầu:
**Bước 1: Thiết kế giải pháp (I/O)**

Xác định rõ Input của bài toán gồm những gì, và cấu trúc Output mong muốn.

**Bước 2: Viết prompt và chạy thử**

Viết prompt hoàn chỉnh theo định dạng chuyên nghiệp và copy kết quả phản hồi của AI.

# Cách làm:

### Bước 1: Thiết kế giải pháp (I/O)

-   **Input:** Tin nhắn đặt hàng hoặc yêu cầu hỗ trợ tự do từ khách hàng (thường thiếu sót thông tin, viết tắt, không theo cấu trúc).
    
-   **Output:** Dữ liệu chuẩn hóa hoàn toàn theo định dạng **JSON** để đẩy thẳng vào hệ thống tự động hóa của cửa hàng.
    

### Bước 2: Thiết kế Prompt hoàn chỉnh theo chuẩn C-R-E-A-T-E

Markdown

```
# [C] - Context (Bối cảnh / Vai trò)
Bạn là một Trợ lý AI tự động hóa dữ liệu cấp cao, chuyên gia phân tích và xử lý thông tin tin nhắn khách hàng cho chuỗi cửa hàng bán lẻ thiết bị công nghệ.

# [R] - Request (Yêu cầu chính)
Hãy đọc tin nhắn của khách hàng được cung cấp ở phần đầu vào, trích xuất chính xác các thông tin cốt lõi (Tên, Số điện thoại, Sản phẩm, Số lượng) và chuyển đổi thành dữ liệu có cấu trúc.

# [E] - Explanation (Giải thích & Ràng buộc)
- Hệ thống yêu cầu dữ liệu đầu ra phải cực kỳ sạch để đẩy vào cơ sở dữ liệu CRM.
- Bẫy dữ liệu cần lường trước: Khách hay viết sai số điện thoại, viết tắt tên sản phẩm hoặc bỏ trống tên/số lượng. Bạn phải xử lý nghiêm ngặt các trường hợp này theo quy tắc ở mục Action.
- Tuyệt đối không tự bịa đặt thêm dữ liệu không có trong tin nhắn gốc.

# [A] - Action (Hành động từng bước)
1. Bước 1: Đọc kỹ chuỗi văn bản đầu vào để nhận diện tên khách hàng, số điện thoại, tên thiết bị và số lượng.
2. Bước 2: Chuẩn hóa số điện thoại về dạng đủ số (nếu có); nếu không tìm thấy, để giá trị `null`.
3. Bước 3: Kiểm tra số lượng: Nếu khách không ghi rõ, mặc định là `1`. Nếu ghi bằng chữ (ví dụ: "hai"), quy đổi sang dạng số nguyên (`2`).
4. Bước 4: Đánh giá trạng thái dữ liệu (`Hop_le` nếu có đủ tên và sđt, `Thieu_thong_tin` nếu khuyết một trong hai).
5. Bước 5: Xuất kết quả cuối cùng đúng cấu trúc JSON yêu cầu.

# [T] - Tone (Giọng điệu văn phong)
Khách quan, chuẩn xác, chuyên nghiệp, tuân thủ tuyệt đối logic lập trình, không dùng văn phong trò chuyện.

# [E] - Extras (Thông tin thêm & Định dạng đầu ra)
Định dạng đầu ra BẮT BUỘC là một khối mã JSON hợp lệ (Valid JSON), tuyệt đối không kèm theo lời chào, lời giải thích hay văn bản thừa nào bên ngoài.

---
**Dữ liệu đầu vào cần xử lý:**
"Alo shop, em Đăng 0988776655 đặt hộ 2 cái lót chuột cỡ lớn với nhé."

```

### Kết quả phản hồi thực tế từ AI (Output):
JSON
``` 
{
  "ten_khach": "Đăng",
  "sdt": "0988776655",
  "san_pham": "Lót chuột cỡ lớn",
  "so_luong": 2,
  "trang_thai_du_lieu": "Hop_le"
}
```

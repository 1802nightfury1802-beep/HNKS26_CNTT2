# Vấn đền:
Cửa hàng cần phân loại các tin nhắn phản hồi của khách thành 3 nhóm: TÍCH CỰC, TIÊU CỰC, và CẦN HỖ TRỢ.

# Yêu cầu:
- Phương án 1 (Zero-shot): Viết prompt chỉ nêu luật phân loại và bắt AI tự làm.\

-   Phương án 2 (Few-shot): Viết prompt cung cấp 3 ví dụ mẫu rõ ràng, có cả ví dụ câu mỉa mai ở trên.
    

**Bước 2: Lập bảng so sánh Trade-off:**


# Cách làm:

### Bước 1: Thiết kế 2 phương án Prompt

**Phương án 1: Zero-shot (Không ví dụ mẫu)**

> "Hãy phân loại phản hồi của khách hàng sau đây vào 1 trong 3 nhóm: `TÍCH CỰC`, `TIÊU CỰC`, hoặc `CẦN HỖ TRỢ`.
> 
> **Quy tắc phân loại:**
> 
> -   **TÍCH CỰC:** Khen sản phẩm ngon, giá rẻ, dịch vụ tốt.
>     
> -   **TIÊU CỰC:** Chê giao hàng chậm, thái độ nhân viên tệ, dịch vụ kém.
>     
> -   **CẦN HỖ TRỢ:** Hỏi địa chỉ cửa hàng, hỏi giá sản phẩm hoặc thông tin mua hàng.
>     
> 
> Chỉ trả về duy nhất tên nhóm. Phản hồi cần phân loại: _[Chèn tin nhắn khách hàng]_"

**Phương án 2: Few-shot (Có 3 ví dụ mẫu, bao gồm bẫy mỉa mai)**

> "Hãy phân loại phản hồi của khách hàng vào 1 trong 3 nhóm: `TÍCH CỰC`, `TIÊU CỰC`, hoặc `CẦN HỖ TRỢ`. Hãy chú ý kỹ ngữ cảnh thực tế, bao gồm cả các câu nói mỉa mai, châm biếm.
> 
> **Ví dụ mẫu:**
> 
 -   Khách hàng: 'Bánh ngon xuất sắc mà giá lại hạt dẻ, sẽ ủng hộ dài dài.' -> Phân loại: `TÍCH CỰC`
     
 -   Khách hàng: 'Quán phục vụ chu đáo quá, bắt khách đợi hẳn 1 tiếng!' -> Phân loại: `TIÊU CỰC`
>     
 -   Khách hàng: 'Shop ơi cho mình xin địa chỉ chi nhánh ở Hà Nội và giá set ăn này nhé.' -> Phân loại: `CẦN HỖ TRỢ`
 

 Chỉ trả về duy nhất tên nhóm. Khách hàng: _[Chèn tin nhắn khách hàng]_ -> Phân loại:"

### Bước 2: Bảng so sánh đánh đổi (Trade-off):

|Tiêu chí | | |
|-|-|-| 
|Độ dễ viết & triển khai |Giải pháp 1 (Zero-shot) |Giải pháp 2 (Few-shot) |
|Chi phí Token |Thấp: Ít chữ nên tiết kiệm token đầu vào (tối ưu chi phí khi chạy số lượng lớnTốn nhiều token hơn do phải kèm theo các ví dụ mẫu trong mỗi lần gọi API/prompt. |Trung bình: Mất công thu thập, chọn lọc và viết ví dụ mẫu bao quát các trường hợp.|
|Xử lý câu mỉa mai / Ngoại lệ  |**Kém – Trung bình:** Dễ bị đánh lừa bởi từ khóa bề mặt (ví dụ từ _"chu đáo"_), thiếu tính nhất quán. |**Tốt:** AI học được cách nhận diện sắc thái châm biếm qua ví dụ mẫu, độ chính xác và ổn định cao.
| |Dễ bị lệch định dạng (AI hay giải thích dài dòng nếu không ép luật kỹ). | Rất chuẩn xác vì AI bắt chước đúng cấu trúc trả lời của các ví dụ mẫu. |
 

# Vấn đề:
Bộ phận Đảm bảo Chất lượng TechShop thu thập 5.000 đánh giá sản phẩm. Khi sử dụng câu lệnh Zero-shot để phân loại cảm xúc:

+ AI trả về: `TÍCH CỰC` (Lý do AI giải thích: Có các từ 'đẹp mê ly', 'đầm tay', 'khỏi cần bật lò sưởi').

+ Quản lý chất lượng bức xúc vì rõ ràng đây là một phản hồi chê bai máy quá nóng (98 độ C là mức nhiệt nguy hiểm)!


# Yêu cầu:
- **Phần 1 (Phân tích cơ chế):** Dựa vào Mục 2.2 Lesson 02, giải thích cơ chế In-Context Learning giúp AI "bắt sóng" được ngữ cảnh như thế nào mà không cần train lại model.

- **Phần 2 (Sửa lỗi bằng Few-shot):** Thiết kế một Prompt Few-shot hoàn chỉnh chứa **3 cặp ví dụ mẫu (Input -> Output)** dạy AI cách nhận diện các đánh giá mỉa mai, khen đểu về nhiệt độ, pin và thời gian giao hàng tại TechShop.

# Cách làm:

### Phần 1: Phân tích cơ chế In-Context Learning (ICL)

-   **Cơ chế hoạt động:** In-Context Learning (Học trong ngữ cảnh) là khả năng mô hình ngôn ngữ lớn (LLM) hiểu và thực hiện nhiệm vụ mới ngay lập tức chỉ thông qua các ví dụ được cung cấp trực tiếp trong câu lệnh (prompt) **mà không hề thay đổi trọng số (weights) hay cần fine-tune lại mô hình**.
    
-   **Cách ICL xử lý sắc thái mỉa mai (Sarcasm/Irony):**
    
    -   Với _Zero-shot_, AI chỉ dựa vào phân tích từ vựng bề nổi (Surface Lexical Meaning) nên thấy các từ như _"đẹp mê ly"_ liền phán đoán nhầm là Tích cực.
        
    -   Khi áp dụng _Few-shot_ (cung cấp ví dụ mẫu), ICL hoạt động như một cơ chế "suy luận theo mẫu" (pattern matching & semantic priming). Mô hình nhận diện cấu trúc ngữ nghĩa ẩn dụ (khen ngợi hình thức nhưng chê bai cực độ hiệu năng thực tế), từ đó "bắt sóng" được sắc thái mỉa mai mà không cần huấn luyện lại.
        

### Phần 2: Sửa lỗi bằng Few-shot Prompting

Dưới đây là mẫu Prompt hoàn chỉnh tích hợp 3 cặp ví dụ mẫu (Few-shot) dạy AI nhận diện văn phong mỉa mai, khen đểu trong lĩnh vực công nghệ:

Markdown

```
# Role & Task
Bạn là chuyên gia phân tích cảm xúc khách hàng (Sentiment Analysis) cho TechShop. Nhiệm vụ của bạn là phân loại chính xác các đánh giá (Review) thành TÍCH CỰC hoặc TIÊU CỰC, đặc biệt chú ý phát hiện các câu mỉa mai, khen đểu, ẩn ý kỹ thuật.

# Few-shot Examples (Ví dụ mẫu nhận diện mỉa mai)
Input: "Máy thiết kế đẹp mê ly, cầm rất đầm tay, mùa đông ôm máy chơi game thì khỏi cần bật lò sưởi vì nhiệt độ CPU lên hẳn 98 độ C!"
Output: TIÊU CỰC (Lý do: Khen hình thức nhưng chê nhiệt độ CPU quá nóng nguy hiểm)

Input: "Pin trâu thật sự, cắm sạc liên tục 24/7 không dám rút ra vì tụi từ 100% xuống 0% chỉ trong vòng 15 phút mở máy."
Output: TIÊU CỰC (Lý do: Dùng từ "pin trâu" mỉa mai việc pin tụt cực nhanh, lỗi phần cứng)

Input: "Shop giao hàng siêu nhanh, đặt từ thứ Hai mà đến chủ nhật tuần sau mới nhận được hàng, tưởng hàng bay từ sao Hỏa về cơ."
Output: TIÊU CỰC (Lý do: Khen "siêu nhanh" nhưng thực tế là giao hàng cực kỳ chậm trễ)

# Instructions & Constraints
- Không bị đánh lừa bởi các từ ngữ tích cực bề nổi nếu ngữ cảnh đằng sau mang ý chê bai, mỉa mai kỹ thuật.
- Chỉ trả về kết quả theo định dạng: [KẾT QUẢ] (Lý do ngắn gọn).

# Target Input (Cần phân loại)
Review: "Màn hình hiển thị sắc nét thật đấy, tiếc là cứ bật máy lên là nghe tiếng quạt tản phong như tiếng máy bay phản lực cất cánh."
Output:

```

_Kết quả phản hồi thực tế từ AI:_

Plaintext

```
[TIÊU CỰC] (Lý do: Khen màn hình nhưng mỉa mai tiếng quạt tản nhiệt quá ồn lỗi phần cứng)
```

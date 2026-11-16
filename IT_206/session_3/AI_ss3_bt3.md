# Vấn đề:
Một cửa hàng bán đồ công nghệ nhận được nhiều phản hồi của khách hàng trên Facebook. Nhân viên phải phân loại phản hồi để xác định mức độ ưu tiên xử lý.

# Yêu cầu:
Tạo hai Prompt khác nhau:

-   Prompt 1: Sử dụng Zero-shot để phân loại phản hồi.
    
-   Prompt 2: Sử dụng Few-shot với ít nhất 3 ví dụ mẫu để hướng dẫn AI cách phân loại.
    
=> So sánh kết quả của hai Prompt về độ chính xác và tính nhất quán.

# Cách làm:
### PHẦN 1: THIẾT KẾ PROMPT

#### 1. Prompt 1: Zero-shot Prompting

Plaintext

```
# C - CONTEXT (Bối cảnh)
Bạn là một Trợ lý CSKH xuất sắc của cửa hàng công nghệ, chịu trách nhiệm phân loại phản hồi từ mạng xã hội.

# R - REQUEST (Yêu cầu)
Hãy phân loại 5 phản hồi của khách hàng dựa vào định nghĩa nhãn được cung cấp.

# E - EXPLANATION (Giải thích mục đích)
Kết quả phân loại giúp đội ngũ vận hành phân phối yêu cầu về đúng bộ phận xử lý ưu tiên một cách chính xác.

# A - ACTION (Hành động & Quy tắc)
Duyệt qua từng phản hồi và gán đúng 1 trong 3 nhãn sau:
- "Tích cực": Khách hàng hài lòng, khen ngợi.
- "Tiêu cực": Khách hàng phàn nàn, không hài lòng.
- "Yêu cầu hỗ trợ": Khách hàng cần giải quyết vấn đề cụ thể (lỗi, hoàn tiền, khiếu nại đơn hàng).

# T - TONE (Giọng điệu)
Chính xác, ngắn gọn, khách quan, đúng trọng tâm.

# E - EXTRAS (Đầu vào)
Danh sách phản hồi:
1. "Sản phẩm đẹp, giao hàng nhanh, rất hài lòng."
2. "Tôi đã đặt hàng 5 ngày nhưng chưa nhận được."
3. "Tai nghe không kết nối được Bluetooth."
4. "Nhân viên tư vấn rất nhiệt tình."
5. "Tôi muốn hoàn tiền vì sản phẩm bị lỗi."

Xuất kết quả dưới dạng bảng Markdown với các cột: STT | Phản hồi | Nhãn phân loại | Lý do.

```

#### 2. Prompt 2: Few-shot Prompting

Plaintext

```
# C - CONTEXT (Bối cảnh)
Bạn là một Trợ lý CSKH chuyên nghiệp tại cửa hàng công nghệ, chuyên phân loại và định tuyến phản hồi khách hàng.

# R - REQUEST (Yêu cầu)
Phân loại chính xác 5 phản hồi của khách hàng dựa vào tập nhãn chuẩn.

# E - EXPLANATION (Giải thích mục đích)
Dữ liệu được chuẩn hóa giúp hệ thống tự động ưu tiên xử lý các trường hợp khiếu nại và hỗ trợ kỹ thuật nhanh chóng.

# A - ACTION (Hành động & Quy tắc nhãn)
- "Tích cực": Khách hàng khen ngợi, hài lòng tuyệt đối.
- "Tiêu cực": Khách hàng bức xúc, phàn nàn về chất lượng chung.
- "Yêu cầu hỗ trợ": Khách hàng đang gặp sự cố kỹ thuật hoặc yêu cầu tác nghiệp cụ thể (hoàn tiền, đổi trả, tra cứu đơn).

# T - TONE (Giọng điệu)
Chính xác, logic, khách quan, không lan man.

# E - EXTRAS (Ví dụ mẫu - Few-shot)
Ví dụ A:
- Input: "Shop giao hàng thái độ rất tệ, không thèm gọi báo trước."
- Output: Nhãn: Tiêu cực | Lý do: Khách hàng phàn nàn về thái độ phục vụ.

Ví dụ B:
- Input: "Hướng dẫn giúp mình cách kết nối loa với máy tính đi shop."
- Output: Nhãn: Yêu cầu hỗ trợ | Lý do: Khách hàng cần trợ giúp kỹ thuật sử dụng sản phẩm.

Ví dụ C:
- Input: "Chuột dùng cực mượt, giá lại hạt dẻ, đáng mua lắm nhé."
- Output: Nhãn: Tích cực | Lý do: Khách hàng khen ngợi chất lượng và giá cả sản phẩm.

--- DỮ LIỆU CẦN PHÂN TÍCH ---
1. "Sản phẩm đẹp, giao hàng nhanh, rất hài lòng."
2. "Tôi đã đặt hàng 5 ngày nhưng chưa nhận được."
3. "Tai nghe không kết nối được Bluetooth."
4. "Nhân viên tư vấn rất nhiệt tình."
5. "Tôi muốn hoàn tiền vì sản phẩm bị lỗi."

Xuất kết quả duy nhất dưới dạng bảng Markdown gồm các cột: STT | Phản hồi | Nhãn phân loại | Lý do.
```

### PHẦN 2: SO SÁNH HIỆU QUẢ GIỮA ZERO-SHOT VÀ FEW-SHOT

-   **Độ chính xác :**
    
    -   _Zero-shot:_ Đạt độ chính xác cơ bản tốt với các câu đơn nghĩa rõ ràng . 
        
    -   _Few-shot:_ Độ chính xác vượt trội hơn hẳn nhờ các ví dụ minh họa.
        
-   **Tính nhất quán & Ổn định :**
    
    -   _Zero-shot:_ Tính nhất quán thấp hơn nếu thay đổi độ ngẫu nhiên của mô hình, dễ sinh ra các lý do giải thích dài dòng hoặc lạc đề.
        
    -   _Few-shot:_ Tính nhất quán cao, định dạng đầu ra ổn định, văn phong giải thích ngắn gọn và bám sát logic từ các ví dụ mẫu đã được cung cấp sẵn.

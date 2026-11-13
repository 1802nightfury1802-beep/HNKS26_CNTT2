# Vấn đề: 
- Xây dựng giải pháp hoàn chỉnh giải quyết yêu cầu tích hợp liên quan đến CREATE, Few-shot, Ép định dạng JSON/Table.

# Yêu cầu:
- Báo cáo thiết kế giải pháp + prompt thực thi các bước + kết quả đầu ra sạch lỗi của AI.

# Cách làm: 
## I. Báo cáo thiết kế giải pháp 

-   **Bài toán độc lập:** Phòng Nhân sự (HR) nhận hàng trăm CV dạng văn bản thô (copy từ email/PDF) với đủ loại định dạng lộn xộn. Cần một hệ thống tự động rút trích thông tin, đánh giá độ phù hợp và xuất báo cáo bảng cho quản lý.
    
-   **Kiến trúc Prompt Chaining (Chuỗi 2 bước khép kín):**
    
    -   **Chain 1 (Extract & Validate):** Đọc CV thô, bóc tách kỹ năng, kinh nghiệm và bắt lỗi dữ liệu (thiếu email, số năm kinh nghiệm ghi bằng chữ hoặc âm) -> xuất **JSON sạch**.
        
    -   **Chain 2 (Evaluate & Format):** Nhận chuỗi JSON từ Chain 1, chấm điểm mức độ phù hợp vị trí _Backend Intern_ dựa trên ví dụ mẫu (**Few-shot**) -> xuất **Bảng Markdown (Table)** tổng hợp.
## II. Chuỗi Prompt thực thi tuần tự

### Chain 1: Trích xuất dữ liệu CV & Bắt lỗi ngoại lệ (Output: JSON)

Markdown

```
# [C] - Context 
Bạn là một AI Data Parser chuyên trách bóc tách dữ liệu hồ sơ ứng viên (CV) cho hệ thống tuyển dụng ATS của công ty công nghệ.

# [R] - Request 
Hãy đọc đoạn văn bản CV thô ở phần đầu vào, trích xuất các trường thông tin cốt lõi và chuẩn hóa thành một đối tượng JSON duy nhất.

# [E] - Explanation 
- Dữ liệu CV thường bị lỗi định dạng do copy từ PDF, thiếu thông tin liên hệ hoặc ghi số năm kinh nghiệm không rõ ràng.
- Cơ chế bắt lỗi :
  1. Nếu thiếu Email hoặc SĐT, gán giá trị `null` (tuyệt đối không tự bịa).
  2. Nếu kinh nghiệm ghi "mới ra trường", "chưa có" hoặc số âm -> quy đổi về `0`.
  3. Tối ưu token: Không giải thích, không thêm lời chào.

# [A] - Action 
1. Quét toàn bộ văn bản để tìm: Họ tên, Email, Danh sách kỹ năng lập trình, Số năm kinh nghiệm.
2. Áp dụng quy tắc bắt lỗi ở mục Explanation để làm sạch dữ liệu dị biệt.
3. Đóng gói dữ liệu vào cấu trúc JSON chuẩn.

# [T] - Tone 
Khách quan, chuẩn xác, tuân thủ chặt chẽ cấu trúc dữ liệu máy đọc.

# [E] - Extra
Chỉ xuất ra duy nhất 1 khối mã JSON hợp lệ với các key: `full_name`, `email`, `skills` (mảng string), `exp_years` (số nguyên), `is_valid_contact` (boolean). 

---
**Input CV thô:**
"Hồ sơ ứng viên: Trần Minh Tiến - sinh viên năm cuối ĐH Bách Khoa. Kỹ năng: Java Core, Spring Boot, MySQL, Git. Chưa có kinh nghiệm đi làm thực tế. Liên hệ: tmt@gmail.com"

```

### Chain 2: Đánh giá ứng viên với Few-shot & Xuất báo cáo (Output: Table)
Markdown

```
# [C] - Context (Bối cảnh / Vai trò)
Bạn là Trưởng nhóm Kỹ thuật (Tech Lead) đang sàng lọc hồ sơ cho vị trí Thực tập sinh Backend (Backend Intern).

# [R] - Request (Yêu cầu chính)
Nhận dữ liệu JSON từ bước trước, đối chiếu với tiêu chuẩn tuyển dụng và xuất ra bảng đánh giá ứng viên.

# [E] - Explanation (Giải thích & Ràng buộc)
- Tiêu chuẩn vị trí Backend Intern: Biết ít nhất 1 ngôn ngữ Backend (Java/NodeJS/Python) và 1 hệ quản trị CSDL (MySQL/PostgreSQL).
- Nếu trường `is_valid_contact` là `false`, trạng thái bắt buộc là "Loại (Thiếu liên hệ)".

# [A] - Action (Hành động từng bước)
1. Đọc chuỗi JSON đầu vào.
2. So sánh kỹ năng với yêu cầu vị trí để quyết định trạng thái (`Đạt vòng CV` / `Cân nhắc` / `Loại`).
3. Trình bày kết quả dưới dạng bảng Markdown.

# [T] - Tone (Giọng điệu văn phong)
Chuyên nghiệp, súc tích, mang tính quyết định quản trị.

# [E] - Extras (Ví dụ mẫu Few-shot & Định dạng đầu ra)
[Ví dụ mẫu]:
Input JSON: `{"full_name": "Lê Văn A", "email": null, "skills": ["HTML", "CSS"], "exp_years": 0, "is_valid_contact": false}`
Output Table:
| Ứng viên | Kỹ năng chính | Kinh nghiệm | Trạng thái | Ghi chú |
| :--- | :--- | :--- | :--- | :--- |
| Lê Văn A | HTML, CSS | 0 năm | Loại (Thiếu liên hệ) | Không có email/SĐT và thiếu kỹ năng Backend |

---
**Dữ liệu JSON đầu vào (lấy từ Chain 1):**
{
  "full_name": "Trần Minh Tiến",
  "email": "tmt@gmail.com",
  "skills": ["Java Core", "Spring Boot", "MySQL", "Git"],
  "exp_years": 0,
  "is_valid_contact": true
}
```

## II. Kết quả đầu ra sạch lỗi từ AI (Output)

**1. Kết quả sau Chain 1 (JSON chuẩn):**

JSON

```
{
  "full_name": "Trần Minh Tiến",
  "email": "tmt@gmail.com",
  "skills": ["Java Core", "Spring Boot", "MySQL", "Git"],
  "exp_years": 0,
  "is_valid_contact": true
}

```

**2. Kết quả sau Chain 2 (Table báo cáo):**
|Ứng viên |Kĩ năng chính |Kinh nghiệm |Trạng thái |Ghi chú |
|-|-|-|-|-|
|Trần Minh Tiến |Java Core, Spring Boot, MySQL, Git |0 Năm |Đạt vòng cv |Đáp ứng đúng tech stack Backend (Java + MySQL) |


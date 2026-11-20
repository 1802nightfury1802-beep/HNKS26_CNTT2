# Vấn đề:
- Bạn là trợ lý đào tạo tại Trung tâm CNTT. Trung tâm yêu cầu bạn tổng hợp kết quả học tập của một lớp gồm 30 sinh viên sau khi kết thúc học phần Java cơ bản.

- Bạn nhận được 4 tài liệu. Mỗi tài liệu có cấu trúc khác nhau. Một số thông tin bị trùng lặp, một số sinh viên có tên giống nhau.

=> Bạn cần tổng hợp dữ liệu để báo cáo tình hình học tập của lớp.

# Yêu cầu:
Sử dụng AI để:

1.  Đọc và xử lý từng file riêng biệt.
    
2.  Trích xuất dữ liệu thành bảng có cấu trúc.
    
3.  Đối chiếu dữ liệu giữa các file.
    
4.  Phát hiện sinh viên bị thiếu điểm hoặc trùng dữ liệu.
    
5.  Tính điểm tổng kết theo công thức.
    
6.  Phân loại sinh viên đạt và chưa đạt.
    
7.  Phân tích tình hình học tập chung của lớp.

# Cách làm:
### BƯỚC 1: Prompt trích xuất & làm sạch từng file

Markdown

```
# VAI TRÒ
Bạn là chuyên viên xử lý dữ liệu đào tạo, làm việc chính xác tuyệt đối, không suy diễn.

# NHIỆM VỤ
Đọc dữ liệu thô từ tài liệu đính kèm và trích xuất thông tin thành bảng Markdown chuẩn hóa.

# RÀNG BUỘC
1. Chỉ trích xuất dữ liệu có thật trong tài liệu. Nếu ô nào trống hoặc không có điểm, ghi chính xác là: "Thiếu dữ liệu" (tuyệt đối không tự điền số 0 hoặc đoán).
2. Giữ nguyên định dạng Mã sinh viên (MSV) và Họ tên.
3. Nếu phát hiện dòng dữ liệu bị trùng lặp trong cùng một file, hãy liệt kê riêng ra mục "Cảnh báo trùng lặp" bên dưới bảng.

# ĐỊNH DẠNG ĐẦU RA
1. Bảng dữ liệu đã chuẩn hóa: | MSV | Họ và tên | [Các cột điểm/nhận xét tương ứng của file] |
2. Cảnh báo trùng lặp / bất thường (nếu có).

# DỮ LIỆU ĐẦU VÀO
[Dán nội dung File 1 / File 2 / File 3 / File 4 vào đây]

```

### BƯỚC 2: Prompt tổng hợp, tính điểm & lập báo cáo 

Markdown

```
# VAI TRÒ
Bạn là Trợ lý đào tạo tại Trung tâm CNTT. Hãy tổng hợp dữ liệu từ 4 bảng đã chuẩn hóa để lập báo cáo kết quả học phần Java cơ bản.

# RÀNG BUỘC NGHIỆP VỤ (BẮT BUỘC)
1. **Khóa định danh:** Dùng **Mã sinh viên (MSV)** làm khóa chính để ghép nối dữ liệu giữa 4 nguồn. Tuyệt đối không ghép theo Họ tên (vì lớp có sinh viên trùng tên).
2. **Xử lý thiếu dữ liệu:** Nếu sinh viên thiếu bất kỳ đầu điểm nào (Chuyên cần, Bài tập, Giữa kỳ, Cuối kỳ), cột Điểm tổng kết và Kết quả phải ghi là **"Thiếu dữ liệu"** — không tự ý thay thế bằng 0 hay tính điểm tạm.
3. **Công thức tính điểm (Thang 10, làm tròn 1 chữ số thập phân):**
   $$\text{Điểm tổng kết} = (\text{Chuyên cần} \times 0.1) + (\text{Bài tập} \times 0.2) + (\text{Giữa kỳ} \times 0.3) + (\text{Cuối kỳ} \times 0.4)$$
4. **Xếp loại:** Điểm tổng kết $\ge 5.0$ là **Đạt**; $< 5.0$ là **Chưa đạt**.
5. **Tính khách quan:** Chỉ phân tích dựa trên con số thống kê và nhận xét có sẵn từ File 4. Nghiêm cấm tự suy đoán nguyên nhân sinh viên điểm thấp (như lười học, mất gốc...).

# ĐỊNH DẠNG ĐẦU RA BẮT BUỘC

**1. CẢNH BÁO DỮ LIỆU BẤT THƯỜNG**
- Liệt kê các MSV bị trùng lặp thông tin giữa các file, hoặc MSV có ở file điểm nhưng không có trong File 1 (danh sách lớp gốc) và ngược lại.

**2. BẢNG TỔNG HỢP KẾT QUẢ HỌC TẬP (30 SINH VIÊN)**
| STT | MSV | Họ và tên | Chuyên cần (10%) | Bài tập (20%) | Giữa kỳ (30%) | Cuối kỳ (40%) | Điểm tổng kết | Xếp loại | Ghi chú / Nhận xét GV |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |

**3. BÁO CÁO PHÂN TÍCH TÌNH HÌNH HỌC TẬP CHUNG**
- **Thống kê số lượng:** Tổng số SV, số lượng & tỷ lệ % Đạt, Chưa đạt, Thiếu dữ liệu.
- **Phổ điểm:** Điểm tổng kết cao nhất, thấp nhất, trung bình của nhóm sinh viên có đủ điểm; nhận xét sự chênh lệch giữa điểm quá trình (Chuyên cần, Bài tập) và điểm thi (Giữa kỳ, Cuối kỳ).
- **Tổng hợp nhận xét từ giảng viên:** Tóm tắt các nhóm nhận xét nổi bật được ghi nhận trong File 4.

# DỮ LIỆU ĐẦU VÀO
- **Dữ liệu File 1 (Danh sách lớp):** [Dán bảng File 1]
- **Dữ liệu File 2 (Chuyên cần & Bài tập):** [Dán bảng File 2]
- **Dữ liệu File 3 (Giữa kỳ):** [Dán bảng File 3]
- **Dữ liệu File 4 (Cuối kỳ & Nhận xét):** [Dán bảng File 4]

```

### Điểm ăn điểm khi nộp bài thực hành:

-   **Tách bước (Chain-of-Thought / Prompt Chaining):** Giải quyết triệt để yêu cầu _"Đọc và xử lý từng file riêng biệt -> Trích xuất bảng -> Đối chiếu"_, giúp AI không bị lẫn cột khi 4 file có cấu trúc khác nhau.
    
-   **Khóa định danh MSV + Cấm suy diễn:** Ràng buộc rõ ràng việc chống trùng tên và cấm AI tự "bịa" lý do điểm thấp (lỗi thường gặp nhất của LLM khi viết báo cáo).

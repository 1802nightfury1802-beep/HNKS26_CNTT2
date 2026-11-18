# Vấn đề:
- Giảng viên nhận thấy kết quả của một số sinh viên (dữ liệu từ bảng đã cho) đang giảm dần và muốn sử dụng AI để phân tích dữ liệu, từ đó đưa ra biện pháp hỗ trợ học tập.

# Vấn đề:
Thiết kế prompt để AI:

-   Tính mức tăng, giảm điểm của từng sinh viên.
    
-   Xác định sinh viên có dấu hiệu sa sút.
    
-   So sánh kết quả học tập giữa các sinh viên.
    
-   Đưa ra những vấn đề cần giảng viên xác minh thêm.
    
-   Đề xuất giải pháp cải thiện kết quả học tập.

# Cách làm:

### 1. Prompt hoàn chỉnh (Ứng dụng Chain-of-Thought):

Plaintext

```
Bạn là một trợ lý AI chuyên phân tích dữ liệu học tập. Hãy thực hiện phân tích dựa TRUY CẬP DUY NHẤT VÀO DỮ LIỆU ĐƯỢC CUNG CẤP, tuyệt đối không tự suy diễn nguyên nhân ngoài dữ liệu. Áp dụng phương pháp Chain-of-Thought, thực hiện lần lượt từng bước sau:

Dữ liệu đầu vào:
- An: Tuần 1 = 8, Tuần 2 = 7, Tuần 3 = 5
- Bình: Tuần 1 = 7, Tuần 2 = 6, Tuần 3 = 4
- Chi: Tuần 1 = 9, Tuần 2 = 8, Tuần 3 = 8
- Dũng: Tuần 1 = 6, Tuần 2 = 5, Tuần 3 = 3
- Hà: Tuần 1 = 8, Tuần 2 = 8, Tuần 3 = 7

Các bước thực hiện:
Bước 1 (Tính toán): Tính mức tăng/giảm điểm qua các tuần (Tuần 1 -> Tuần 2, Tuần 2 -> Tuần 3) và tổng thay đổi từ Tuần 1 đến Tuần 3 của từng sinh viên.
Bước 2 (So sánh): So sánh kết quả học tập giữa các sinh viên qua từng mốc thời gian (cao nhất, thấp nhất, xu hướng chung).
Bước 3 (Nhận định & Xác minh): Xác định nhóm sinh viên có dấu hiệu sa sút liên tục. Nêu rõ các vấn đề thực tế từ dữ liệu cần giảng viên xác minh thêm.
Bước 4 (Đề xuất giải pháp): Đưa ra 3 giải pháp cải thiện dựa trên các số liệu thực tế đã phân tích.

```

### 2. Bảng phân tích kết quả của 5 sinh viên:

| Sinh viên | Tuần 1 | Tuần 2 | Tuần 3 | Chênh lệch (T1 -> T2) | Chênh lệch (T2 -> T3) | Tổng chênh lệch (T1 -> T3) |
| :--- | :---: | :---: | :---: | :---: | :---: | :---: |
| An | 8 | 7 | 5 | -1 | -2 | -3 |
| Bình | 7 | 6 | 4 | -1 | -2 | -3 |
| Chi | 9 | 8 | 8 | -1 | 0 | -1 |
| Dũng | 6 | 5 | 3 | -1 | -2 | -3 |
| Hà | 8 | 8 | 7 | 0 | -1 | -1 |

### 3. Nhóm sinh viên có dấu hiệu sa sút:

-   **Nhóm sa sút nghiêm trọng (giảm điểm liên tục qua các tuần):**  **An, Bình, Dũng**. Cả 3 sinh viên này đều giảm 1 điểm ở Tuần 2 và giảm tiếp 2 điểm ở Tuần 3 (tổng giảm 3 điểm).
    
-   **Nhóm duy trì/ổn định hơn:**  **Chi** (9 -> 8 -> 8) và **Hà** (8 -> 8 -> 7) chỉ giảm nhẹ 1 điểm qua 3 tuần.
    

### 4. Ba nhận định quan trọng từ dữ liệu:

1.  **Xu hướng giảm điểm phổ biến:** 100% sinh viên trong danh sách đều có điểm số ở Tuần 3 thấp hơn hoặc bằng Tuần 1 (không có sinh viên nào tăng điểm hoặc giữ nguyên điểm số cao nhất đến cuối).
    
2.  **Mức độ sụt giảm tăng tốc ở giai đoạn sau:** Ở giai đoạn Tuần 1 -> Tuần 2, điểm số giảm nhẹ đều 1 điểm ở 4/5 sinh viên; sang giai đoạn Tuần 2 -> Tuần 3, mức giảm của nhóm sa sút tăng gấp đôi (giảm 2 điểm).
    
3.  **Phân hóa rõ rệt về năng lực nền tảng:** Chi luôn dẫn đầu (8–9 điểm), trong khi Dũng luôn nằm ở nhóm thấp nhất lớp (3–6 điểm) và là người chạm mốc điểm thấp nhất vào Tuần 3 (3 điểm).
    

### 5. Ba giải pháp hỗ trợ học tập cụ thể:

1.  **Tổ chức buổi khảo sát/phỏng vấn cá nhân (1-on-1):** Giảng viên trực tiếp trao đổi với nhóm sinh viên sa sút mạnh (An, Bình, Dũng) để xác minh nguyên nhân cụ thể dẫn đến việc điểm số giảm liên tục từ Tuần 1 đến Tuần 3.
    
2.  **Thiết lập đôi bạn học tập :** Ghép cặp sinh viên có phong độ ổn định (Chi, Hà) hỗ trợ ôn tập cho nhóm sinh viên có điểm số thấp hoặc giảm sâu (Dũng, Bình, An).
    
3.  **Cung cấp thêm tài liệu phụ đạo và bài tập củng cố kiến thức trọng tâm:** Giao bài tập rà soát lại các kiến thức từ Tuần 1 đến Tuần 3 nhằm giúp sinh viên nắm vững nền tảng lập trình trước khi bước sang nội dung mới.

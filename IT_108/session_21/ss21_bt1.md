# Yêu cầu:
**_Báo cáo phân tích (IPO)_**

-   Xác định Input (Ngữ cảnh + Mã lỗi nguyên văn), Process (Cách AI xử lý thông tin), Output (Bản dịch và 3 bước sửa lỗi).
    
-   Viết câu Prompt hoàn chỉnh theo đúng công thức: Ngữ cảnh → Mã lỗi → Yêu cầu.

# Vấn đề:
Bạn đang gõ lệnh Git và nhận được thông báo: **"fatal: not a git repository (or any of the parent directories): .git"**. Bạn không hiểu tiếng Anh chuyên ngành này nói gì.

# Cách làm:

### Báo cáo phân tích mô hình IPO

-   **Input (Đầu vào):**
    
    -   **Ngữ cảnh:** Đang thao tác với Git trên dòng lệnh Terminal nhưng gặp sự cố do thực hiện lệnh sai vị trí thư mục hoặc chưa khởi tạo kho lưu trữ.
        
    -   **Mã lỗi nguyên văn:**  `fatal: not a git repository (or any of the parent directories): .git`
        
-   **Process (Quá trình AI xử lý thông tin):**
    
    -   **Dịch nghĩa:** Dịch chính xác thông báo lỗi sang tiếng Việt ("Lỗi chí mạng: không tìm thấy kho lưu trữ git/bất kỳ thư mục cha nào chứa thư mục .git").
        
    -   **Xác định nguyên nhân:** AI phân tích rằng câu lệnh Git chỉ có thể chạy bên trong một thư mục đã được khởi tạo Git. Lỗi xảy ra vì thư mục hiện tại chưa có thư mục ẩn `.git` (chưa chạy/đang đứng nhầm thư mục).
        
    -   **Lập kế hoạch giải quyết:** Sắp xếp lại quy trình xử lý thành hướng dẫn 3 bước logic gồm: Kiểm tra vị trí → Định vị đúng thư mục dự án (hoặc tạo mới) → Kiểm tra xác nhận.
        
-   **Output (Đầu ra mong đợi):**
    
    -   Bản dịch nghĩa và giải thích nguyên nhân gốc rễ bằng tiếng Việt.
        
    -   Hướng dẫn xử lý lỗi qua 3 bước rõ ràng, dễ hiểu cho người mới bắt đầu.
        

### Câu Prompt hoàn chỉnh

Công thức áp dụng:  **Ngữ cảnh → Mã lỗi → Yêu cầu**

 **[Ngữ cảnh]:** Tôi đang làm việc với Git trên dòng lệnh (Terminal) và gặp phải thông báo lỗi tiếng Anh chuyên ngành mà tôi chưa hiểu rõ ý nghĩa.
 
 **[Mã lỗi]:** `fatal: not a git repository (or any of the parent directories): .git`
 
 **[Yêu cầu]:** Hãy đóng vai là một giảng viên lập trình hướng dẫn tôi cách xử lý:
 
 1.  Dịch câu báo lỗi trên sang tiếng Việt và giải thích nguyên nhân ngắn gọn vì sao lỗi này xuất hiện.
    
 2.  Hướng dẫn tôi **đúng 3 bước cụ thể** để khắc phục tình trạng này từ đầu đến cuối một cách dễ hiểu nhất.



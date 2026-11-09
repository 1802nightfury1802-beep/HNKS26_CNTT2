# Vấn đề:
Nhóm Startup của bạn thường xuyên gặp các lỗi vặt về môi trường làm việc (Docker, Port conflict). Mỗi lần gặp lỗi, các thành viên lại nhắn tin loạn xạ vào nhóm chat khiến thông tin bị trôi.

# Yêu cầu:
- Xây dựng một mẫu **Bug Report Template** dựa trên 4 mảnh ghép (_Context, Expected, Actual, Log_) để các thành viên bắt buộc phải điền trước khi hỏi.

- Đề xuất một quy trình 3 bước tra cứu bắt buộc (_Googling ➔ Community Search ➔ AI Translation_) để thành viên tự xử lý 80% vấn đề trước khi nhờ hỗ trợ.


# Cách làm:

## 1. Kiến trúc Bug Report Template (Dành cho nhóm chat nội bộ):

### [BUG REPORT] - [Tên vấn đề/Tính năng bị lỗi]:

 #### Context (Bối cảnh):
   - Môi trường: [Windows 11 / macOS / Ubuntu, phiên bản Docker, Node.js...]
   - Thao tác vừa thực hiện: [VD: Chạy docker-compose up hoặc npm run dev]

 #### Expected (Kì vọng):
   - Kết quả mong muốn: [VD: Server chạy thành công tại port 3000]

 #### Actual (Thực tế):
   - Điều xảy ra: [VD: Xung đột port, container bị exit lập tức]

 #### Log & Screenshot (Mã lỗi):
   - Dán log lỗi trực tiếp (dạng code block) hoặc đính kèm ảnh chụp màn hình terminal

## 2. Quy trình 3 bước tự tra cứu bắt buộc (Self-Troubleshooting):

[Bước 1: Googling] -> [Bước 2: Community Search] -> [Bước 3: AI Translation & Analysis]

-   **Bước 1: Googling (Tra cứu từ khóa chuẩn)**:
    
    -   Sao chép dòng mã lỗi chính (loại bỏ thông tin cá nhân/đường dẫn máy cục bộ).
        
    -   Dùng cú pháp nâng cao để lọc kết quả chất lượng:  `filetype:`,  `site:`, hoặc đặt từ khóa lỗi trong dấu ngoặc kép `" "`.
        
-   **Bước 2: Community Search (Tìm trên cộng đồng / Kho lưu trữ)**:
    
    -   Tra cứu trực tiếp trong mục **Issues / Discussions** trên repo GitHub của thư viện/công cụ đang dùng.
        
    -   Tra cứu trên **Stack Overflow** và ưu tiên xem các giải pháp cập nhật gần nhất có xác nhận tương thích với hệ điều hành/môi trường làm việc hiện tại.
        
-   **Bước 3: AI Translation & Analysis (Phân tích lỗi bằng AI)**:
    
    -   Dán toàn bộ đoạn Log lỗi vào AI kèm câu lệnh yêu cầu giải thích nguyên nhân bằng tiếng Việt và đề xuất hướng khắc phục.
        
    -   Nếu AI đưa ra câu lệnh hệ thống phức tạp, áp dụng _Reverse Prompt_ để đảm bảo an toàn.

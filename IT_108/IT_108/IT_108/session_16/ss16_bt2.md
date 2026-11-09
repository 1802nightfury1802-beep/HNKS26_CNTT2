# Bài 2 : Quản lý Quyền truy cập Báo cáo Tài chính

## Yêu cầu:

-   Bảng thiết kế phân quyền cho từng đối tượng tương ứng.
    
-   Kịch bản xử lí sự cố, quy trình 3 bước xử lí.

## Vấn đề:

- Một nhân viên đã vô tình gửi link chứa thông tin CV ,SĐT và mức lương kỳ vọng với quyền edit cho 1 ứng viên bên ngoài.

## Cách làm:

### Bản thiết kế Phân quyền An toàn (Quy tắc Cờ Đỏ Bảo mật):

|Đối tượng / Nhóm người dùng |Mức quyền hạn tối ưu |Lý do & Phạm vi bảo vệ |
|-|-|-| 
|Ứng viên bên ngoài / Người lạ |No Access (Chặn hoàn toàn) |Bảo vệ thông tin nhạy cảm (SĐT, mức lương kỳ vọng), tuyệt đối không cấp link Public. |
|Trưởng bộ phận  |Commenter (Chỉ xem & Nhận xét) |Cho phép xem và góp ý qua tính năng _Suggesting/Comment_, ngăn chặn việc chỉnh sửa trực tiếp dữ liệu gốc. |
|Trưởng phòng nhân sự |Editor / Full Access |Quản lý dữ liệu, duyệt các đề xuất điều chỉnh từ các trưởng bộ phận và quản trị file. |

### Kịch bản Xử lý Sự cố (3 Bước xử lý rò rỉ quyền Editor)

1.  **Bước 1: Thu hồi quyền khẩn cấp & Vô hiệu hóa liên kết**
    
    -   Truy cập phần quản lý chia sẻ (Share Settings) của tệp, đổi quyền liên kết chung thành **Restricted (Hạn chế)** và xóa ngay quyền truy cập của tài khoản ứng viên ngoài.
        
2.  **Bước 2: Kiểm tra dấu vết qua Access Audit Log (Nhật ký hoạt động)**
    
    -   Xem lịch sử hoạt động (Activity / Version History) của file trên Cloud để xác định xem tài khoản ứng viên đã thực hiện thao tác **View, Copy hay Download** dữ liệu hay chưa.
        
3.  **Bước 3: Kích hoạt phương án dự phòng & Thông báo rủi ro**
    
    -   Nếu phát hiện dữ liệu đã bị tải về, lập tức sao lưu dữ liệu sang file mới bảo mật, đồng thời báo cáo cấp trên để có phương án pháp lý hoặc chính sách bảo vệ thông tin ứng viên kịp thời.

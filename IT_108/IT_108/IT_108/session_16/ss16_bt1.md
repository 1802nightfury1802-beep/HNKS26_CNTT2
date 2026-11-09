# Yêu cầu là:
-   Báo cáo phân tích: Sơ đồ luồng dữ liệu từ Local SSD lên Cloud và cách hệ thống xử lý khi có xung đột phiên bản (File Version Conflict).
    
-   Quy trình thực thi: Danh sách 3 bước thiết lập phần mềm đồng bộ chuẩn cho một Designer.

# Vấn đề:
- Làm thế nào để đảm bảo dữ liệu không bị đứt đoạt đồng bộ khi máy tính đột ngột mất kết nối Internet hoặc bị sập nguồn giữa chừng?
- 
# Các bước thực hiện:


## Báo cáo Phân tích:

### 1. Sơ đồ Luồng Dữ liệu (Local SSD -> Cloud) & Cơ chế Xử lý Xung đột:

-   **Sơ đồ luồng dữ liệu (Hybrid Workflow):**
    
    1.  **Thao tác Local:** Designer nhấn `Ctrl + S` trên phần mềm đồ họa -> File cập nhật tức thì trên ổ cứng Local SSD.
        
    2.  **Lắng nghe sự thay đổi :** Phần mềm đồng bộ (Drive/OneDrive) phát hiện sự thay đổi tập tin trên Local SSD.
        
    3.  **Tải lên nền:** File/Khối dữ liệu thay đổi (Block-level sync) được đẩy lên Cloud Storage theo thời gian thực.
        
    4.  **Lưu phiên bản :** Cloud cập nhật file mới nhất và tự động đánh dấu bản ghi lịch sử (Version History).
        
-   **Xử lý khi mất kết nối / Sập nguồn đột ngột (Xử lý Bẫy dữ liệu):**
    
    -   Phần mềm đồng bộ sử dụng cơ chế **Offline Queue (Hàng chờ ngoại tuyến)** & **Journaling**. Khi mất mạng hoặc sập nguồn, dữ liệu vẫn an toàn trên Local SSD. Tín hiệu mạng phục hồi sẽ kích hoạt đồng bộ nối tiếp các khối dữ liệu chưa hoàn thành.
        
-   **Giải quyết xung đột phiên bản (File Version Conflict):**
    
    -   Khi 2 thành viên cùng chỉnh sửa song song hoặc đồng bộ đè lên nhau, Cloud sẽ **không ghi đè trực tiếp**.
        
    -   Hệ thống tự động nhân bản thành file xung đột (ví dụ:  `TenFile_Conflict_UserA.3ds`) -> Designer đối chiếu Version History trên Cloud để khôi phục bản vẽ ổn định nhất.
        

## Quy trình Thực thi (3 Bước cho Designer):

1.  **Bước 1: Cài đặt & Tạo thư mục đồng bộ (Sync Root)**
    
    -   Tải ứng dụng đồng bộ Cloud (Google Drive for Desktop / OneDrive). Tạo/Chọn thư mục chứa dự án `PTIT_3D_Museum` nằm trên SSD và thiết lập chế độ **Real-time Sync / Mirror files** (Soi chiếu thời gian thực).
        
2.  **Bước 2: Cấu hình Auto-Save & Lưu trực tiếp vào Sync Folder**
    
    -   Cấu hình phần mềm thiết kế 3D tự động lưu (Auto-save/Auto-backup) định kỳ (ví dụ: 5–10 phút) chỉ định đường dẫn về thư mục Sync Folder đã tạo ở Bước 1.
        
3.  **Bước 3: Chuẩn hóa quy trình đặt tên & Khôi phục khi có lỗi**
    
    -   Thực hiện thao tác làm việc hoàn toàn bên trong Sync Folder. Khi phát hiện file hỏng hoặc cần khôi phục, click chuột phải vào file ->  **Version History ** trên Cloud/Web --> Chọn bản làm việc ổn định gần nhất và ấn **Restore **.

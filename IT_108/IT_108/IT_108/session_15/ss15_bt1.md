### **PHẦN 1: PHÂN TÍCH BÀI TOÁN (I/O)**

#### **1. Xác định Đầu vào & Đầu ra**

-   **Đầu vào:**
    
    -   **Vai trò người dùng:** Ban Kỹ thuật (3 người), Ban Thiết kế (2 người), Ban Kinh doanh (2 người), Nhà đầu tư tiềm năng (1 người ngoài).
        
    -   **Cấp độ tài liệu:** Mã nguồn/API keys (Nhạy cảm), Tài sản đồ họa UI, Business Plan & Slide Pitch (Tài liệu chung/chiến lược).
        
    -   **Yêu cầu nghiệp vụ:** Tối thiểu quyền, chống rò rỉ, cộng tác chéo an toàn, lưu lịch sử phiên bản trên Cloud, tự động thu hồi quyền hạn.
        
-   **Đầu ra mong đợi:**
    
    -   Cấu trúc thư mục Google Drive 2 cấp phân lập rõ ràng theo dự án và tiểu ban.
        
    -   Bảng phân quyền chi tiết cho từng vai trò trên từng loại tài liệu.
        
    -   Phương án xử lý các tình huống bẫy dữ liệu và quy trình cấu hình an toàn.
        

#### **2. Đề xuất giải pháp cấu trúc thư mục Google Drive 2 cấp**:

-   ` 00. CampusPay_ROOT (Thư mục gốc dự án)`
    
    -   ` 01. General_Management` (Chứa tài liệu chung, biên bản họp, chiến lược tổng thể của dự án).
        
    -   ` 02. Tech_Department` (Chứa mã nguồn, tài liệu API, thông tin cấu hình nhạy cảm/API keys).
        
    -   ` 03. Design_Department` (Chứa file thiết kế UI/UX, asset đồ họa, Brand Guidelines).
        
    -   ` 04. Business_Department` (Chứa Business Plan chi tiết, tài liệu tài chính).
        
    -   ` 05. External_Pitching` (Chứa Slide Pitch, bản tóm tắt Business Summary dùng riêng cho việc gọi vốn).
        

#### **3. Thiết kế các bước lập cấu hình hệ thống (Step-by-Step)**:

-   **Bước 1 (Tạo và đặt tên):** Tạo thư mục gốc `00. CampusPay_ROOT` và các thư mục cấp con theo đúng sơ đồ 2 cấp đã định nghĩa ở trên.
    
-   **Bước 2 (Cấp quyền cơ bản):** Thiết lập chế độ chia sẻ là **Hạn chế** cho toàn bộ hệ thống; cấp quyền truy cập qua email cá nhân/công vụ cho từng trưởng nhóm/thành viên theo đúng nguyên tắc đặc quyền tối thiểu.
    
-   **Bước 3 (Thiết lập chia sẻ chéo & bảo mật):** Cấu hình quyền riêng cho các thư mục dùng chung (như `External_Pitching` / tài liệu chia sẻ chéo giữa Kinh doanh và Kỹ thuật).
    
-   **Bước 4 (Kiểm tra):** Rà soát lại danh sách thành viên truy cập, kiểm tra tính năng bật lưu trữ _Version History_ tối thiểu 30 ngày trên Cloud.
    
-   **Bước 5 (Thu hồi/Cập nhật):** Thiết lập thời gian hết hạn cho các tài khoản bên ngoài (như Nhà đầu tư) và thực hiện thu hồi ngay khi nhân sự thay đổi vị trí hoặc nghỉ việc.

### **PHẦN 2: TRIỂN KHAI & CHỐNG LỖI**

#### **4. Bảng phân quyền hoàn chỉnh**

|Loại tài liệu|Ban KT |Ban TK |Ban KD |Nhà đầu tư |Ghi chú bảo mật | 
|-|-|-|-|-|-|
|Mã nguồn & API Keys |Editor |No Access | No Access|No Access |Bảo mật tuyệt đối, Restricted, cấm chia sẻ ngoài Ban KT. |
|Tài sản đồ họa UI |Viewer |Editor |No Access |No Access |Ban KT chỉ xem để tích hợp giao diện. | 
|Business Plan |Commenter |No Access |Editor |Viewer |Ban KT chỉ xem góp ý (Bẫy 1), Nhà đầu tư chỉ đọc. |
|Slide Pitch (Gọi vốn) |Viewer |Viewer |Editor |Viewer |Dùng chung để thuyết trình, Nhà đầu tư được xem/tải PDF (Bẫy 2). |
|Tài liệu chung dự án |Viewer |Viewer |Viewer |Viewer |Phục vụ nắm bắt thông tin chung toàn dự án. |


#### **5. Giải quyết 3 bẫy dữ liệu**

-   **Bẫy 1 (Kinh doanh muốn chia sẻ Business Plan cho Kỹ thuật hiểu context nhưng không cho sửa):**
    
    -   _Quyền cấp:_  **Commenter (Người bình luận)** hoặc **Viewer (Người xem)**. (Nên dùng **Commenter** để Kỹ thuật có thể để lại câu hỏi trực tiếp trên lề văn bản nếu cần).
        
    -   _Tính năng bổ sung:_ Không bật chỉnh sửa (Editor). Đảm bảo tuân thủ nguyên tắc Kỹ thuật nắm được nội dung nghiệp vụ nhưng không thể làm thay đổi hay xóa dữ liệu gốc của bản kế hoạch kinh doanh.
        
-   **Bẫy 2 (Nhà đầu tư muốn tải PDF Slide Pitch offline nhưng không có quyền sửa):**
    
    -   _Quyền cấp:_  **Viewer (Người xem)**.
        
    -   _Cấu hình tính năng:_  **GIỮ NGUYÊN (Không tắt)** tùy chọn _"Viewers can download..."_ (cho phép người xem tải xuống/in/sao chép) đối với riêng file PDF Slide Pitch này.
        
    -   _Giải thích:_ Vì Nhà đầu tư cần bản PDF để thuyết trình offline, việc cho phép tải file định dạng tĩnh (PDF) không làm ảnh hưởng đến tệp nguồn chỉnh sửa gốc trên đám mây, đồng thời vẫn giữ họ ở mức quyền Viewer nên họ hoàn toàn không có khả năng chỉnh sửa cấu trúc hay nội dung slide.
        
-   **Bẫy 3 (Xử lý khi có thành viên nghỉ việc để cắt đứt quyền truy cập lập tức):**
    
    -   _Thao tác cần làm:_
        
        1.  Truy cập ngay vào phần quản lý chia sẻ  của Thư mục gốc `00. CampusPay_ROOT` / tài khoản quản trị hệ thống Workspace.
            
        2.  Xóa triệt để địa chỉ email cá nhân của nhân sự đó khỏi danh sách phân quyền.
            
        3.  Kiểm tra và thu hồi các liên kết chia sẻ trực tiếp (nếu có); đồng thời kiểm tra lại danh sách thiết bị đang đồng bộ ngầm qua ứng dụng Desktop  để hệ thống tự động ngắt kết nối đồng bộ dữ liệu.

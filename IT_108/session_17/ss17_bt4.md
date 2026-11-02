# Yêu cầu:
-   Kiến trúc **HTTP Request Flow** và 4 tab **DevTools F12**
    
-   **Browser Profile** và tổ chức **Bookmark** khoa học
    
-   Phân biệt **Cache vs Cookies**
    
-   Mô hình **3 Profile chuẩn Developer**
    
-   Lựa chọn **Extensions** theo đúng nhóm chức năng
    
-   Kỹ năng **Inspect Element** và **Network Tab** để debug

# Vấn đề:

Bạn vừa bắt đầu kỳ **thực tập Developer** tại một công ty công nghệ. Công ty cấp cho bạn một **tài khoản GitHub công ty** (khác với tài khoản GitHub cá nhân bạn vẫn dùng). Ngày đầu tiên, mentor giao 2 việc:

1.  **_Thiết lập môi trường trình duyệt làm việc chuẩn Dev._**
    
2.  **_Hỗ trợ debug một lỗi hiển thị đang xảy ra trên trang nội bộ_** `test.internal-tool.com`**_._**

# Cách làm:

### Phần A – Thiết lập Profile và Bookmark chuẩn Dev

1.  **Xung đột phiên đăng nhập (Session Conflict):** Dùng chung 1 Profile cho cả hai tài khoản GitHub sẽ khiến trình duyệt ghi đè Cookies/Token phiên xác thực trong cùng một thư mục `User Data Directory`. Khi đăng nhập tài khoản công ty, token cá nhân sẽ bị vô hiệu hóa (hoặc ngược lại), dẫn đến việc liên tục bị văng phiên (Logout) hoặc push nhầm mã nguồn bằng tài khoản cá nhân.
    
2.  **Mô hình 3 Profile chuẩn Developer:**
    
    -   **Profile 1:** Tên:  `Personal` — Mục đích: Giải trí, mạng xã hội, tài khoản GitHub cá nhân.
        
    -   **Profile 2:** Tên:  `Company_Work` — Mục đích: Làm việc, email công ty, tài khoản GitHub công ty.
        
    -   **Profile 3:** Tên:  `Sandbox/Test` — Mục đích: Kiểm thử tính năng, test extension mới, mượn máy tạm thời.
        
3.  **Cấu trúc Bookmark chuẩn 3 thư mục:**
    
    -   📁 `01_Work_Internal`:  `test.internal-tool.com`,  `GitHub Company Repo`
        
    -   📁 `02_Dev_Tools`:  `MDN Web Docs`,  `Can I Use`
        
    -   📁 `03_Daily_Utilities`:  `ChatGPT`,  `Google Drive`
        
4.  **Chế độ khi đồng nghiệp mượn máy 5 phút:** Sử dụng **Guest Profile** (hoặc mở cửa sổ **Incognito**).  _Lý do:_ Tạo không gian cô lập hoàn toàn, không lưu lịch sử hay truy cập được vào dữ liệu cá nhân của Profile chính.
    

### Phần B – Chọn đúng Extension hỗ trợ

1.  **Nhóm Extension:** Thuộc nhóm **Dev Suite** (Cụ thể là tiện ích định dạng JSON như _JSON Formatter_).
    
    -   _Vì sao 2 nhóm còn lại không phù hợp:_ Nhóm _Productivity Suite_ (quản lý công việc/ghi chú) và _Security Suite_ (chặn quảng cáo/bảo mật) không có tính năng parse và highlight cấu trúc dữ liệu JSON thô.
        
2.  **Cấu hình Site Access:** Chọn **On click** (hoặc _On specific sites_).  _Lý do theo quy tắc quản trị:_ Tránh việc extension tự động đọc dữ liệu nhạy cảm trên mọi trang web (vừa tối ưu hiệu năng RAM, vừa bảo mật thông tin nội bộ công ty).
    

### Phần C – Phân tích luồng HTTP Request

1.  **4 giai đoạn xử lý (Luồng HTTP Request Flow):** DNS Lookup (Phân giải tên miền thành IP) -> TCP/TLS Handshake (Bắt tay thiết lập kết nối mã hóa) -> HTTP Request & Response (Gửi yêu cầu và nhận phản hồi) -> Rendering Pipeline (Dựng hình DOM/CSSOM).
        
2.  **So sánh mã trạng thái và hướng debug:**

|Mã trạng thái|ý nghĩa|Lỗi|Hướng debug|
|-|-|-|-|
|404 Not Found |Không tìm thấy tài nguyên/URL trên server |Client (sai đường dẫn URL) hoặc Server (thiếu route) |Kiểm tra lại cú pháp URL trên thanh địa chỉ hoặc cấu hình Routing. |
|500 Internal Server Error |Lỗi xử lý nội bộ phía máy chủ |Server-side Backend / Database |Mở tab Network/Console xem log lỗi từ server hoặc kiểm tra kết nối CSDL. |

### Phần D – Chẩn đoán Cache và Cookies

1.  **Nguyên nhân và khắc phục lỗi CSS cũ sau khi F5:**
    
    -   _Nguyên nhân:_ Trình duyệt đang tải file CSS từ bộ nhớ đệm (Disk Cache/Memory Cache).
        
    -   _Khắc phục:_ Nhấn tổ hợp phím **`Ctrl + Shift + R`** (Hard Reload) hoặc giữ phím Shift kết hợp bấm nút Reload để ép trình duyệt bỏ qua cache và tải lại toàn bộ tài nguyên mới từ Server.
        
2.  **Rủi ro bảo mật khi Cookie thiếu HttpOnly:** Kẻ xấu có thể dùng mã độc JavaScript (tấn công **XSS - Cross-Site Scripting**) để đọc và đánh cắp giá trị `session_id` thông qua lệnh `document.cookie`, dẫn đến việc bị chiếm đoạt phiên đăng nhập.
    
3.  **Thao tác xóa phiên đăng nhập nhưng giữ lại Cache ảnh/CSS:**
    
    -   Vào **Tab Application** ➔ Cột trái chọn mục **Cookies** (hoặc Storage) ➔ Nhấp chuột phải chọn Clear/Delete riêng giá trị `session_id`, tuyệt đối không bấm Clear Browsing Data toàn diện.
        

### Phần E – Debug bằng Inspect Element và Network Tab

1.  **Thao tác sửa màu trực tiếp trên trình duyệt:**
    
    -   Nhấn `F12` (hoặc chuột phải chọn Inspect) vào nút "Đăng nhập" ➔ Chọn **Tab Elements** ➔ Tại bảng **Styles**, tìm đến thuộc tính màu (`background-color` hoặc `color`), nhấp vào ô màu để chỉnh sửa trực tiếp mã màu (Hex/RGB) nhằm kiểm chứng thị giác trước khi báo Dev sửa code gốc.
        
2.  **Quy trình 4 Bước Debugging cho request API màu đỏ trên Network:**
    
    -   **Bước 1:** Click vào dòng request bị lỗi màu đỏ đó để mở chi tiết.
        
    -   **Bước 2:** Kiểm tra **Tab Headers** để xem mã trạng thái HTTP (Status Code) và Request URL xem có đúng endpoint không.
        
    -   **Bước 3:** Chuyển sang **Tab Preview / Response** để đọc thông báo lỗi chi tiết từ server trả về.
        
    -   **Bước 4:** Kiểm tra **Tab Payload** để rà soát lại các tham số (Parameters/Body) đã gửi đi xem có bị thiếu hoặc sai kiểu dữ liệu không.
        
3.  **2 thao tác cần bật trên Tab Network:**
    
    -   **Thao tác lọc (Filter):** Nhấn vào nút **Fetch/XHR** để chỉ hiển thị các lời gọi API.
        
    -   **Thao tác chống lưu cache:** Tích chọn ô **Disable cache** (đảm bảo luôn nhận dữ liệu mới nhất từ server khi DevTools đang mở).

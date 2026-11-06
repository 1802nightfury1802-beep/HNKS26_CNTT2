# Yêu cầu:

-   Triệt tiêu 100% tình trạng văng phiên đăng nhập giữa các tài khoản khác nhau.
    
-   Áp dụng Mô hình 3 Profile chuyên biệt chuẩn kỹ sư phần mềm (Work, Personal, Sandbox/Test).
    
-   Cấu trúc Bookmark khoa học có thể chứa tối thiểu 30 liên kết quan trọng mà không bị tràn màn hình.
    
-   Bẫy dữ liệu & Ngoại lệ an ninh: Tuyệt đối không để rò rỉ mật khẩu và dữ liệu bệnh nhân khi máy tính phòng khám có sinh viên thực tập mượn tạm thời hoặc khi phòng khám mất kết nối Internet.

# Vấn đề:

- Tại Trạm Y tế Phường thuộc mạng lưới CarePulse, mỗi phòng khám chỉ được trang bị 01 bộ máy tính để bàn để các nhân sự dùng chung: Bác sĩ trực chính, Điều dưỡng viên phụ tá và Bác sĩ thực tập luân phiên. Nhưng hiện tại, tất cả nhân viên đều dùng chung một cửa sổ trình duyệt Google Chrome mặc định. Hậu quả là phòng khám liên tục gặp sự cố hỗn loạn:

# Cách làm:

## Phần 1: Báo cáo phân tích kiến trúc đa Profile

### 1. Nguyên nhân sâu xa dẫn đến hiện tượng "văng phiên đăng nhập" (Session Conflict):

Khi nhiều nhân sự dùng chung **một Profile mặc định duy nhất** trên trình duyệt Chrome, hệ thống lưu trữ toàn bộ dữ liệu (Cookies, Local Storage, Session Storage, Cache) nằm chung bên trong một thư mục hệ thống gọi là **User Data Directory** (cụ thể là thư mục `Default`).

-   **Xung đột Session:** Khi Bác sĩ trực đang đăng nhập hệ thống CarePulse, cookies xác thực (session cookie) của phiên đó đang active. Nếu thực tập sinh mở thêm tab đăng nhập tài khoản cá nhân hoặc ghi đè token phiên, trình duyệt hoặc máy chủ sẽ hiểu là có sự thay đổi định danh hoặc xung đột cookie, dẫn đến việc token cũ bị vô hiệu hóa (Invalidated) và hệ thống tự động **văng đăng xuất ** để đảm bảo bảo mật.

### 2. Thiết kế Mô hình 3 Profile chuyên dụng cho máy tính trạm khám CarePulse:
|Thuộc tính|Profile 1: Work (Chuyên môn Y tế)|Profile 2: Personal (Cá nhân)|Profile 3: Sandbox/Test (Thực tập)|
|-|-|-|-|
|Mục đích sử dụng |Dành riêng cho Bác sĩ trực chính và Điều dưỡng xử lý nghiệp vụ khám chữa bệnh. |Dành cho việc tra cứu thông tin cá nhân, email công vụ phụ, hoặc thư giãn giờ nghỉ.|Dành riêng cho bác sĩ thực tập hoặc sinh viên mượn máy trải nghiệm, thử nghiệm công nghệ.|
|Màu Theme nhận diện |Xanh dương đậm (Medical Blue)|Xanh lá / Xám trung tính |Cam / Đỏ cảnh báo (Sandbox Warning) |
|Dữ liệu độc lập |Cookies/Session:Chỉ lưu phiên đăng nhập CarePulse & Cổng BHY; History:Lưu lịch sử khám bệnh; Bookmarks:Bookmark y tế chuyên ngành; Extensions:Tiện ích tra cứu thuốc, chặn quảng cáo y tế.|Cookies/Session:Tài khoản cá nhân, Google, Mail cá nhân; History: Riêng tư của cá nhân; Bookmarks:Tiện ích cá nhân, giải trí; Extensions:Tiện ích cá nhân.|Cookies/Session:Hoàn toàn cô lập, tự động xóa khi đóng cửa sổ; History:Không lưu trữ lâu dài; Bookmarks: Trống; Extensions:Không cài đặt. |


## Phần 2: Thiết kế hệ thống Bookmark & Quy trình an toàn

### 1. Cây thư mục Bookmark chuẩn cho bác sĩ trực (`Ctrl + Shift + O`)

-   📁 **`01_CarePulse_Clinic`** (Nghiệp vụ cốt lõi)
    
    1.  `Trang chủ CarePulse (Hồ sơ bệnh nhân)`
        
    2.  `Cổng tiếp đón & Quản lý hàng đợi`
        
    3.  `Hệ thống kê đơn thuốc điện tử quốc gia`
        
-   📁 **`02_Pharma_Portal`** (Tra cứu dược lý)
    
    1.  `Tra cứu Dược thư Quốc gia Việt Nam`
        
    2.  `Cổng tra cứu thông tin thuốc Bộ Y tế`
        
    3.  `Cơ sở dữ liệu tương tác thuốc (Drug Interactions)`
        
-   📁 **`03_Medical_Tools`** (Công cụ hỗ trợ chẩn đoán)
    
    1.  `Cẩm nang tra cứu ICD-10 (Mã bệnh lý)`
        
    2.  `Google Dịch Y khoa (Hỗ trợ tài liệu nước ngoài)`
        
    3.  `Công cụ tính toán chỉ số y học (BMI, GFR, Liều lượng theo cân nặng)`
        

### 2. Mẹo tối ưu không gian thanh công cụ với Favicon-Only (Tiết kiệm gấp 3 lần diện tích):

Để thanh Bookmark gọn gàng, chứa hàng chục liên kết mà không bị tràn chữ, áp dụng mẹo **Favicon-Only**:

1.  Nhấp chuột phải vào từng Bookmark trên thanh Bookmark Bar chọn **Edit**.
    
2.  **Xóa sạch toàn bộ phần Tên **, chỉ giữ lại đường dẫn URL, sau đó bấm Save.
    
3.  Trình duyệt sẽ tự động ẩn chữ và **chỉ hiển thị biểu tượng icon** của trang web đó.
    

-   _Áp dụng cho 4 trang web hàng ngày:_ CarePulse, Cổng BHYT, Dược thư, và Google Dịch sẽ chỉ chiếm không gian bằng đúng 4 chiếc icon nhỏ gọn -> thanh công cụ rộng rãi gấp nhiều lần.
    

### 3. Xử lý Bẫy an ninh: Khi có đoàn thanh tra hoặc khách mượn máy 30 phút

-   **Chế độ nên kích hoạt:** Sử dụng **Guest Profile (Khách)** thay vì chế độ Incognito thông thường.
    
-   **Lý do:** Guest Profile tạo ra một phiên làm việc hoàn toàn cô lập, sạch sẽ, không chia sẻ bất kỳ cookie hay dữ liệu nào với các Profile chính. Khi khách đóng cửa sổ Guest, toàn bộ lịch sử duyệt web và dữ liệu nhập vào sẽ **tự động bị xóa sạch** ngay lập tức, ngăn chặn tuyệt đối tình trạng lộ lọt thông tin bệnh nhân.
    
-   **Cảnh báo nguy cơ về Cloud Sync:**  **Tuyệt đối KHÔNG** bật tính năng đồng bộ hóa tài khoản cá nhân (Cloud Sync) trên máy tính dùng chung của trạm y tế. Nếu bật, toàn bộ mật khẩu, lịch sử tìm kiếm, và dữ liệu cá nhân của nhân sự sẽ bị đồng bộ lên đám mây của tài khoản đó và lưu vĩnh viễn trên trình duyệt của phòng khám -> rò rỉ dữ liệu nghiêm trọng cho các đồng nghiệp sử dụng sau.

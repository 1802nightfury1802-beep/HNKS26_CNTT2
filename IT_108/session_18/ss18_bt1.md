# Yêu cầu:
-   **Chức năng 1 (Phân tích mạng):** Giải thích chi tiết tiến trình DNS Lookup từ khi Nam gõ tên miền đến khi trình duyệt tìm thấy địa chỉ IP máy chủ.
    
-   **Chức năng 2 (Chẩn đoán lỗi):** Phân biệt bản chất giữa lỗi DNS và lỗi 500 Internal Server Error để xác định lỗi này nằm ở phía Client hay Server.
- 
# Vấn đề:
- Nam là thực tập sinh tại GreenLogistics. Nam nhận nhiệm vụ truy cập trang quản trị tại địa chỉ [**phong-dieu-phoi.greenlog.vn**](http://phong-dieu-phoi.greenlog.vn) để cập nhật lộ trình xe tải. Tuy nhiên, trình duyệt liên tục báo lỗi **"DNS_PROBE_FINISHED_NXDOMAIN"**. Nam khẳng định do máy chủ công ty bị sập nguồn.

# Cách làm:

## Nhận định ban đầu về lỗi

Lỗi `DNS_PROBE_FINISHED_NXDOMAIN` xuất phát từ việc Nam gõ nhầm tên miền thành `phong-dieu-phoi.grenlog.vn` (thiếu chữ "e"). Trong "cuốn danh bạ Internet" (hệ thống DNS), tên miền này không tồn tại -> việc trình duyệt không thể phân giải ra địa chỉ IP. Do đó, đây là lỗi ở phía **Client** do gõ sai địa chỉ, máy chủ công ty hoàn toàn không bị sập nguồn như Nam nhận định.

## Phần 1. Phân tích: Tiến trình DNS Lookup

-   **Input:** Tên miền (Ví dụ:  `phong-dieu-phoi.greenlog.vn`)
    
-   **Output:** Địa chỉ IP của máy chủ (Ví dụ:  `192.0.2.1`)
    

**Sơ đồ luồng dữ liệu DNS Lookup:**

1.  **Browser Cache:** Trình duyệt kiểm tra xem đã lưu IP của tên miền này trong bộ nhớ tạm gần đây chưa.
    
2.  **OS Cache (Local Machine):** Nếu không có ở trình duyệt, hệ điều hành kiểm tra bộ nhớ đệm DNS cá nhân hoặc file `hosts`.
    
3.  **Recursive Resolver (ISP / DNS công cộng như 8.8.8.8):** Nếu máy tính không có, yêu cầu được gửi tới máy chủ phân giải của nhà mạng.
    
4.  **Root Name Server:** Máy chủ gốc định hướng yêu cầu đến máy chủ quản lý phần mở rộng cấp cao nhất (`.vn`).
    
5.  **TLD Name Server (`.vn`):** Chỉ dẫn đến máy chủ quản lý tên miền của doanh nghiệp (`greenlog.vn`).
    
6.  **Authoritative Name Server (`greenlog.vn`):** Máy chủ thẩm quyền của công ty trả về chính xác địa chỉ IP tương ứng với tên miền con `phong-dieu-phoi`.
    

## Phần 2. Triển khai: Quy trình kiểm tra HTTP Status Code:

Để xác nhận xem yêu cầu từ trình duyệt đã chạm tới máy chủ hay chưa, thực hiện quy trình sau:

1.  **Sử dụng công cụ Developer Tools:** Mở trình duyệt, nhấn phím `F12` hoặc chuột phải chọn **Inspect**, sau đó chuyển sang tab **Network**.
    
2.  **Tải lại trang :** Thực hiện truy cập lại trang web và quan sát dòng yêu cầu (request) tương ứng trong bảng Network.
    
3.  **Đọc mã trạng thái :**
    
    -   **Đã chạm tới máy chủ:** Nhận được các mã phản hồi như `200 OK`,  `403 Forbidden`,  `404 Not Found`, hoặc `500 Internal Server Error`. (DNS phân giải thành công và kết nối mạng đã đến được web server).
        
    -   **Chưa chạm tới máy chủ:** Trình duyệt trả về các lỗi mạng/DNS như `ERR_NAME_NOT_RESOLVED`,  `DNS_PROBE_FINISHED_NXDOMAIN`, hoặc `ERR_CONNECTION_REFUSED`.
        

## Phần 3. Kiểm thử: Xử lý lỗi 404 Not Found

Khi Nam đã sửa đúng tên miền nhưng hệ thống trả về mã **404 Not Found**, vấn đề đang gặp phải là:

-   **Bản chất vấn đề:** Quá trình phân giải DNS và kết nối mạng đã **thành công hoàn toàn** (yêu cầu đã chạm tới đúng máy chủ).
    
-   **Nguyên nhân:** Máy chủ đang hoạt động bình thường, nhưng **đường dẫn (URL/Route) hoặc tài nguyên** mà Nam đang truy cập không tồn tại trên máy chủ (có thể do đường dẫn bị sai chính tả ở phần đuôi, thư mục chứa trang quản trị đã bị di chuyển, hoặc cấu hình định tuyến route của ứng dụng web bị lỗi).

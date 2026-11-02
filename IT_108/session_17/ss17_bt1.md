# Yêu cầu:
**_Phần 1: Báo cáo phân tích (I/O)_**

-   Phác thảo sơ đồ Box Model hiện tại của phần tử bị lỗi qua việc soi thực tế.
    

**_Phần 2: Thiết kế giải pháp_**

-   Đề xuất các thông số thay đổi tại bảng Styles để tách biệt hai khung nội dung mà không làm vỡ tổng thể trang web.


# Vấn đề:
Trong giao diện khóa học của PTIT-LMS, khung **"Nội dung bài học"** đang bị đè lên khung **"Danh sách video"**. Khi soi bằng F12, các thông số kích thước trông rất lộn xộn, không biết khoảng cách nào là do viền (border) hay do lề (margin).


# Cách làm:
## Phần 1: Báo cáo phân tích (I/O & Box Model)

### 1. Phân tích 4 lớp của Box Model qua tab Computed (F12)

Khi dùng F12 soi vào hai phần tử đang bị chồng lấn trên PTIT-LMS, chúng ta thu nhận được thông số thực tế sau:

-   **Khung "Danh sách video" (`.video-list`):**
    
    -   **Content:** Chiếm vùng rộng cố định khoảng `320px`, cao `600px`.
        
    -   **Padding:**  `15px` xung quanh.
        
    -   **Border:**  `1px` viền mảnh bao quanh.
        
    -   **Margin:** Bình thường, không có khoảng cách âm bất thường.
        
-   **Khung "Nội dung bài học" (`.lesson-content`):**
    
    -   **Content:** Chiếm không gian còn lại của màn hình.
        
    -   **Padding:**  `20px` xung quanh.
        
    -   **Border:**  `1px` viền mảnh.
        
    -   **Margin (Thủ phạm gây lỗi):** Đang dính **Margin âm (`margin-top: -35px`)**. Đây chính là chiếc "lò xo" kéo phần tử này dịch chuyển ngược lên trên, đè trực tiếp vào không gian của khung danh sách video bên cạnh.
        

### 2. Phác thảo sơ đồ Box Model hiện tại của phần tử bị lỗi:

![sơ đồ phác thảo](
https://docs.google.com/document/d/1JpkvGWXtzGm2qG2JV0zQ2Is8-wp40YNT-HYftmdEslc/edit?usp=sharing)

### 3. Dự đoán bẫy dữ liệu (Rendering Engine Pitfall):

Nếu bạn thay đổi trực tiếp thuộc tính `margin` để kéo dãn khoảng cách mà **không kiểm tra lớp Padding và thuộc tính `box-sizing`**:

-   Trình duyệt sẽ tính toán sai lệch hình học (do `box-sizing` mặc định tính cộng dồn kích thước).
    
-   Các khung hình sẽ bị phình to bất thường, tự động đẩy tràn ra ngoài màn hình hoặc làm xuất hiện thanh cuộn ngang/dọc vô cớ, khiến giao diện tiếp tục vỡ tung tóe.
    

## Phần 2: Thiết kế giải pháp (Styles Panel Adjustments)

Để tách biệt hoàn toàn hai khung nội dung một cách khoa học và không làm vỡ tổng thể trang web PTIT-LMS, chúng ta đề xuất các thông số thay đổi trực tiếp tại bảng **Styles** như sau:

### 1. Xử lý khối chứa cha (`.course-container`)

Thay vì dùng các khoảng cách margin âm thủ công dễ gây lỗi, hãy chuyển khối chứa sang dạng linh hoạt (Flexbox):

CSS

```
.course-container {
    display: flex;             /* Sắp xếp các khung con nằm ngang hàng */
    flex-direction: row;
    gap: 16px;                 /* Tạo khoảng cách an toàn, chuẩn xác giữa 2 khung */
    box-sizing: border-box;    /* Đồng bộ cách tính kích thước */
    width: 100%;
}

```

### 2. Tinh chỉnh thông số cho hai khung con

-   **Cho khung "Danh sách video" (`.video-list`):**
    
    CSS
    
    ```
    flex: 0 0 320px;           /* Cố định cứng chiều rộng cột video là 320px */
    padding: 15px;
    box-sizing: border-box;    /* Đảm bảo padding không làm phình rộng phần tử */
    
    ```
    
-   **Cho khung "Nội dung bài học" (`.lesson-content`):**
    
    CSS
    
    ```
    flex: 1;                   /* Tự động co giãn lấp đầy phần không gian còn lại */
    padding: 20px;
    margin: 0;                 /* Xóa sạch toàn bộ margin âm đang gây đè lấn */
    box-sizing: border-box;
    ```


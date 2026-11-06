# Yêu cầu:

-   **Chức năng 1 (Định vị phần tử):** Sử dụng tính năng Inspect Element để định vị chính xác thẻ HTML bị lỗi trong cây DOM Tree.
    
-   **Chức năng 2 (Tối ưu Layout):** Phân tích 4 lớp của CSS Box Model (Content, Padding, Border, Margin) để tách biệt hai khung nội dung.

# Vấn đề:

- Giao diện **"Theo dõi lộ trình xe"** trên web đang bị vỡ: Khung "Thông tin tài xế" đang đè lên khung "Danh sách trạm". Khi soi bằng F12, các thông số kích thước trông rất lộn xộn.

# Cách làm:

## Phần 1. Phân tích: Sơ đồ Box Model từ DevTools:

![sơ đồ phác thảo](
https://docs.google.com/document/d/1NpSiFVhc8Hd0eNlBPxBFTCYVMPO-T-dwFi6da3EEWQc/edit?usp=sharing)

## Phần 2. Triển khai: Thông số CSS mới qua tab Styles:
-   **Định vị đúng phần tử:** Tại cây DOM bên phải, click chọn thẻ chứa khung **"Thông Tin Tài Xế"** (đang bị lỗi đè lên trên).
    
-   **Thêm hoặc sửa thuộc tính lề trên/dưới:**
    
    -   Nhấp chuột vào dòng `element.style { }` (khung trống ở phía trên cùng của tab Styles).
        
    -   Gõ thuộc tính `margin-top: 50` hoặc `margin-bottom: 25px` và kéo dãn khoảng cách.
        
-   **Thu hẹp chiều rộng (nếu cần):** Chỉnh lại giá trị `width` về mức vừa vặn bằng cách nhập số nhỏ hơn / bỏ dấu tích chọn các dòng `width` đang bị lỗi ở phía dưới để giao diện tự co về chuẩn 100%.

### Phần 3. Kiểm thử: Xử lý trường hợp Margin không tác dụng

- Khi đã thay đổi thông số Margin nhưng phần tử vẫn đứng yên, cần kiểm tra các nguyên nhân sau tại tầng Browser Engine:

1.  **Độ ưu tiên CSS (Specificity) hoặc cờ `!important`:** Có một đoạn CSS khác có độ ưu tiên cao hơn (hoặc dùng `!important`) đang ghi đè thuộc tính Margin vừa nhập. Hãy quan sát trong tab _Styles_, nếu thuộc tính bị gạch ngang (strikethrough), nghĩa là nó đã bị ghi đè.
    
2.  **Hiệu ứng sụp đổ lề (Margin Collapse):** Hai khối block nằm cạnh nhau theo chiều dọc có thể bị gộp chung khoảng cách lề.
    
3.  **Thuộc tính Display không hỗ trợ:** Phần tử có thể đang ở trạng thái `display: inline`, khiến các thuộc tính `margin-top` hoặc `margin-bottom` theo chiều dọc không có hiệu lực.

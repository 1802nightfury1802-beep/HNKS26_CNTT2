# Vấn đề:
Một cửa hàng bán laptop nhận được khiếu nại từ khách hàng:

- "Tôi mua laptop cách đây 10 ngày. Máy thường xuyên bị nóng, quạt kêu to và pin chỉ sử dụng được khoảng 2 tiếng. Tôi đã mang đến cửa hàng kiểm tra nhưng nhân viên chỉ vệ sinh máy và trả lại. Sau 2 ngày, tình trạng vẫn tiếp diễn. Tôi muốn đổi máy hoặc hoàn tiền."

- Nhân viên chăm sóc khách hàng cần sử dụng AI để phân tích tình huống và đề xuất phương án xử lý phù hợp. Tuy nhiên, nếu yêu cầu AI trả lời ngay, kết quả có thể thiếu căn cứ hoặc bỏ sót vấn đề quan trọng.

# Yêu cầu:
Thiết kế prompt để AI thực hiện:

-   Xác định các vấn đề khách hàng đang gặp phải.
    
-   Phân tích mức độ nghiêm trọng của từng vấn đề.
    
-   Xác định thông tin còn thiếu cần xác minh.
    
-   Đề xuất 2 phương án giải quyết phù hợp.
    
-   Soạn phản hồi chuyên nghiệp gửi khách hàng.

# Cách làm:
### 1. Promt hoàn chỉnh:

Bạn là chuyên gia chăm sóc khách hàng giúp tôi xử lí vấn đề của khách hàng: Khách hàng mua laptop tại cửa hàng cách đây 10 ngày. Máy thường xuyên bị nóng, quạt kêu to và pin chỉ sử dụng được khoảng 2 tiếng. Khách hàng có phản ánh và mang đến cửa hàng kiểm tra nhưng nhân viên chỉ vệ sinh máy và trả lại

B1: Liệt kê các vấn đề khách hang gặp phải và đánh giá mức độ nghiêm trọng
B2: Phân loại các dữ liệu thực tế
B3: Liệt kê còn thiếu để xác minh( còn nguyên nhân khác nữa không)
B4: Đề xuất 2 phương án xử lí kèm ưu- nhược điểm của 2 phương án đó
B5: Soạn tin nhắn để phản hồi khách hang, không tự thay oổi chính sách trả của cửa hang, không kết luận lỗi phần cứng khi không có căn cứ.

### 2. Báo cáo phân tích theo từng bước (Chain-of-Thought Analysis Report)

-   **B1: Kết quả đánh giá vấn đề và mức độ nghiêm trọng**
    
    -   **Vấn đề kỹ thuật trên thiết bị:** Hiện tượng máy nóng, quạt kêu to và pin sụt nhanh trong 2 tiếng (Mức độ nghiêm trọng:  **Trung bình - Cao**). Ảnh hưởng trực tiếp đến trải nghiệm và công việc của khách.
        
    -   **Vấn đề dịch vụ & quy trình (Nghiêm trọng nhất):** Khách hàng phải đi lại nhiều lần nhưng nhân viên lần đầu chỉ vệ sinh hời hợt rồi trả máy, khiến lỗi lặp lại sau 2 ngày. Điều này làm sụt giảm nghiêm trọng niềm tin vào uy tín cửa hàng.
        
-   **B2: Phân loại dữ liệu thực tế**
    
    -   _Dữ kiện (Facts):_ Máy mua cách đây 10 ngày; hiện tượng nóng, quạt kêu, pin ~2 tiếng; đã bảo hành 1 lần nhưng không dứt điểm; khách đang yêu cầu giải quyết.
        
    -   _Giả thuyết (Hypotheses):_ Có thể do lỗi phần cứng (tản nhiệt, cell pin) hoặc do xung đột phần mềm/ứng dụng chạy ngầm; quy trình tiếp nhận của kỹ thuật viên lần 1 chưa đạt chuẩn.
        
    -   _Thông tin chưa xác định (Unknowns):_ Cấu hình máy, mục đích sử dụng thực tế của khách, chính sách đổi trả/bảo hành chính thức của cửa hàng trong 10 ngày đầu.
        

### 3. Danh sách các thông tin cần xác minh

-   **Xác minh hiện trạng kỹ thuật:**
    
    -   Tình trạng thực tế của máy khi chạy tải nhẹ và tải nặng (nhiệt độ CPU/GPU thực đo bằng phần mềm).
        
    -   Kiểm tra Báo cáo pin (Battery Report) để xem số lần sạc và mức độ hao hụt dung lượng thực tế.
        
-   **Xác minh thói quen sử dụng:** Khách hàng sử dụng các ứng dụng gì? Có cắm sạc liên tục khi dùng tác vụ nặng không?
    
-   **Xác minh quy trình nội bộ:** Hỏi lại kỹ thuật viên đã tiếp nhận máy ở lần 1 về lý do vì sao chỉ vệ sinh bề mặt mà không kiểm tra sâu phần cứng/phần mềm.
- 
### 4. Hai phương án xử lý kèm ưu điểm và hạn chế:
|Phương án |Nội dung chi tiết |Ưu điểm |Nhược điểm |
|-|-|-|-|
|Phương án 1: Thu hồi máy kiểm tra kỹ thuật chuyên sâu & Đối chiếu chính sách |Mời khách hàng gửi lại máy để kỹ thuật trưởng trực tiếp kiểm tra toàn diện, có biên bản minh bạch, sau đó căn cứ vào chính sách bảo hành/đổi trả thực tế của cửa hàng để đưa ra hướng xử lý thỏa đáng. |Có căn cứ kỹ thuật chính xác, tránh kết luận vội vàng hay đổi trả sai quy định,thể hiện sự cầu thị và nghiêm túc khắc phục lỗi của nhân viên ở lần 1 |Khách hàng có thể tiếp tục cảm thấy phiền hà do phải chờ đợi thêm thời gian. |
|Phương án 2: Cấp máy dùng tạm (Loaner) trong lúc giữ máy thẩm định |Tiến hành thu hồi máy kiểm tra chuyên sâu như Phương án 1, đồng thời bàn giao ngay cho khách hàng một chiếc laptop cấu hình tương đương để sử dụng tạm thời trong thời gian cửa hàng xử lý. |Xoa dịu nhanh chóng sự bức xúc của khách,giúp khách hàng không bị gián đoạn công việc/học tập, giữ chân khách hàng tốt hơn |Phát sinh chi phí vận hành, quản lý tài sản tạm thời và cần nguồn máy dự phòng tại cửa hàng. |


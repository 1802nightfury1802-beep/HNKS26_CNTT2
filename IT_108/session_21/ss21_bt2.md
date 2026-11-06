# Yêu cầu:
-   Lập bảng so sánh Ưu/Nhược điểm của Google Search và AI Assistant dựa trên các tiêu chí: Độ chính xác, Tính cập nhật, Khả năng giải thích và Rủi ro (Hallucination).
    
-   Đưa ra lựa chọn: Trong trường hợp nào thì bắt buộc phải dùng Google Search để đảm bảo an toàn cho máy tính

# Vấn đề:

- Một dự án phần mềm bị lỗi xung đột cổng (Port conflict). Một thành viên muốn dùng Google Search để tìm bài viết trên StackOverflow, thành viên khác muốn dán mã lỗi vào AI để hỏi.

# Cách làm:

## 1. Bảng so sánh Ưu/Nhược điểm giữa Google Search và AI Assistant:

|Tiêu chí |Google Search |AI Assistant |
|-|-|-|
|Độ chính xác |Cao (với lỗi phổ biến): Do câu trả lời thường đến từ kinh nghiệm thực tế của các lập trình viên khác đã được kiểm chứng |Trung bình - Khá: AI rất giỏi tổng hợp, nhưng đôi khi có thể đưa ra các giải pháp chung chung hoặc suy luận sai logic nếu ngữ cảnh không đủ rõ. |
|Tính cập nhập |Rất cao: Luôn cập nhật tức thì các bài đăng, thảo luận mới nhất hoặc các bản vá lỗi cho các phiên bản thư viện/công cụ vừa phát hành hôm nay. |Phụ thuộc vào dữ liệu huấn luyện / kết nối web: Nếu không tích hợp công cụ tìm kiếm trực tuyến thời gian thực, AI có thể bỏ sót các lỗi hoặc phiên bản công cụ mới ra mắt. |
|Khả năng giải thích |Thấp - Trung bình: Bạn phải tự đọc qua nhiều bài viết, chắt lọc thông tin và tự liên hệ với mã nguồn của mình để hiểu bản chất. |Rất cao: AI có thể phân tích trực tiếp đoạn mã nguồn của bạn, giải thíchặn kẽ nguyên nhân gốc rễ và điều chỉnh giải pháp theo đúng ngữ cảnh thực tế. |
|Rủi ro |Thấp: Nội dung hiển thị là các văn bản có sẵn từ người thật viết, hiếm khi xuất hiện thông tin bịa đặt hoàn toàn. |Có rủi ro: AI đôi khi có thể tự bịa ra tên các câu lệnh, tham số không có thật hoặc tên gói thư viện không tồn tại. |

#### 2. Lựa chọn: Trường hợp bắt buộc phải dùng Google Search để đảm bảo an toàn

Trong trường hợp liên quan đến: **bảo mật hệ thống, thực thi các câu lệnh thay đổi cấu hình sâu, chạy các đoạn lệnh script lạ/đoạn mã chạy trực tiếp trên máy tính**, **bắt buộc phải sử dụng Google Search** vì:
 
    -   AI có rủi ro tạo ra hiện tượng "ảo giác" (hallucination), có thể đưa ra các câu lệnh Terminal/PowerShell trông rất hợp lý nhưng thực chất chứa tham số nguy hiểm.

    -   Đối với các vấn đề bảo mật quan trọng, việc tra cứu trực tiếp từ tài liệu chính thống giúp đảm bảo tính xác thực tuyệt đối, tránh làm hỏng hệ điều hành hoặc lộ lọt thông tin cá nhân trên máy tính.

#  Yêu cầu:
1. Phân tích IPO: Input, Process, Output
2. Thiết kế promt để hỏi ngược AI để kiểm chứng kết quả trả về của AI.

# Vấn đề:

- 1 bạn hỏi AI cách fix bug: "path not found"  khi cài đạt python, AI trả kết quả nhiều câu lệnh để dán vào terminal. Lệnh này trông rất lạ và có thể can thiệp vào hệ thống!

# Cách làm:
1. Bảng phân tích IPO: 

| |Nội dung |
|-|-|
|Input |Tìm kiếm mã lỗi, công nghệ, thư viện |
|Process |AI tra cứu dựa trên các thông tin từ Intput |
|Output |Danh sách các câu lệnh AI trả về |
2. Giải thích chi tiết từng câu lệnh, câu lệnh có ảnh hưởng đế hệ thống hay không? Có cách khác an toàn hơn không? ->Sau đó mới chạy thử nghiệm:

- "Hãy giải thích chi tiết từng thành phần trong câu lệnh bạn vừa cung cấp hoạt động như thế nào. Cụ thể, nó thay đổi hay tác động đến những tệp hoặc biến môi trường nào trong hệ thống của tôi? Hãy đưa ra tài liệu tham khảo chính thức hoặc cách làm thủ công qua giao diện cài đặt để tôi xác thực độ an toàn trước khi thực thi."


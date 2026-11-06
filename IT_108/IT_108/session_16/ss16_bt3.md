# Vấn đề:
- Dự án quản lý chưa chặt chẽ trên Messenger
- Các thông báo kỹ thuật về cảm biến bị lẫn lộn giữa các tin nhắn tán gẫu và meme hài hước.
- Thành viên thường xuyên quên deadline vì tin nhắn bị đè nát.

# Yêu cầu:
-   Sơ đồ kiến trúc kênh: Danh sách các Channel cần có và quy định nội dung cho từng kênh.
    
-   Bản quy ước giao tiếp: 3 quy tắc vàng để tránh No-Hello Trap và spam @all.

# Cách làm:


## Sơ đồ Kiến trúc Kênh (Workspace Channels):
|Tên Channel |Quy định Nội dung & Mục đích Sử dụng | 
|-|-|
|#01-announcements |Kênh thông báo chính thức từ Trưởng dự án/Quản lý. **Chỉ Admin được đăng**, dùng cho thông báo deadline, quyết định quan trọng (Loại bỏ trôi tin) | 
|#02-tech-sensors |Thảo luận chuyên sâu kỹ thuật cảm biến, chia sẻ tài liệu code, API, sơ đồ mạch. **Bắt buộc dùng tính năng Reply in Thread** cho từng vấn đề cụ thể. |
|#03-general |Trao đổi chung, điều phối công việc hằng ngày giữa các thành viên. |
|#04-random-meme |Kênh giải trí, chia sẻ meme, tán gẫu và chuyện ngoài lề (Giúp giữ các kênh kỹ thuật luôn chuyên nghiệp).|

## Bản Quy ước Giao tiếp Bất đồng bộ (3 Quy tắc Vàng):

1.  **Quy tắc 1: Chống "No-Hello" Trap (Nói rõ vấn đề ngay từ đầu)**
    
    -   _Nghiêm cấm:_ Nhắn chỉ một câu "Alo", "Em hỏi tý" rồi đợi đối phương phản hồi mới vào vấn đề.
        
    -   _Đúng:_ Gửi ngay câu hỏi kèm bối cảnh hoàn chỉnh trong một tin nhắn duy nhất để người nhận có thể đọc và xử lý bất cứ lúc nào 
        
2.  **Quy tắc 2: Tối ưu hóa việc dùng Thread (Phân luồng thảo luận)**
    
    -   Mọi câu trả lời, tranh luận xoay quanh một ý chính hoặc một task cụ thể **bắt buộc phải reply trong Thread** của tin nhắn đó, tuyệt đối không spam tràn lan ra khung chat chính của Channel để tránh làm gián đoạn luồng đọc của người khác.
        
3.  **Quy tắc 3: Hạn chế tuyệt đối `@all / @channel` (Bảo vệ thời gian tập trung của Lập trình viên)**
    
    -   Chỉ sử dụng mention khẩn cấp cho các sự cố hệ thống nghiêm trọng sập server/Deadline gấp trong ngày. Khung giờ làm việc tập trung được quyền tắt thông báo; không ép buộc phản hồi tin nhắn ngay lập tức (cho phép độ trễ phản hồi từ 2–4 tiếng đối với các vấn đề không khẩn cấp).

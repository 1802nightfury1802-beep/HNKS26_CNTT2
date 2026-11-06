## Phần 1: Phân tích & Đề xuất

### 1. Phân tích yêu cầu bài toán:

-   **Đầu vào:** Nhóm startup sinh viên CampusPay (4–5 người, gồm các ban Dev, Design, Kinh doanh), vừa gặp sự cố rò riri dữ liệu/mất file trên Zalo; có thành viên chỉ dùng điện thoại; có đối tác ngoài dùng Zalo.
    
-   **Đầu ra mong đợi:** Giải pháp nền tảng giao tiếp giúp chống trôi tin, lưu file vĩnh viễn, quản lý task rõ ràng, không gián đoạn công việc và vẫn giao tiếp được với đối tác ngoài.
    

### 2. Ưu và nhược điểm theo 5 tiêu chí nghiệp vụ:

-   **Giải pháp A (Zalo):**
    
    -   _Ưu điểm:_ Quen thuộc, miễn phí 100%, dễ xài trên điện thoại, kết nối ngay với đối tác ngoài.
        
    -   _Nhược điểm:_ Tin nhắn cuộn phẳng dễ trôi thông báo, file tự xóa sau thời gian ngắn (mất lịch sử 2 tháng), không tạo được Task/Deadline trực tiếp, khó làm việc bất đồng bộ.
        
-   **Giải pháp B (Lark Suite):**
    
    -   _Ưu điểm:_ Phân kênh (Channel) & Thread chống trôi tin tuyệt đối; lưu file vĩnh viễn trên Cloud; tạo Task + Deadline 1-click; làm việc bất đồng bộ xuất sắc (tích hợp Docs/Calendar).
        
    -   _Nhược điểm:_ Cần 1–2 ngày để cả nhóm làm quen; giao diện phức tạp hơn trên điện thoại so với Zalo.
    
    ## Phần 2: So sánh & Lựa chọn

### 3. Bảng so sánh 5 tiêu chí nghiệp vụ

| Tiêu chí nghiệp vụ | Zalo (Giải pháp A) | Lark Suite (Giải pháp B) |
 | :--- | :--- | :--- | 
 | **1. Ngăn chặn tin nhắn bị trôi** |Trôi nhanh, cuộn phẳng|Channel + Thread riêng |
  | **2. Quản lý công việc (Task/Deadline)** |Phải gõ văn bản thủ công) |1-click biến chat thành Task | 
  | **3. Độ miễn phí & Dễ cài đặt** |  Miễn phí, không cần học |Bản Free đủ dùng, mất 1-2 ngày học | 
  | **4. Tìm kiếm lịch sử & File cũ** |File bị xóa, khó tìm lại |Lưu Cloud vĩnh viễn, Search mạnh | 
  | **5. Giao tiếp bất đồng bộ** |Dễ trôi ngữ cảnh khi đọc muộn |Docs + Thread giữ trọn ngữ cảnh |


### 4. Chốt lựa chọn & Giải quyết 3 Bẫy dữ liệu:

**Đề xuất lựa chọn: Mô hình Lai (Hybrid Approach)** — Dùng **Lark Suite làm nội bộ chính** + **Zalo làm cổng kết nối ngoại giao**.

-   **Lý do chọn & Xử lý 3 bẫy dữ liệu:**
    
    -   **Giải quyết Bẫy 1 (Chỉ có điện thoại):** Lark Suite có app Mobile đầy đủ tính năng (giao việc, chat, xem Docs). Thành viên ban Kinh doanh hoàn toàn thao tác được trên điện thoại.
        
    -   **Giải quyết Bẫy 2 (Chi phí học tập 1-2 ngày):** Đổi lại 1-2 ngày học là việc loại bỏ vĩnh viễn nguy cơ mất file/mất task. Có thể chuyển đổi theo pha: Tạo ngay Kênh Thông báo & Task trước, các tính năng nâng cao học dần.
        
    -   **Giải quyết Bẫy 3 (Giao tiếp đối tác ngoài):** Giữ 1 nhóm Zalo chung với đối tác ngoại giao. Khi có thông tin/yêu cầu từ đối tác trên Zalo, thành viên phụ trách sẽ copy/chuyển tiếp vào Lark Suite để xử lý nội bộ.
        

## Phần 3: Thiết kế & Triển khai Lark Suite:

### 5. Cấu trúc Channel & Quy tắc quản trị:

#### A. Danh sách 5 Channel chuẩn cho CampusPay:

1.  **`#00-thong-bao`**: Đăng tin quan trọng, deadline chung.  _(Chỉ Admin/Leader được đăng; Member chỉ Reply in Thread)_.
    
2.  **`#01-dev-tech`**: Trao đổi kỹ thuật, tài liệu kiến trúc.  _(Toàn bộ ban Tech + Leader)_.
    
3.  **`#02-design`**: Upload UI/UX, Banner, assets.  _(Ban Design + Leader)_.
    
4.  **`#03-kinh-doanh`**: Kế hoạch bán hàng, nội dung làm việc đối tác.  _(Ban KD + Leader)_.
    
5.  **`#04-random-chill`**: Tán gẫu, meme, ăn uống.  _(Tất cả mọi người đều có quyền đăng)_.
    

#### B. Phòng tránh Spam `@all` (Quy tắc cờ đỏ):

-   **Giới hạn quyền:** Phân quyền chỉ cho phép Leader/Admin được dùng `@all` hoặc `@channel`.
    
-   **Chỉ dùng `@all` cho trường hợp khẩn cấp (Cờ đỏ):** Sự cố hệ thống (Downtime), deadline khẩn cấp trong ngày, hoặc thông báo họp khẩn.
    
-   **Quy tắc thay thế:** Các trao đổi thông thường phải dùng `@mentions` đúng cá nhân liên quan hoặc Reply trực tiếp trong **Thread**. Vi phạm lần đầu nhắc nhở, lần 2 phạt quỹ nhóm.

# BÀI LÀM: PHÂN TÍCH VÀ LỰA CHỌN CÔNG CỤ SOẠN THẢO TÀI LIỆU KỸ THUẬT CHO BAN THƯ KÝ HỘI NGHỊ 2026

## PHẦN 1: PHÂN TÍCH & ĐỀ XUẤT (ĐA GIẢI PHÁP)

### 1. Phân tích yêu cầu bài toán (Input / Output)

-   **Đầu vào (Input - Nhu cầu & Nhân sự):**
    
    -   **Quy mô nhóm:** 8 thành viên Ban Thư ký cùng tham gia biên soạn.
        
    -   **Đặc điểm tài liệu:** Tài liệu dài khoảng 40 trang, cấu trúc phức tạp (Mục lục tự động, phân cấp H1/H2/H3, bảng biểu).
        
    -   **Hạ tầng thực tế:** Thiết bị không đồng nhất (có thành viên không có bản quyền/phần mềm Microsoft Word cài sẵn).
        
    -   **Mục đích sử dụng:** In ra giấy A4 phát cho Ban Giám khảo vào ngày diễn ra hội nghị và nộp file cho Giảng viên.
        
-   **Đầu ra mong đợi (Output - Sản phẩm cuối):**
    
    -   File tài liệu hoàn chỉnh, định dạng chuẩn mực, không lỗi font, không vỡ layout khi in ấn A4.
        
    -   Được theo dõi vết chỉnh sửa (Track Changes) và kiểm soát phiên bản minh bạch.
        
    -   Xuất bản định dạng `.pdf` hoặc `.docx` chuẩn phục vụ in ấn và nộp cho Giảng viên.
        

### 2. Phân tích Ưu điểm & Nhược điểm của từng Giải pháp

#### **Giải pháp A: Microsoft Word (.docx) trên OneDrive**

-   **Ưu điểm:**
    
    -   **Định dạng chuyên nghiệp:** Quản lý Styles (Heading 1/2/3), Section Breaks, Header/Footer, Page Numbers, và Auto TOC chuẩn xác, mượt mà trên tài liệu dài (40+ trang).
        
    -   **In ấn hoàn hảo:** Định dạng `.docx` và `.pdf` từ MS Word giữ nguyên 100% layout, lề trang, font chữ khi gửi tới các máy in chạy Windows/MS Office.
        
    -   **Track Changes mạnh mẽ:** Khả năng duy trì và duyệt vết chỉnh sửa (Review/Comments) nâng cao rất rõ ràng.
        
-   **Nhược điểm:**
    
    -   **Bất tiện trên Web:** Word Online cắt giảm nhiều tính năng dàn trang và dàn bảng biểu nâng cao so với bản Word Desktop.
        
    -   **Rào cản bản quyền/Phần mềm:** Yêu cầu máy tính cài đặt bộ Microsoft Office (trả phí) để có trải nghiệm đầy đủ; nếu sửa đồng thời trên bản Desktop qua OneDrive dễ xảy ra xung đột đồng bộ (File Lock / Merge Conflict).
        

#### **Giải pháp B: Google Docs trên Google Drive**

-   **Ưu điểm:**
    
    -   **Cộng tác thời gian thực vượt trội:** 8 người có thể mở và gõ cùng lúc trên trình duyệt mà không giật lag hay khóa file.
        
    -   **Rào cản kỹ thuật bằng 0:** 100% miễn phí, chỉ cần tài khoản Google và trình duyệt web, không cần cài đặt phần mềm.
        
    -   **Lịch sử phiên bản (Version History) minh bạch:** Dễ dàng xem lại ai vừa sửa đoạn nào và khôi phục (rollback) tức thì.
        
-   **Nhược điểm:**
    
    -   **Trình bày tài liệu dài hạn chế:** Quản lý ngắt trang (Section break), đánh số trang phức tạp, và tùy chỉnh bảng biểu trên tài liệu 40 trang không chuyên sâu bằng MS Word.
        
    -   **Nguy cơ vỡ Layout khi xuất `.docx`:** Khi tải xuống dưới dạng `.docx` để in hoặc nộp, các khoảng cách (spacing), font chữ đặc thù hoặc bảng biểu rất dễ bị xê dịch.
        
    -   **Phụ thuộc Internet:** Yêu cầu kết nối mạng liên tục để đồng bộ dữ liệu.
        

## PHẦN 2: SO SÁNH & LỰA CHỌN:
3. Bảng so sánh 5 tiêu chí nghiệp vụ: 
 
|**Tiêu chí nghiệp vụ** |Giải pháp A: MS Word (.docx) / OneDrive |Giải pháp B: Google Docs / Google Drive |
| - | :-: | - |
|1. Cộng tác nhóm (8 người cùng sửa)|⚠️ _(Dễ xung đột nếu dùng bản Desktop; bản Web thiếu tính năng)_|✅ _(Cộng tác thời gian thực mượt mà, không xung đột)_|
|2. Tính năng văn phòng & Dàn trang (40 trang)|✅ _(Mục lục, Heading Styles, Bảng biểu, Section Break rất chuẩn)_|⚠️ _(Đủ dùng căn bản, nhưng dễ xô lệch khi cấu trúc quá dài)_|
|3. In ấn & Xuất PDF (Chuẩn A4, không lỗi font) |✅ _(Định dạng chuẩn tuyệt đối khi xuất PDF / in trực tiếp)_|⚠️ _(Xuất sang `.docx` hoặc `.pdf` có thể sai lệch nhẹ về ngắt trang/margin)_|
|4. Yêu cầu hạ tầng & Bản quyền|❌ _(Yêu cầu cài phần mềm/bản quyền để dùng bản Desktop)_|✅ _(Miễn phí 100%, chạy hoàn toàn trên trình duyệt)_|
|5. Khả năng nộp cho Giảng viên|✅ _(Dạng file `.docx` / `.pdf` truyền thống chuẩn mực)_|⚠️ _(Nếu gửi link cần mở quyền; nếu tải file về dễ vỡ định dạng)_|


### 4. Chốt lựa chọn & Giải pháp Lai (Hybrid Solution)

#### **Phân tích 2 bẫy dữ liệu:**

-   **Bẫy 1 (Thành viên không có MS Word):** Nếu chọn hoàn toàn **Giải pháp A**, thành viên này sẽ bị cô lập, phải dùng Word Online (bị hạn chế tính năng) hoặc không thể tham gia đóng góp nội dung. Điều này vi phạm nguyên tắc cộng tác nhóm 8 người.
    
-   **Bẫy 2 (Máy tính kết nối máy in tại trường chỉ có Word):** Nếu chọn hoàn toàn **Giải pháp B** và mang link Google Docs đến in, máy tính tại trường có thể bị mất mạng, không đăng nhập được tài khoản, hoặc khi tải file `.docx` về mở bằng Word sẽ bị **lỗi vỡ trang/trôi bảng biểu/lỗi font**, dẫn đến tài liệu in phát cho Ban Giám khảo bị thiếu chuyên nghiệp.
    

#### **CHỐT LỰA CHỌN: ĐỀ XUẤT GIẢI PHÁP LAI (HYBRID WORKFLOW)**

Để tối ưu hóa điểm mạnh và loại bỏ bẫy dữ liệu của cả 2 công cụ, Ban Thư ký nên áp dụng quy trình làm việc 2 giai đoạn:

```
[Giai đoạn 1: Biên soạn & Soạn thảo]          [Giai đoạn 2: Dàn trang & In ấn]
       Google Docs (Trình duyệt)       --->         Microsoft Word (Desktop)
  (8 người cùng gõ, theo dõi vết)             (Chuẩn hóa Styles, Xuất PDF & In)

```

1.  **Giai đoạn 1 — Biên soạn nội dung (Trọng tâm: Google Docs):**
    
    -   Tất cả 8 thành viên dùng **Google Docs** để cùng nhau viết nội dung, thảo luận qua Comment, cập nhật tiến độ thời gian thực mà không quan tâm đến việc máy tính có MS Word hay không _(Giải quyết Bẫy 1)_.
        
    -   Quy định nguyên tắc gõ: Dùng đúng văn bản thô, gõ chuẩn các thẻ **Heading 1, Heading 2, Heading 3** có sẵn trên Google Docs.
        
2.  **Giai đoạn 2 — Tối ưu định dạng, Xuất PDF & In ấn (Trọng tâm: MS Word):**
    
    -   Sau khi chốt xong nội dung trên Google Docs, **Trưởng Ban Thư ký** (hoặc thành viên có MS Word Desktop) xuất file dưới dạng `.docx`.
        
    -   Mở file bằng **MS Word Desktop** để tinh chỉnh cuối cùng: Cập nhật Auto TOC, kiểm tra ngắt trang (Page Break/Section Break), chỉnh lề A4 chuẩn, đóng khung bảng biểu.
        
    -   **Xuất file sang định dạng `.pdf`** cố định ngay trên máy cá nhân.
        
    -   Mang file `.pdf` và `.docx` lưu vào USB/Drive đến máy in của trường để in ra giấy phát cho Giám khảo và gửi file `.pdf` / `.docx` cho Giảng viên _(Giải quyết Bẫy 2)_.
        

## PHẦN 3: THIẾT KẾ & TRIỂN KHAI

### 5. Cấu trúc phân cấp Heading cho "Tài liệu Kế hoạch Hội nghị 2026"

Dưới đây là mẫu cấu trúc phân cấp chuẩn 3 cấp (H1 / H2 / H3) áp dụng cho tài liệu 40 trang của Ban Thư ký:

Markdown

```
# HỆ THỐNG PHÂN CẤP HEADING (OUTLINE TÀI LIỆU KẾ HOẠCH HỘI NGHỊ 2026)

# 1. TỔNG QUAN HỘI NGHỊ (Heading 1)
   ## 1.1. Mục tiêu và Ý nghĩa (Heading 2)
      ### 1.1.1. Mục tiêu đào tạo và nghiên cứu (Heading 3)
      ### 1.1.2. Giá trị truyền thông và kết nối doanh nghiệp (Heading 3)
   ## 1.2. Thời gian và Địa điểm Tổ chức (Heading 2)
      ### 1.2.1. Lịch trình tổng quan các mốc thời gian (Heading 3)
      ### 1.2.2. Sơ đồ phân bổ phòng hội thảo (Heading 3)

# 2. KẾ HOẠCH NHÂN SỰ VÀ PHÂN CÔNG NIỆM VỤ (Heading 1)
   ## 2.1. Cơ cấu Ban Tổ chức (Heading 2)
      ### 2.1.1. Nhiệm vụ của Ban Nội dung (Heading 3)
      ### 2.1.2. Nhiệm vụ của Ban Thư ký và Lễ tân (Heading 3)
      ### 2.1.3. Nhiệm vụ của Ban Hậu cần và Kỹ thuật (Heading 3)
   ## 2.2. Quy trình Phối hợp và Báo cáo Tiến độ (Heading 2)

# 3. KẾ HOẠCH DỰ TRÙ KHẮC PHỤC RỦI RO (Heading 1)
   ## 3.1. Rủi ro về Kỹ thuật và Thiết bị (Heading 2)
      ### 3.1.1. Kịch bản dự phòng mất điện/mất kết nối Internet (Heading 3)
      ### 3.1.2. Phương án thay thế thiết bị trình chiếu (Heading 3)
   ## 3.2. Rủi ro về Tiến trình và Thời lượng (Heading 2)

```

### Tóm tắt các Quy tắc Triển khai dành cho Ban Thư ký:

1.  **Quy tắc gõ văn bản:** Thành viên khi soạn nội dung trên Google Docs **bắt buộc chọn đúng Style** (`Heading 1`, `Heading 2`, `Heading 3`) ở thanh công cụ thay vì tự bôi đen rồi chỉnh cỡ chữ/in đậm thủ công.
    
2.  **Quy tắc chốt file:** Đặt mốc thời gian "Freeze Content" (Dừng chỉnh sửa nội dung) trước ngày hội nghị 1-2 ngày để thực hiện Giai đoạn 2 trên Microsoft Word.
    
3.  **Quy tắc in ấn:** Luôn xuất ra file **PDF** làm file in chính thức để tránh hiện tượng máy tính tại phòng in bị thiếu font chữ hoặc làm lệch khoảng cách trang.

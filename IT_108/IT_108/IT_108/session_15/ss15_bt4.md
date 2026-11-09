## Phần 1 – Thiết lập Hybrid Workflow

1.  **Sự cố mất file có xảy ra không? Vì sao?**
    
    -   **Không.** Vì cơ chế **Auto Sync** (đồng bộ thời gian thực lên Cloud) giúp lưu trữ bản nháp trên mây ngay khi gõ, nên dù hỏng ổ cứng vật lý, file vẫn an toàn trên Cloud Workspace.
        
2.  **3 bước thiết lập Auto Sync:**
    
    -   **Bước 1:** Cài đặt ứng dụng Cloud Workspace (như Google Drive for Desktop / OneDrive) trên máy tính.
        
    -   **Bước 2:** Di chuyển toàn bộ thư mục dự án vào thư mục được đồng bộ tự động của ứng dụng.
        
    -   **Bước 3:** Bật chế độ "Always keep on this device" (nếu dùng OneDrive) hoặc kiểm tra biểu tượng dấu tích xanh đồng bộ thành công.
        
3.  **Thao tác khôi phục file Word khi bị xóa nhầm:**
    
    -   Sử dụng tính năng **Version History** (Lịch sử phiên bản): Chọn _File > Version history > See version history_, chọn mốc thời gian 10 phút trước và nhấn **Restore this version**.
        
4.  **Sai lầm khi đồng bộ Cloud và cách xử lý:**
    
    -   **Sai lầm:** Đồng bộ thư mục `node_modules` (hàng vạn file nhỏ gây nghẽn tiến trình sync) và file phim 4K (lãng phí dung lượng lưu trữ Cloud).
        
    -   **Cách xử lý:** Thêm `node_modules` vào file `.gitignore` hoặc danh sách ngoại lệ không đồng bộ; các file giải trí nặng nên lưu ở ổ cứng cục bộ (Local) thay vì đưa lên Cloud dự án.

## Phần 2 – Phân quyền chia sẻ an toàn

### 1. Bảng phân quyền cho 4 file:

|File | Mức quyền | Phạm vi chia sẻ | Giải thích |
 | - | - | - | - |
 |BaoCao_CuoiKy_SmartCampus.docx | Viewer(hoặc Commenter) |Restricted (Chỉ định danh email giảng viên) | Đảm bảo giảng viên chỉ xem/chấm điểm, tuyệt đối không chỉnh sửa đè dữ liệu. | 
| Slide_BaoCao.pptx |Editor | Restricted (Chỉ định email 5 thành viên nhóm) | Cả nhóm cần cùng sửa file gấp trong 2 ngày nhưng phải kiểm soát được danh tính. |
 | GopY_BanNhap.docx | Commenter | Restricted (Chỉ định email anh khóa trên) | Cho phép để lại lời nhận xét trực tiếp mà không làm thay đổi nội dung gốc. | 
 | ThongTin_CaNhan_NhomVien.xlsx | Viewer (hoặc Tắt chia sẻ công khai) | Restricted (Nội bộ nhóm) | Chứa thông tin nhạy cảm (CCCD, SĐT), cần bảo mật tuyệt đối. |

### 2. Quy tắc Cờ Đỏ Bảo mật & Cài đặt nâng cao:

-   **Quy tắc Cờ Đỏ:** Tuyệt đối không kết hợp `Anyone with the link` + `Editor` cho file chứa dữ liệu cá nhân (`ThongTin_CaNhan_NhomVien.xlsx`) vì bất kỳ ai có đường link đều có quyền truy cập và sửa/xóa dữ liệu nhạy cảm này, dẫn đến nguy cơ lộ lọt thông tin cao.
    
-   **2 Thao tác trong Settings để bảo vệ Slide:**
    
    1.  Tắt tính năng **"Editors can change permissions and share"** (Ngăn Editor tự mời thêm người lạ).
        
    2.  Bật tính năng **"Disable options to download, print, and copy for commenters and viewers"** (hoặc tắt quyền chia sẻ link công khai).
        

## Phần 3 – Tổ chức giao tiếp nhóm chuẩn doanh nghiệp

1.  **3 vấn đề trong đoạn hội thoại Zalo:**
    
    -   **No-Hello:** Nhắn câu vô nghĩa _"có ai rảnh không"_ thay vì đi thẳng vào vấn đề.
        
    -   **Spam `@all` giờ khuya:** Trưởng nhóm tag `@all` lúc 23:47 gây phiền hà, mất ngủ cho người không liên quan.
        
    -   **Tin nhắn không phân luồng :** Trộn lẫn công việc với ảnh mèo tán gẫu.
        
2.  **2 Tên Channel nên tạo trên Lark/Slack:**
    
    -   `#01-thong-bao-chung`: Kênh chỉ đọc (Admin đăng thông báo deadline/hành chính).
        
    -   `#02-project-smartcampus`: Kênh chuyên thảo luận nội dung đồ án và gửi tài liệu.
        
3.  **Viết lại tin nhắn của Lan theo tư duy Asynchronous:**
    
    > _@Nam @Hoa_ Mình đang làm phần API đăng nhập cho module SmartCampus và bị kẹt lỗi CORS ở bước xác thực token. Ai rảnh xem giúp mình đoạn code ở file `auth.py` (từ dòng 45-60) lúc nào tiện nhé, mình để link file ở đây ạ.
    
4.  **Tin nhắn nhắc việc hẹn giờ (Schedule Send) thay cho `@all`:**
    
    > _@Nam @Tuan_ Nhắc lịch hoàn thiện phần slide và code demo trước 8h sáng mai để kịp ráp vào báo cáo chung nhé hai bạn! _(Đã hẹn giờ gửi lúc 08:00 sáng)._
    

## Phần 4 – Thông báo tổng hợp

_Nội dung đăng lên kênh `#thong-bao`:_

>  **[THÔNG BÁO CẬP NHẬT DỰ ÁN]**
> 
> Chào cả nhóm, mình đã hoàn tất các việc sau để chuẩn bị nộp bài:
> 
> 1.  Đã bật **Auto Sync** cho toàn bộ thư mục dự án trên Cloud Workspace để tránh mất file.
>     
> 2.  Đã chia sẻ file `BaoCao_CuoiKy_SmartCampus.docx` cho Giảng viên theo quyền **Viewer (Restricted)** an toàn.
>     
> 
> _@Nam @Lan_ Nhớ kiểm tra lại phần nội dung của mình và cập nhật tiến độ lên channel dự án nhé! Không dùng `@all` nữa nha mọi người. Fighting! 🚀

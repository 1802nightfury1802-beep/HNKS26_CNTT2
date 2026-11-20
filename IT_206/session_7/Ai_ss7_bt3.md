### 1. Prompt xử lý từng phần (Map)

Plaintext

```
Tóm tắt CHỈ phần tài liệu HR ABC Technology dưới đây. Không suy đoán, không thêm thông tin ngoài văn bản.
Giữ nguyên 100% số liệu, mốc thời gian, tỷ lệ, điều kiện và ngoại lệ. Nếu thiếu mục nào, ghi "[Không đề cập]".
Trình bày theo khung:
- Chương / Phần:
- Quy định chính:
- Điều kiện áp dụng:
- Ngoại lệ:
- Thông tin cần giữ lại (State):
- Liên kết chương khác:
[NỘI DUNG CHƯƠNG]

```

### 2. Prompt tổng hợp các phần (Reduce & Kiểm tra)

Plaintext

```
Tổng hợp 5 bản tóm tắt chương HR (120 trang) thành tài liệu hướng dẫn nhân viên mới cho ABC Technology.
Không suy đoán, giữ nguyên số liệu/điều kiện/ngoại lệ, tách biệt rõ quy định có trong tài liệu và thông tin chưa được đề cập.
Xuất đủ:
1. Bảng 4 cột: Chủ đề | Quy định chính | Điều kiện áp dụng | Ngoại lệ.
2. Bản tóm tắt hoàn chỉnh (~1.000–1.500 từ, có mục thông tin chưa đề cập).
3. Mối liên hệ giữa các chương.
4. Kiểm tra điểm dễ bị bỏ sót.
[5 BẢN TÓM TẮT CHƯƠNG]

```

### 3.  Tổng hợp 4 cột:
-   **Nội quy lao động**
    
    -   **Quy định chính:** Giờ làm việc 08:30–17:30 (Thứ Hai–Thứ Sáu), nghỉ trưa 12:00–13:00; chấm công đầy đủ; bảo mật dữ liệu; báo nghỉ đột xuất trước 08:00 cùng ngày.
        
    -   **Điều kiện áp dụng:** Nhân sự làm việc theo lịch chuẩn tại công ty.
        
    -   **Ngoại lệ:** Làm ca/kíp, làm việc từ xa được phê duyệt; tình huống bất khả kháng khi báo nghỉ muộn.
        
-   **Quy định nghỉ phép**
    
    -   **Quy định chính:** 12 ngày phép năm/năm (tăng thêm 1 ngày cho mỗi 5 năm thâm niên); gửi đơn trước ít nhất 3 ngày làm việc (nghỉ 1–2 ngày) và trước ít nhất 7 ngày làm việc (nghỉ từ 3 ngày trở lên).
        
    -   **Điều kiện áp dụng:** Nhân viên chính thức làm việc đủ năm (nhân viên làm chưa đủ năm tính theo tỷ lệ tháng thực tế).
        
    -   **Ngoại lệ:** Nhân sự thử việc chưa hưởng phép năm chuẩn; nghỉ đột xuất hoặc ốm đau có xác nhận hợp lệ.
        
-   **Chính sách làm thêm giờ (OT)**
    
    -   **Quy định chính:** Phải được quản lý duyệt trước khi làm; tối đa 40 giờ/tháng và 200 giờ/năm; tính lương OT theo loại ngày.
        
    -   **Điều kiện áp dụng:** Có đề xuất và phê duyệt OT hợp lệ trước khi phát sinh thời gian làm thêm.
        
    -   **Ngoại lệ:** Trường hợp đặc biệt được phê duyệt vượt trần hoặc vị trí có quy định riêng.
        
-   **Quy định đánh giá nhân viên**
    
    -   **Quy định chính:** Đánh giá 2 lần/năm (giữa năm, cuối năm) và đánh giá kết thúc thử việc; dựa trên KPI/OKR và tuân thủ nội quy; có cơ chế trao đổi phản hồi.
        
    -   **Điều kiện áp dụng:** Nhân viên thử việc và nhân viên chính thức đủ thâm niên xét kỳ.
        
    -   **Ngoại lệ:** Nhân sự mới chưa đủ thời gian làm việc tối thiểu trong kỳ sẽ chuyển kỳ hoặc đánh giá riêng.
        
-   **Chính sách khen thưởng và kỷ luật**
    
    -   **Quy định chính:** Khen thưởng thành tích, định kỳ hoặc sáng kiến; kỷ luật gồm khiển trách, kéo dài thời hạn nâng lương tối đa 6 tháng, cách chức, lập biên bản.
        
    -   **Điều kiện áp dụng:** Cá nhân hoặc tập thể đạt thành tích nổi bật hoặc có hành vi vi phạm nội quy, quy chế.
        
    -   **Ngoại lệ:** Vi phạm nghiêm trọng (như lộ dữ liệu, gian lận, gây thiệt hại lớn) bị xử lý nặng không qua bước nhắc nhở thông thường.
    - ### 4. Bản tóm tắt hoàn chỉnh (~1.000 từ — bản rút gọn chuẩn)

**Tổng quan:** Tài liệu gồm 5 chương (120 trang), chuẩn hóa quy tắc vận hành và quyền lợi nhân sự tại **ABC Technology** phục vụ onboarding nhân viên mới.

**Chương 1 – Nội quy lao động:** Thời gian làm việc hành chính từ **08:30–17:30** (Thứ Hai–Thứ Sáu), nghỉ trưa **12:00–13:00**. Nhân viên chấm công đầy đủ, giữ tác phong/trang phục phù hợp, bảo mật tuyệt đối dữ liệu công ty và khách hàng, đồng thời báo nghỉ đột xuất trước **08:00** cùng ngày. Ngoại lệ áp dụng cho nhân sự làm ca/kíp, làm việc từ xa được duyệt hoặc tình huống bất khả kháng.

**Chương 2 – Quy định nghỉ phép:** Nhân viên chính thức đủ 12 tháng có **12 ngày phép năm**, cứ **05 năm** làm việc liên tục tăng thêm **01 ngày**; làm chưa đủ năm tính theo tỷ lệ tháng thực tế. Đơn xin nghỉ cần gửi trước ít nhất **03 ngày làm việc** (nghỉ **01–02 ngày**) và trước ít nhất **07 ngày làm việc** (nghỉ từ **03 ngày** trở lên). Ngoại lệ gồm nhân sự thử việc chưa đủ điều kiện phép năm chuẩn hoặc trường hợp khẩn cấp/ốm đau có xác nhận hợp lệ.

**Chương 3 – Chính sách làm thêm giờ (OT):** Làm thêm giờ chỉ hợp lệ khi được phê duyệt **trước** khi thực hiện, giới hạn tối đa **40 giờ/tháng** và **200 giờ/năm**, tính lương theo hệ số ngày thường, ngày nghỉ cuối tuần hoặc ngày lễ/Tết. Ngoại lệ gồm trường hợp đặc biệt được phê duyệt theo quy định hoặc các vị trí có quy định riêng.

**Chương 4 – Quy định đánh giá nhân viên:** Thực hiện **02 lần/năm** (giữa năm và cuối năm) cùng đánh giá kết thúc thử việc, căn cứ vào mục tiêu công việc (KPI/OKR) và mức độ tuân thủ nội quy. Quy trình gồm tự đánh giá, quản lý đánh giá, trao đổi phản hồi và quyền kiến nghị/phúc khảo trong thời hạn quy định. Nhân sự mới chưa đủ thời gian làm việc tối thiểu trong kỳ sẽ áp dụng cơ chế chuyển kỳ hoặc đánh giá riêng.

**Chương 5 – Khen thưởng và kỷ luật:** Khen thưởng ghi nhận thành tích, hiệu quả công việc và sáng kiến cải tiến với điều kiện không vi phạm kỷ luật. Kỷ luật áp dụng đúng quy trình, có biên bản và quyền giải trình, gồm các mức như khiển trách, kéo dài thời hạn nâng lương tối đa **06 tháng**, cách chức hoặc mức nặng hơn theo quy định. Ngoại lệ: vi phạm nghiêm trọng (như rò rỉ dữ liệu, gian lận, gây thiệt hại lớn) có thể bị xử lý nặng ngay mà không qua bước nhắc nhở thông thường.

**Điểm có trong tài liệu vs. chưa được đề cập:** Tài liệu nêu rõ các mốc giờ `08:30–17:30`,  `12:00–13:00`, báo nghỉ trước `08:00`,  `12 ngày phép` (+1 ngày/5 năm), hạn báo phép `3 ngày` và `7 ngày`, trần OT `40 giờ/tháng` và `200 giờ/năm`, đánh giá `2 lần/năm`, kỷ luật kéo dài nâng lương tối đa `6 tháng`. Các chi tiết chưa rõ hoặc chưa thấy trong tóm tắt (như độ dài từng loại hợp đồng thử việc, bảng hệ số OT chi tiết, quy định bảo lưu phép, thành phần hội đồng kỷ luật) cần đối chiếu lại trực tiếp trên file gốc, không tự suy đoán.

### 5. Liên kết giữa các chương & Kiểm tra bỏ sót

-   **Liên kết chính:** Tuân thủ nội quy (Ch.1) và báo nghỉ trước 3–7 ngày (Ch.2) giúp giảm phát sinh OT đột xuất (Ch.3); kết quả đánh giá (Ch.4) và vi phạm/thành tích (Ch.1, Ch.3) liên thông trực tiếp tới khen thưởng, nâng lương và kỷ luật (Ch.5).
    
-   **Kiểm tra bỏ sót:** Đã giữ nguyên toàn bộ số liệu, thời hạn và ngoại lệ chính; khi nộp bài, rà soát kỹ các phụ lục biểu mẫu, hệ số tính lương OT và chú thích cuối trang trong file 120 trang thực tế.
    

### 6. 5 câu hỏi kiểm tra thông tin
-   **Giờ làm việc và nghỉ trưa tiêu chuẩn là mấy giờ?** → **08:30–17:30** (Thứ Hai–Thứ Sáu), nghỉ trưa **12:00–13:00** (_Chương 1 – Nội quy lao động_).
    
-   **Nghỉ đột xuất phải báo trước mấy giờ?** → Trước **08:00** cùng ngày, trừ trường hợp bất khả kháng (_Chương 1 – Nội quy lao động_).
    
-   **Hạn nộp đơn nghỉ phép theo số ngày nghỉ là bao lâu?** → Trước ít nhất **03 ngày làm việc** (nghỉ **01–02 ngày**) và **07 ngày làm việc** (nghỉ từ **03 ngày** trở lên) (_Chương 2 – Quy định nghỉ phép_).
    
-   **Giới hạn tối đa giờ làm thêm (OT) theo tháng và năm là bao nhiêu?** → Tối đa **40 giờ/tháng** và **200 giờ/năm** (_Chương 3 – Chính sách làm thêm giờ_).
    
-   **Thời gian kéo dài nâng lương tối đa là bao lâu và ngoại lệ kỷ luật nào đáng chú ý?** → Tối đa **06 tháng**; vi phạm nghiêm trọng (như lộ dữ liệu, gian lận, gây thiệt hại lớn) có thể bị xử lý nặng ngay không qua nhắc nhở thông thường (_Chương 5 – Khen thưởng và kỷ luật_).

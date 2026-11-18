# Vấn đề:
- Phòng Marketing cần sản xuất một bài PR chuyên sâu (1000 - 1500 từ) giới thiệu giải pháp AI Chatbot mới cho doanh nghiệp. Việc sử dụng một prompt đơn lẻ để AI viết toàn bộ bài thường dẫn đến nội dung hời hợt, lặp ý và thiếu chiều sâu.

- Bạn cần xây dựng một chuỗi prompt (Prompt Chain) gồm 3 bước để tạo ra bài viết chất lượng cao.

# Yêu cầu:
Thiết lập quy trình Prompt Chaining gồm 3 bước rõ ràng:

-   Prompt 1: Nghiên cứu đối tượng khách hàng mục tiêu và xây dựng danh sách các nỗi đau (pain points) mà sản phẩm giải quyết.
    
-   Prompt 2: Dựa trên output của Prompt 1, thiết lập dàn ý chi tiết (Outline) cho bài viết PR.
    
-   Prompt 3: Dựa trên dàn ý ở Prompt 2, triển khai viết chi tiết từng phần của bài viết và tối ưu hóa từ khóa SEO.

# Cách làm:

- Promt 1: Hãy đóng vai trò là chuyên gia mkt, hãy nghiên cứu khách hang của sản phẩm AI chatbot. Xác định đối tượng khách hang, nhu cầu, lợi ích sản phẩm mang lại!
```
Plaintext

[Role] Bạn là chuyên gia chiến lược Marketing và Nghiên cứu hành vi người tiêu dùng.
[Context] Chúng ta đang chuẩn bị truyền thông cho sản phẩm/dịch vụ sau đây. Hãy phân tích sâu để tìm ra điểm chạm tâm lý khách hàng.

[Input Data] 
- Tên sản phẩm/Dịch vụ: "{{product_name}}"
- Mô tả ngắn: "{{product_description}}"
- Khách hàng mục tiêu sơ bộ: "{{target_audience}}"

[Task] 
1. Phác hoạ chân dung khách hàng mục tiêu (độ tuổi, tâm lý, hành vi).
2. Xây dựng danh sách ít nhất 5 "nỗi đau" (pain points) lớn nhất mà họ đang gặp phải liên quan đến vấn đề sản phẩm giải quyết.
3. Chỉ ra cách sản phẩm xoa dịu hoặc giải quyết triệt để từng nỗi đau đó.

[Output Format] Trả về cấu trúc rõ ràng, súc tích để làm đầu vào cho bước tiếp theo.
```

- Promt 2: Dựa vào kq promt 1, hãy xây dung dàn ý chi tiết cho bài PR sản phẩm giới thiệu AI chatbot. Yêu cầu nội dung hấp dẫn, chuyên nghiệp, giải quyết các vấn đề khách hang gặp phải. Nội dung phải có các tiêu đề H1, H2, H3, giữ going điệu chuyên nghiệp.
Plaintext

```
[Role] Bạn là Biên tập viên/Content Director của một trang báo điện tử lớn.
[Context] Dựa trên phân tích khách hàng và danh sách "nỗi đau" từ Bước 1 dưới đây, hãy lập dàn ý chi tiết cho một bài viết PR mang tính thuyết phục cao.

[Input from Step 1] "{{output_from_step_1}}"
[Product Key Selling Point (KSP)] "{{core_benefit}}"

[Task] Xây dựng dàn ý chi tiết (Outline) theo cấu trúc AIDA (Attention - Interest - Desire - Action) hoặc cấu trúc kể chuyện (Storytelling):
- Tiêu đề (Catchy headline gợi mở vấn đề).
- Mở bài (Hook thu hút dựa trên Pain Point lớn nhất).
- Thân bài (Các luận điểm xoáy sâu vào nỗi đau, giới thiệu tính năng giải pháp, chứng thực/social proof).
- Kết bài (CTA - Kêu gọi hành động mạnh mẽ).

[Output Format] Outline chi tiết từng phần, ghi chú rõ mục đích của từng đoạn.
```

- Promt 3: Dựa vào kq của promt 2, viết bài dài khoảng 1000-1500 từ giới thiệu về sản phẩm AI chatbot, nội dung hấp dẫn thu hút , tói ưu từ khóa SEO tự nhiên, giữ going văn nhất quán. Nếu bài viết ngắt quãng do hết token thì hãy tiếp tục từ câu cuối cùng, không lặp lại nội dung dữ lieu cũ và giữu nguyên giọng điệu.ách làm:
Plaintext

```
[Role] Bạn là Copywriter chuyên nghiệp, chuyên viết bài PR thương hiệu và bài báo chuyên sâu.
[Context] Dựa vào dàn ý chi tiết ở Bước 2, hãy triển khai viết hoàn chỉnh nội dung bài viết PR. Đồng thời, tích hợp khéo léo các từ khóa SEO để bài viết dễ lên top tìm kiếm.

[Input from Step 2] "{{output_from_step_2}}"
[SEO Keywords] Từ khóa chính: "{{main_keyword}}", Các từ khóa phụ: "{{sub_keywords}}"
[Tone of Voice] "{{tone}}" (Ví dụ: Đồng cảm, chuyên nghiệp, truyền cảm hứng, hoặc sắc sảo).

[Task] 
1. Viết chi tiết từng phần theo đúng dàn ý, văn phong lôi cuốn, tránh lan man.
2. Tích hợp từ khóa chính vào tiêu đề (H1), tiểu mục (H2/H3) và phân bổ tự nhiên trong mật độ 1.5% - 2.5% toàn bài.
3. Viết thẻ Meta Title và Meta Description chuẩn SEO ở cuối bài.

[Output Format] Bài viết PR hoàn chỉnh, định dạng Markdown sạch sẽ, sẵn sàng xuất bản.
```

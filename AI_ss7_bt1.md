# Vấn đề:
- Sinh viên mới học lập trình thường gặp khó khăn khi hiểu các cấu trúc khái niệm phức tạp và không biết code mình viết đã tối ưu chưa.
-  Cần xây dựng 1 promt tishc hợp biến AI thành 1 mentor học tập: giải thích kiến thức 1 cách đơn giản nhất và chấm điểm bài tập code dựa trên tiêu chí có sẵn

# Yêu cầu:
Xây dựng một cấu trúc prompt tích hợp thực hiện hai nhiệm vụ:

-   Nhiệm vụ 1 (Feynman): Giải thích một khái niệm kỹ thuật do học viên yêu cầu sao cho một học sinh 10 tuổi cũng hiểu được.
    
-   Nhiệm vụ 2 (Rubric): Chấm điểm đoạn code Python do học viên nộp dựa trên bảng Rubric 4 tiêu chí.

# Cách làm:
1. Kỹ thuật Feinman gồm 4 bước: 
   B1: Chọn chủ đề chưa hiểu cần học
   B2: Hỏi AI giải thích dễ hiểu( ví dụ giải thích cho học sinh lớp 6 có thể hiểu vấn đề)
   B3: Lỗ hổng kiến thức ( hỏi lại AI những vấn đề mà mình chưa hiểu)
   B4: Đi giải thích lại theo ý hiểu của mình cho ai đánh giá!

Promt: Bạn là chuyên gia về cấu trúc dữ liệu và giải thuật , tôi là sinh viên mới học lập trình đang cần tìm hiểu các cấu trúc dữ liệu ( linked list, binary tree) bằng ngôn ngữ python. hãy giải thích các cấu trúc dữ liệu trên cho đứa trẻ 10 tuổi cũng hiểu được.

--> đợi AI trả về kết quả
--> sau đó hỏi lại AI những vấn đề mình chưa hiểu ( lỗ hổng kiến thức)
...
giải thích lại theo ý hiểu của mình cho AI nhận xét ! ( vd: theo tôi hiểu linked list là...? binary là... có đúng không? )
2. Xây dựng rubric ( tiêu chí) đê AI chấm điểm
     Thiết lập bảng tiêu chí chấm điểm dựa vào 4 tiêu chí:
      2.1, Tính đúng đắn             (40%):
      + Chương trình có gặp bug gì không
      + Chương trình chạy được nhưng kết quả có bị sai hay không?
      2.2, Độ tối ưu thuật toán  (30%):
      + Thuật toán chạy có nhanh hay không?
      + Thuật toán có tốn nhiều dung lượng hay không?
      2.3, Phong cách viết code (20%):
      + Đặt tên biến, hàm có dễ hiểu hay không?
      + Đặt tên biến, hàm có đúng theo quy tắc hay không?
      + Đặt tên có chuyên nghiệp hay không?
      2.4, Xử lí ngoại lệ                (10%):
      + Danh sách không có phần tử thì sao
      + Danh sách có 1 phần tử thì sao?
   form đăng kí SĐT:
   các trường hợp ngoại lệ: chữ cái, kí tự đặc biệt, không đúng định dạng.
   ...

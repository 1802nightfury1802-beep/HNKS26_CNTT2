# Vấn đề:
- 1 cá nhân có biến động thu nhập mỗi tháng và đang có khoản nợ cần thanh toán. Họ cần 1 trợ lí AI để lập kế hoạch tài chính chi tiết,tối ưu hóa dòng tiền, đưa ra đề xuất phân bổ ngân sách chi tiêu hợp lí
- - Do bài toán liên quan nhiều đến phép tính số học và ràng buộc tài chính -> Để AI trả lời ngay đáp án sẽ rất dễ bị sai lệch số liệu.

# Yêu cầu:
- Thiết kế promt yêu cầu AI lập kế hoạch tài chính từ dữ liệu đầu vào ( thu nhập, chi phí cố định, các khoản nợ, mục tiêu tiết kiệm).
- - Yêu cầu AI suy luận từng bước (CoT) để tính toán ngân sách trước khi xuất kết quả cuối cùng

# Cách làm:
```
Bạn là chuyên gia tiết lập ngân sách cá nhân, giúp tôi lập kế hoạch chi tiết giúp tôi quản lí chi tiêu với các thông tin:
+ Thu nhâp 20.000.000/tháng
+ Số tiền thuế phải trả là 5%
+ Các chi phí cố địn gồm tiền nhà, tiền ăn uống, tiền xăng xe :10.000.000
+ Khoản nợ 1 tháng phải trả : 3.000.000
+ Tiền tiết kiệm 20% thu nhập sau khi trừ thuế.

Lập kế hoạch theo các bước
B1: Tính tiền còn lại sau khi trừ thuế và trừ đi các chi phí cố định
B2: ......................... phải trả các khoản nợ
B3: ......... tiết kiệm mỗi tháng 20% tiền thu nhập sau khi trừ thuế
B4: Số tiền còn lại chia theo quy tắc 50/30/20 . Trong đó 50& là tiền cho các chi phí cố định, 30% chi theo mong muốn, 20% tiền tiết kiệm.

Cho tôi bang kế hoạch dưới dạng markdown table với các cột : Hạng mục, Số tiền, Tỷ lệ %, Ghi chú chi tiêu và Nhật kí tính toán chi tiết.
```

### Kết quả mẫu khi AI thực thi Prompt trên (Ví dụ minh họa)

### 1. Nhật ký tính toán chi tiết (Calculation Log)

-   **Thu nhập ban đầu:**  $20,000,000 \text{ VND}$
    
-   **Bước 1: Tính tiền còn lại sau khi trừ thuế (5%) và chi phí cố định**
    
    -   Tiền thuế phải trả:  $20,000,000 \times 5\% = 1,000,000 \text{ VND}$
        
    -   Thu nhập sau thuế:  $20,000,000 - 1,000,000 = 19,000,000 \text{ VND}$
        
    -   Tiền còn lại sau khi trừ thuế và chi phí cố định ($10,000,000 \text{ VND}$):  $19,000,000 - 10,000,000 = 9,000,000 \text{ VND}$
        
-   **Bước 2: Trừ đi các khoản nợ phải trả trong tháng**
    
    -   Tiền nợ cần trả:  $3,000,000 \text{ VND}$
        
    -   Số tiền còn lại sau khi trả nợ:  $9,000,000 - 3,000,000 = 6,000,000 \text{ VND}$
        
-   **Bước 3: Trích lập tiền tiết kiệm (20% thu nhập sau thuế)**
    
    -   Số tiền tiết kiệm:  $19,000,000 \times 20\% = 3,800,000 \text{ VND}$
        
    -   Số tiền còn lại sau khi tiết kiệm:  $6,000,000 - 3,800,000 = 2,200,000 \text{ VND}$
        
-   **Bước 4: Đối chiếu dòng tiền & Quy tắc 50/30/20**
    
    -   Dòng tiền thực tế của bạn hoàn toàn cân đối và nằm trong tầm kiểm soát. Sau khi hoàn thành nghĩa vụ thuế, chi phí cố định, trả nợ và tiết kiệm, bạn vẫn còn dư $2,200,000 \text{ VND}$ để linh hoạt cho các nhu cầu cá nhân.
        

### 2. Bảng kế hoạch ngân sách chi tiết:

Dưới đây là kế hoạch tài chính chi tiết được lập theo đúng các bước bạn yêu cầu, đảm bảo tính toán chính xác và trực quan.

  

### 1. Nhật ký tính toán chi tiết (Calculation Log)

-   **Thu nhập ban đầu:**  $20,000,000 \text{ VND}$
    
      
    
-   **Bước 1: Tính tiền còn lại sau khi trừ thuế (5%) và chi phí cố định**
    
      
    -   Tiền thuế phải trả:  $20,000,000 \times 5\% = 1,000,000 \text{ VND}$
        
          
        
    -   Thu nhập sau thuế:  $20,000,000 - 1,000,000 = 19,000,000 \text{ VND}$
        
          
        
    -   Tiền còn lại sau khi trừ thuế và chi phí cố định ($10,000,000 \text{ VND}$):  $19,000,000 - 10,000,000 = 9,000,000 \text{ VND}$
        
          
        
-   **Bước 2: Trừ đi các khoản nợ phải trả trong tháng**
    
      
    -   Tiền nợ cần trả:  $3,000,000 \text{ VND}$
        
          
        
    -   Số tiền còn lại sau khi trả nợ:  $9,000,000 - 3,000,000 = 6,000,000 \text{ VND}$
        
          
        
-   **Bước 3: Trích lập tiền tiết kiệm (20% thu nhập sau thuế)**
    
      
    -   Số tiền tiết kiệm:  $19,000,000 \times 20\% = 3,800,000 \text{ VND}$
        
          
        
    -   Số tiền còn lại sau khi tiết kiệm:  $6,000,000 - 3,800,000 = 2,200,000 \text{ VND}$
        
          
        
-   **Bước 4: Đối chiếu dòng tiền & Quy tắc 50/30/20**
    
      
    -   Dòng tiền thực tế của bạn hoàn toàn cân đối và nằm trong tầm kiểm soát. Sau khi hoàn thành nghĩa vụ thuế, chi phí cố định, trả nợ và tiết kiệm, bạn vẫn còn dư $2,200,000 \text{ VND}$ để linh hoạt cho các nhu cầu cá nhân.
        

### 2. Bảng kế hoạch ngân sách chi tiết

|Hạng mục |Số tiền(VND) |Tỷ lệ % (so với tổng thu nhập) |Ghi chú chi tiêu |Nhật kí tính toán chi tiết |
|-|-|-|-|-|
|Thuế (5%) |1.000.000 |5% |Nghĩa vụ thuế hàng tháng |$20,000,000 \times 5\%$ |
|Chi phí cố định |10.000.000 |50% |Tiền nhà, ăn uống, xăng xe |Chi phí sinh hoạt cơ bản thiết yếu |
|Trả nợ |3.000.000 |15% |Các khoản nợ trong tháng |Trợ vốn / Trả góp đúng hạn |
|Tiết kiệm |3.800.000 |19% |Quỹ dự phòng & tích lũy |$19,000,000 \times 20\%$ (tính trên thu nhập sau thuế) |
|Chi tiêu mong muốn |2.200.000 |11% |Giải trí, mua sắm, phát sinh |Số dư còn lại sau khi phân bổ các mục trên |
|Tổng cộng |20.000.000 |100% |Cân đối thu - chi tuyệt đối |Khớp 100% dòng tiền thực tế |

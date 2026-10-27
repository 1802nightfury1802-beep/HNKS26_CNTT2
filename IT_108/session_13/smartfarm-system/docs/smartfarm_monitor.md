# Hệ Thống Giám Sát Trạm Cảm Biến Nông Trại (SmartFarm Monitor):

## Hướng dẫn chạy script:
Thực thi script lọc log tự động từ thư mục `scripts/`:
```powershell
cd scripts
.\auto_report.ps1

 -ExecutionPolicy Bypass -File .\auto_report.ps1  
 ```

## Checklist kiểm tra thiết bị:

-   [x] Kiểm tra nguồn điện trạm sensor-01
    
-   [x] Kiểm tra kết nối anten trạm sensor-03
    
-   [x] Cập nhật firmware cho bộ điều khiển trung tâm
    

## Bảng thông số phần cứng:

|Tên thiết bị |Đơn giá |Loại storage | 
|-|-|-|
|Raspberry Pi 4 Model B |1450000 |SSD |
|Intel NUC i3 |6200000 |SSD |
|Orange Pi 5 |2300000 |SSD |
|Dell Optiplex Micro|5400000 |HDD |
|Mini PC Fanless N100 |4200000 |SSD |
|Synology DS220j NAS |3900000 |HDD |


## Phân tích hệ thống:

### 1. Mô hình IPO của chức năng lọc log

-   **Input (Đầu vào):** File nhật ký máy chủ `data/log-he-thong.log`.
    
-   **Process (Xử lý):** Đọc từng dòng bằng `Get-Content`, lọc các chuỗi ký tự chứa từ khóa "CRITICAL" và "ERROR" bằng `Select-String`, đồng thời đếm tổng số sự cố tìm thấy.
    
-   **Output (Đầu ra):** File báo cáo tổng hợp `backup/bao-cao-su-co.txt` chứa danh sách dòng lỗi và tổng số lượng sự cố.
    

### 2. Phân loại mô hình DIKW

-   **(a)**  _"Quyết định thay modem trạm sensor-03 trước thứ Sáu."_ ->a **Wisdom (Trí tuệ)**  
    
-   **(b)**  _"2026-10-12 08:15:01 [ERROR] sensor-03 Connection TIMEOUT after 30s"_          ->**Data (Dữ liệu)**  
    
-   **(c)**  _"Hôm nay hệ thống ghi nhận 8 sự cố, trong đó 4 sự cố đến từ trạm sensor-03."_  ->  **Information (Thông tin)**  
    
-   **(d)**  _"Trạm sensor-03 hay mất kết nối vào buổi chiều do sóng yếu, nên cần lắp thêm anten."_  -> **Knowledge (Tri thức)** 

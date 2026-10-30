# Yêu cầu:
-   Giải pháp kỹ thuật: Mô tả cách thiết lập tính năng Files On-Demand để chỉ tải file xuống khi cần mở thực tế.
    
-   Báo cáo dung lượng: Tính toán và chứng minh tính hiệu quả của giải pháp khi dung lượng Cloud lớn hơn dung lượng Local SSD nhiều lần.

# Vấn đề:
- Ổ cứng Laptop của các bạn chỉ có 256GB. Nếu đồng bộ toàn bộ về máy, SSD sẽ bị tràn ngay lập tức và gây treo phần mềm đồng bộ.


# Cách làm:

## Cách thiết lập tính năng Files On-Demand để chỉ tải file xuống khi cần mở thực tế:

### 1. Thiết lập tính năng Files On-Demand:

-   **Cơ chế hoạt động:** Bật tính năng _Files On-Demand_ (OneDrive / Google Drive Online-only mode). Toàn bộ 500GB video trên Cloud hiển thị dưới dạng **shortcut dung lượng ảo (0 KB)** trên thư mục Local SSD.
    
-   **Quy trình mở file:** Khi Designer cần xem/chỉnh sửa một video cụ thể, hệ thống tự động tải file đó từ Cloud xuống bộ nhớ đệm (Cache) tạm thời. Sau khi sử dụng xong, nhấn chuột phải chọn **"Free up space"** để giải phóng ngay lập tức dung lượng SSD, trả file về trạng thái chỉ lưu trữ trên Cloud.
    

### 2. Xử lý Bẫy Mạng trọ & Gập máy Laptop:

-   **Bẫy nghẽn mạng:** Giới hạn tốc độ tải lên (Upload Rate Limit) trong cài đặt ứng dụng đồng bộ (ví dụ: tối đa 2–3 MB/s) hoặc lên lịch đồng bộ vào khung giờ đêm muộn để tránh tranh chấp băng thông với phòng trọ khác.
    
-   **Bẫy gập máy ngắt kết nối:** Vào _Power & Sleep Settings_ của Windows, cấu hình chế độ **"Do nothing" khi gập màn hình (Close the lid)** khi cắm sạc, kết hợp giữ kết nối Wi-Fi hoạt động ở chế độ Sleep để quá trình upload 500GB dữ liệu lớn không bị đứt đoạn.
    

## Báo cáo Dung lượng & Chứng minh Hiệu quả:
|Tiêu chí |Không dùngFiles On-Demand (Đồng bộ toàn bộ) |DùngFiles On-Demand (Tối ưu hóa) |
|-|-|-|
|Dung lượng Video trên Cloud |500 GB |500 GB |
|Dung lượng Local SSD chiếm dụng |**500 GB** (Vượt ngưỡng 256 GB của máy) |**~ 2 - 5 GB** (Metadata & file đang mở tạm thời) |
|Trạng thái hệ thống |Tràn ổ cứng, treo phần mềm đồng bộ và hệ điều hành. |Hoạt động mượt mà, SSD còn trống hơn 200GB cho OS và IDE lập trình. |

**Kết luận hiệu quả:**

-   **Tỷ lệ tiết kiệm không gian Local:** Giảm tải tới **99%** dung lượng ổ cứng cho laptop (từ 500GB xuống chỉ vài GB metadata).
    
-   Giải pháp giúp doanh nghiệp mở rộng quy mô dữ liệu không giới hạn trên Cloud mà hoàn toàn không bị ràng buộc bởi phần cứng vật lý hạn chế của thiết bị đầu cuối.


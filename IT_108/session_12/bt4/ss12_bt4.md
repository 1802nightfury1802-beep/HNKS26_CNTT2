## PHẦN 1. PHÂN TÍCH: PHÂN BIỆT YÊU CẦU CHỨC NĂNG & PHI CHỨC NĂNG (SRS MODULE BỆNH ÁN ĐIỆN TỬ)

Trong tài liệu **Yêu cầu Phần mềm (SRS - Software Requirements Specification)** cho hệ thống Quản lý Phòng khám **Clinic-Cloud**, việc phân định rõ giữa **Functional Requirements (FR)** và **Non-Functional Requirements (NFR)** đóng vai trò quyết định đến tính khả thi và tuân thủ pháp lý y tế (như Nghị định 13/2023/NĐ-CP về bảo vệ dữ liệu cá nhân & Thông tư 46/2018/TT-BYT về bệnh án điện tử).

### 1. Yêu cầu Chức năng (Functional Requirements - FR)

Là các tính năng, hành vi cụ thể mà hệ thống phải thực hiện khi người dùng (Bác sĩ, Y sĩ, Tiếp tân) tương tác:

-   **FR-01 (Tạo & Cập nhật Bệnh án):** Bác sĩ có thể nhập chỉ số sinh hiệu (huyết áp, nhịp tim, nhiệt độ), chuẩn đoán ICD-10, kê đơn thuốc và chỉ định cận lâm sàng.
    
-   **FR-02 (Tra cứu Hồ sơ Bệnh nhân):** Cho phép tìm kiếm hồ sơ theo Mã bệnh nhân (Patient ID), Số CMND/CCCD hoặc Số điện thoại.
    
-   **FR-03 (Lịch sử Khám bệnh):** Hiển thị danh sách các lần khám trước đó kèm kết quả xét nghiệm, đơn thuốc cũ và hình ảnh chẩn đoán (PACS).
    
-   **FR-04 (Xuất & In phiếu khám):** Xuất toa thuốc và phiếu chỉ định ra định dạng PDF hoặc in trực tiếp.
    

### 2. Yêu cầu Phi chức năng - Bảo mật & Vận hành (Non-Functional Requirements - NFR)

Là các tiêu chuẩn định lượng về chất lượng, hiệu năng và mức độ an toàn dữ liệu của hệ thống:

-   **NFR-01 (Mã hóa dữ liệu - Data Encryption):**
    
    -   Dữ liệu lưu trữ (Data at Rest): Mọi thông tin định danh (PII) và lịch sử bệnh lý trong Database phải được mã hóa theo chuẩn **AES-256**.
        
    -   Dữ liệu truyền tải (Data in Transit): 100% kết nối API giữa Client và Server sử dụng giao thức **HTTPS (TLS 1.3)**.
        
-   **NFR-02 (Phân quyền truy cập - RBAC):** Hệ thống áp dụng mô hình phân quyền dựa trên vai trò (_Role-Based Access Control_):
    
    -   Bác sĩ điều trị: Quyền đọc/ghi bệnh án của bệnh nhân mình tiếp nhận.
        
    -   Lễ tân/Thu ngân: Chỉ được xem thông tin hành chính, không có quyền xem chi tiết bệnh lý/đơn thuốc.
        
-   **NFR-03 (Nhật ký truy cập - Audit Trail):** Ghi lại toàn bộ Log tác động (Ai xem, Ai sửa, Vào lúc nào, IP nào) đối với bệnh án điện tử và không cho phép xóa/sửa Log này.
    
-   **NFR-04 (Hiệu năng - Performance):** Thời gian phản hồi cho tác vụ truy xuất bệnh án phải dưới **1.5 giây** đối với cơ sở dữ liệu 100,000 hồ sơ.

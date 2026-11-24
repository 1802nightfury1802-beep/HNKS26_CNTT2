# BÀI LÀM PHA 2 

- **Họ tên:** Bùi Hải Đăng
- **Lớp:** CNTT2
- **Link repository Pha2:**
- **Công cụ AI đã dùng (ChatGPT/Claude/Gemini):** Gemini

> Pha 2 (20 phút cuối). Mỗi mục: mở cuộc trò chuyện mới, gửi nguyên văn prompt đã viết trong bai_lam_pha1.md, dán câu trả lời và link chia sẻ vào đây. Xong, kéo thả file này vào repository Pha2.

## 4.2. Trích xuất tin nhắn đặt vé ra JSON

**KET QUA AI**

```text
[
  {
    "ma_goi": "SVT",
    "ngay_su_kien": "2026-12-20",
    "nguoi_lon": 2,
    "tre_em": 1,
    "loai_ve": "thuong",
    "ghi_chu": null
  },
  {
    "ma_goi": "FZ",
    "ngay_su_kien": "2027-01-05",
    "nguoi_lon": 3,
    "tre_em": 0,
    "loai_ve": null,
    "ghi_chu": "hỗ trợ xe lăn"
  },
  {
    "ma_goi": "VIP",
    "ngay_su_kien": null,
    "nguoi_lon": 4,
    "tre_em": 0,
    "loai_ve": "vip",
    "ghi_chu": "hỗ trợ tìm chỗ cho người khiếm thị"
  }
]
```

**Link trò chuyện:**

## 4.3. Báo giá vé bằng Chain-of-Thought

**KET QUA AI**

```text
**Bước 1: Tiền người lớn**

* Nhóm gồm 5 người lớn, mua gói SVT với đơn giá 1.200.000 đồng/người lớn.
* Phép tính: $5 \times 1.200.000 = 6.000.000$ đồng.

**Bước 2: Tiền trẻ em**

* Có 2 trẻ em trong độ tuổi từ 5 đến 11 (8 tuổi và 10 tuổi) tính 70% giá người lớn: $2 \times (1.200.000 \times 70\%) = 2 \times 840.000 = 1.680.000$ đồng.
* Có 1 bé 3 tuổi (dưới 5 tuổi) được miễn phí: $1 \times 0 = 0$ đồng.
* Phép tính tổng tiền trẻ em: $1.680.000 + 0 = 1.680.000$ đồng.

**Bước 3: Tiền vé**

* Tiền vé bằng tổng tiền người lớn cộng với tiền trẻ em.
* Phép tính: $6.000.000 + 1.680.000 = 7.680.000$ đồng.

**Bước 4: Giảm giá nhóm**

* Nhóm có từ 5 người lớn trở lên (cụ thể có 5 người lớn) được giảm 5% trên tiền vé.
* Phép tính mức giảm: $7.680.000 \times 5\% = 384.000$ đồng.
* Tiền vé sau giảm: $7.680.000 - 384.000 = 7.296.000$ đồng.

**Bước 5: Phụ thu**

* Có 1 người lớn chọn khu ghế ưu tiên với mức phụ thu 300.000 đồng/người (phụ thu không được giảm giá).
* Phép tính: $1 \times 300.000 = 300.000$ đồng.

**Bước 6: Tổng tiền**

* Tổng tiền bằng tiền vé sau giảm cộng với phụ thu.
* Phép tính: $7.296.000 + 300.000 = 7.596.000$ đồng.

[RESULT: 7.596.000 đồng]
```

**Link trò chuyện:**

### b) Kiểm tra kết quả AI

(Ghi kết luận AI đúng hay sai; nếu sai, ghi bước sai đầu tiên và kết quả đúng của bước đó – xoá dòng này)

## 4.4. Dây chuyền xử lý khiếu nại – kết quả Trạm 1

**KET QUA AI**

```text
{
  "loai_su_co": "sai_khu_vuc",
  "so_khach": 2,
  "so_hiep_bi_anh_huong": 2,
  "tom_tat": "Khán giả mua vé SVT bị xếp sai sang khu vực không có mái che trong 2 hiệp đầu khiến ghế ướt."
}
```

**Link trò chuyện:**

## 4.5. Prompt chấm bài theo Rubric

**KET QUA AI**

```text
2.5 / 10
```

**Link trò chuyện:**

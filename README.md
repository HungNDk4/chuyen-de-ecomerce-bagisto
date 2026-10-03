# ĐỒ ÁN CHUYÊN ĐỀ TỐT NGHIỆP: NGHIÊN CỨU & TRIỂN KHAI HỆ THỐNG THƯƠNG MẠI ĐIỆN TỬ

## 1. THÔNG TIN ĐỀ TÀI & NHÓM THỰC HIỆN
* **Tên đề tài:** Nghiên cứu kiến trúc, quy trình phát triển và tối ưu hóa hệ quản trị cơ sở dữ liệu cho hệ thống thương mại điện tử chuyên nghiệp.
* **Thời gian thực hiện:** Tháng 09/2026 – Tháng 10/2026
* **Danh sách thành viên nhóm:**
  1. Nguyễn Duy Hùng (Leader / Tech Lead) - Quản trị mã nguồn, hạ tầng & cơ sở dữ liệu mẫu
  2. Thành viên 2 - Quản trị quy trình phần mềm (Jira Kanban) & Thiết kế mô hình Use Case / Activity Diagram
  3. Thành viên 3 - Đảm bảo chất lượng (QA/Tester) & Khảo sát giao diện người dùng (Storefront / Admin)
  4. Thành viên 4 - Khảo sát cấu trúc dữ liệu, trích xuất & phân tích lược đồ quan hệ thực thể (ERD)
  5. Thành viên 5 - Kỹ thuật CSDL nâng cao (Bảo mật băm Bcrypt, Cloud Media Offloading, Full-text Search)

---

## 2. TUYÊN BỐ LIÊM CHÍNH HỌC THUẬT (ACADEMIC INTEGRITY)
Hệ thống mã nguồn này được kế thừa và triển khai thực nghiệm dựa trên nền tảng thương mại điện tử mã nguồn mở **Bagisto (Laravel Framework + Vue.js)**. Nhóm sử dụng hệ sinh thái này làm **môi trường thực nghiệm đối chứng** nhằm phục vụ công tác phân tích, đánh giá học thuật chuyên sâu cho 02 học phần:
* **Chuyên đề 1 (Hệ Quản Trị Cơ Sở Dữ Liệu):** Khảo sát cấu trúc quan hệ RDBMS, mô hình hóa dữ liệu (ERD), đánh giá cơ chế bảo mật mật khẩu một chiều (Bcrypt), phân tích kiến trúc bảng phẳng `product_flat`, đề xuất giải pháp tách tải dữ liệu Media lên Cloud (Cloudinary/AWS S3) và tối ưu hóa truy vấn Full-text Search tiếng Việt.
* **Chuyên đề 2 (Quy Trình & Phát Triển Phần Mềm):** Thiết lập quy trình phát triển phần mềm theo mô hình Agile/Kanban trên Jira Software, quản trị phiên bản và luồng đóng góp mã nguồn qua Git/GitHub, mô hình hóa phân rã chức năng qua sơ đồ Use Case và Activity Diagram, thực thi bộ kịch bản kiểm thử hộp đen (15–20 Test Cases chức năng).

---

## 3. CÔNG NGHỆ SỬ DỤNG
* **Backend:** PHP 8.3, Laravel 12.x
* **Frontend:** Blade Template, Vue.js, Tailwind CSS
* **Database:** MySQL 8.x / MariaDB (Hệ quản trị CSDL quan hệ RDBMS)
* **Công cụ hỗ trợ & Vận hành:** Laragon, HeidiSQL, DBeaver, Git, Jira Software, Ngrok

---

## 4. HƯỚNG DẪN CÀI ĐẶT DỰ ÁN 1-CLICK (DÀNH CHO THÀNH VIÊN)
> **LƯU Ý QUAN TRỌNG:**
> * Nhóm thống nhất **sử dụng 100% môi trường Laragon** trên Windows để đồng bộ cấu hình, tránh lỗi sai lệch đường dẫn và thiếu extension PHP.
> * Cơ sở dữ liệu chuẩn kèm danh mục, banner và sản phẩm thực nghiệm đã được kết xuất sẵn trong tệp: `mockdata/database_final.sql`.
> * Thành viên **TUYỆT ĐỐI KHÔNG** chạy các lệnh `php artisan bagisto:install` hoặc `php artisan migrate:fresh` để tránh xung đột môi trường và làm hỏng cấu trúc dữ liệu của nhóm.

### Yêu cầu môi trường tiên quyết (Laragon):
1. Khởi động **Laragon**, bấm **Start All** (chạy Apache và MySQL).
2. Kích hoạt đủ 5 Extension PHP bắt buộc: Chuột phải trên giao diện Laragon -> **PHP** -> **Extensions** -> Đảm bảo đã tích chọn: `pdo_mysql`, `fileinfo`, `intl`, `gd`, `zip`.

---

### BƯỚC 1: CLONE MÃ NGUỒN VỀ MÁY
Mở cửa sổ dòng lệnh bằng cách bấm nút **Terminal** trên giao diện chính của Laragon (để nạp sẵn PATH của PHP và Composer), sau đó chạy:
```bash
git clone https://github.com/HungNDk4/chuyen-de-ecomerce-bagisto.git
cd chuyen-de-ecomerce-bagisto
```

### BƯỚC 2: CÀI ĐẶT THƯ VIỆN PHỤ THUỘC (VENDOR)
Tại cửa sổ Terminal Laragon, chạy:
```bash
composer install
```
*(Nếu phần mềm diệt virus quét làm kẹt file tạm thời, hãy đóng các ứng dụng soạn thảo và chạy lại lệnh).*

### BƯỚC 3: TẠO DATABASE & IMPORT DỮ LIỆU THỰC NGHIỆM
Chọn 1 trong 2 cách sau:

#### Cách A: Dùng HeidiSQL trực quan (Khuyên dùng)
1. Trên Laragon, bấm nút **Database** (HeidiSQL sẽ mở lên) -> bấm **Open** để kết nối MySQL root (mật khẩu để trống).
2. Nhấp chuột phải vào cột danh sách CSDL bên trái -> chọn **Create new** -> chọn **Database**:
   * **Đặt tên:** `bagisto_db`
   * **Bảng mã (Collation):** chọn `utf8mb4_unicode_ci` -> Bấm **OK**.
3. Bấm chọn database `bagisto_db` vừa tạo -> Nhấn tổ hợp phím **Ctrl + O** -> Chọn tệp `mockdata/database_final.sql`.
4. Bấm phím **F9** (Execute) để thực thi nạp dữ liệu (mất khoảng 5 giây). Nhấn **F5** kiểm tra danh sách bảng đã nạp thành công.

#### Cách B: Nạp trực tiếp qua Terminal Laragon
```bash
mysql -u root -e "DROP DATABASE IF EXISTS bagisto_db; CREATE DATABASE bagisto_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
mysql -u root bagisto_db < mockdata/database_final.sql
```

### BƯỚC 4: THIẾT LẬP MÔI TRƯỜNG TỰ ĐỘNG (1-CLICK SETUP)
Tại thư mục gốc của dự án, nhấp đúp chuột vào file `setup.bat` (hoặc chạy `.\setup.bat` trong Terminal).

Script này sẽ tự động xử lý toàn bộ các khâu kỹ thuật:
* Tự sinh file `.env` chuẩn hóa từ `.env.example` và tạo `APP_KEY`.
* Khắc phục dứt điểm lỗi Symlink trên Windows bằng cách sao chép trực tiếp kho tài nguyên ảnh từ `storage/app/public/` sang `public/storage/`.
* Tự động xóa sạch toàn bộ cache hệ thống (`optimize:clear`).

*(Kiểm tra nhanh file `.env`: Đảm bảo `DB_DATABASE=bagisto_db` và `APP_URL=http://127.0.0.1:8000`).*

### BƯỚC 5: KHỞI CHẠY MÁY CHỦ
Tại Terminal Laragon, chạy:
```bash
php artisan serve
```

---

## 5. THÔNG TIN TRUY CẬP HỆ THỐNG & TÀI KHOẢN MẪU
* **Giao diện người dùng (Storefront):** [http://127.0.0.1:8000](http://127.0.0.1:8000)
  *(Dành cho Thành viên 3 khảo sát giao diện, giỏ hàng, checkout và thực thi 15–20 ca kiểm thử Test Cases)*
* **Giao diện quản trị (Admin Panel):** [http://127.0.0.1:8000/admin](http://127.0.0.1:8000/admin)
  * **Email đăng nhập:** `admin@example.com`
  * **Mật khẩu (Password):** `admin123`

---

## 6. QUY TRÌNH ĐỒNG BỘ DỮ LIỆU KHI CÓ CẬP NHẬT MỚI (DÀNH CHO NHÓM)

### Dành cho người thêm dữ liệu (Thêm sản phẩm, đổi banner, sửa logo qua Admin):
1. Vào HeidiSQL, xuất đè database mới ra tệp `mockdata/database_final.sql` (bỏ chọn Drop/Create Database, tích chọn Drop/Create Table, chọn Data: Insert).
2. Commit và Push lên GitHub:
```bash
git add mockdata/database_final.sql storage/app/public/
git commit -m "feat: cap nhat san pham va hinh anh moi"
git push origin main
```

### Dành cho các thành viên còn lại (Cập nhật dữ liệu mới về máy):
1. Kéo mã nguồn mới:
```bash
git pull origin main
```
2. Mở HeidiSQL nạp lại tệp `mockdata/database_final.sql` vào `bagisto_db` (nhấn **F9**).
3. Chạy lại file `setup.bat` để script tự động copy hình ảnh mới vào `public/storage`.

---

## 7. XỬ LÝ SỰ CỐ THƯỜNG GẶP (TROUBLESHOOTING)

* **Lỗi ảnh banner bị trắng / chỉ hiện chữ n1:**
  * **Nguyên nhân:** Do chưa bật PHP Extension `gd` hoặc chưa đồng bộ thư mục ảnh sang `public/storage`.
  * **Khắc phục:** Bật extension `gd` trong Laragon. Mở thư mục dự án, chạy lại file `setup.bat` và nhấn tổ hợp phím **Ctrl + F5** trên trình duyệt.

* **Lỗi `composer: The term 'composer' is not recognized`:**
  * **Nguyên nhân:** Mở nhầm PowerShell mặc định của Windows chưa nạp biến môi trường.
  * **Khắc phục:** Bấm trực tiếp nút **Terminal** trên giao diện Laragon để mở cửa sổ lệnh chuẩn.

* **Lỗi `ViteManifestNotFoundException`:**
  * **Nguyên nhân:** Thiếu file cấu hình theme biên dịch sẵn hoặc CSDL chưa kết nối khiến web nhảy sang route `/install`.
  * **Khắc phục:** Đảm bảo đã import CSDL `mockdata/database_final.sql` và thông tin `DB_DATABASE` trong `.env` đã trùng khớp, sau đó chạy `php artisan optimize:clear`.

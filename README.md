# ĐỒ ÁN CHUYÊN ĐỀ TỐT NGHIỆP: NGHIÊN CỨU & TRIỂN KHAI HỆ THỐNG THƯƠNG MẠI ĐIỆN TỬ

## 1. THÔNG TIN ĐỀ TÀI & NHÓM THỰC HIỆN
* **Tên đề tài:** Nghiên cứu kiến trúc, quy trình phát triển và tối ưu hóa hệ quản trị cơ sở dữ liệu cho hệ thống thương mại điện tử chuyên nghiệp.
* **Thời gian thực hiện:** Tháng 09/2026 – Tháng 10/2026
* **Danh sách thành viên nhóm:**
  1. Nguyễn Duy Hùng (Leader / Tech Lead) - Quản trị mã nguồn & Triển khai hạ tầng
  2. Thành viên 2 - Quản lý dự án (Jira) & Phân tích nghiệp vụ (BA)
  3. Thành viên 3 - Đảm bảo chất lượng (QA/Tester) & Giao diện người dùng
  4. Thành viên 4 - Khảo sát cấu trúc dữ liệu & Thiết kế lược đồ ERD
  5. Thành viên 5 - Kỹ thuật CSDL nâng cao (Cloud Media, Full-text Search, Bcrypt)

---

## 2. TUYÊN BỐ LIÊM CHÍNH HỌC THUẬT (ACADEMIC INTEGRITY)
Hệ thống mã nguồn này được kế thừa và triển khai dựa trên nền tảng thương mại điện tử mã nguồn mở **Bagisto (Laravel Framework + Vue.js)**.

Nhóm sử dụng hệ sinh thái này làm **môi trường thực nghiệm đối chứng** để phục vụ công tác phân tích học thuật cho 02 học phần:
* **Chuyên đề 1 (Hệ Quản Trị Cơ Sở Dữ Liệu):** Khảo sát cấu trúc quan hệ RDBMS, mô hình hóa dữ liệu (ERD), đánh giá cơ chế bảo mật băm mật khẩu Bcrypt, phân tích giải pháp tách tải dữ liệu Media lên Cloud (Cloudinary/AWS S3) và tối ưu hóa truy vấn Full-text Search.
* **Chuyên đề 2 (Quy Trình & Phát Triển Phần Mềm):** Thiết lập quy trình phát triển phần mềm theo mô hình Agile/Scrum qua Jira, quản trị phiên bản mã nguồn Git/GitHub, mô hình hóa Use Case/Activity Diagram và thực thi bộ kịch bản kiểm thử chức năng (15–20 Test Cases).

---

## 3. CÔNG NGHỆ SỬ DỤNG
* **Backend:** PHP 8.x, Laravel Framework
* **Frontend:** Blade Template, Vue.js, Tailwind CSS
* **Database:** MySQL (Hệ quản trị CSDL quan hệ)
* **Quản lý & Triển khai:** Laragon, Git, Jira Software, Ngrok

---

## 4. HƯỚNG DẪN CÀI ĐẶT MÔI TRƯỜNG THỰC NGHIỆM (LOCAL)

### Yêu cầu tiên quyết:
* PHP >= 8.1 (bật đầy đủ extension: `fileinfo`, `intl`, `gd`, `zip`, `pdo_mysql`)
* Composer, Node.js & MySQL (Laragon/XAMPP)
## 4. HƯỚNG DẪN CÀI ĐẶT HỆ THỐNG CHI TIẾT (DÀNH CHO THÀNH VIÊN & NGƯỜI DÙNG)

> **LƯU Ý QUAN TRỌNG:** Dự án đã có sẵn Database hoàn chỉnh trong file `mockdata/database1.1.sql`. Thành viên **KHÔNG** chạy lệnh `bagisto:install` để tránh xung đột môi trường. Hãy làm tuần tự theo 4 bước dưới đây:

### Bước 1: Yêu cầu môi trường bắt buộc (Laragon / XAMPP)
* Bật **Laragon** (hoặc XAMPP), khởi động **Apache** và **MySQL**.
* **Kích hoạt các Extension PHP bắt buộc:**
  * Nhấp chuột phải trên màn hình Laragon -> **PHP** -> **Extensions**.
  * Tích chọn đủ các extension: `pdo_mysql`, `fileinfo`, `intl`, `gd`, `zip`.

### Bước 2: Nạp dữ liệu Cơ sở dữ liệu mẫu (10 giây)
1. Mở phần mềm **HeidiSQL** (có sẵn trong Laragon) hoặc **phpMyAdmin** (`http://localhost/phpmyadmin`).
2. Tạo một Database mới đặt tên là: `bagisto_db` (định dạng `utf8mb4_unicode_ci`).
3. Mở file `mockdata/database1.1.sql` có trong thư mục dự án và thực thi (Execute / Import) toàn bộ vào database `bagisto_db`.

### Bước 3: Khởi tạo mã nguồn & Cấu hình môi trường (.env)
Mở Terminal của Laragon tại thư mục dự án (`bagisto-store`), chạy lần lượt:

```
# 1. Cài đặt các gói phụ thuộc PHP
composer install

# 2. Tạo file cấu hình môi trường
copy .env.example .env

# 3. Tạo khóa bảo mật ứng dụng
php artisan key:generate
```
Mở file .env kiểm tra lại cấu hình kết nối CSDL:

```
APP_NAME=Bagisto
APP_URL=[http://127.0.0.1:8000](http://127.0.0.1:8000)

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=bagisto_db
DB_USERNAME=root
DB_PASSWORD=
```
(Nếu dùng Laragon mặc định, dòng DB_PASSWORD= để trống).
Bước 4: Xử lý hiển thị hình ảnh & Khởi chạy máy chủ
```
# 1. Tạo symlink liên kết thư mục chứa ảnh
php artisan storage:link

# 2. Xóa sạch bộ nhớ đệm cache hệ thống
php artisan optimize:clear

# 3. Khởi động máy chủ ứng dụng
php artisan serve
```
⚠️ KHẮC PHỤC SỰ CỐ THƯỜNG GẶP (TROUBLESHOOTING)

Lỗi vỡ ảnh banner / Không hiển thị hình ảnh sản phẩm:

Do đặc thù môi trường Windows chặn tạo symlink tự động, nếu trang web bị gãy ảnh (chỉ hiện icon ô vuông hoặc text alt):

Mở Windows Explorer, vào thư mục: storage/app/public/

Sao chép (Copy) toàn bộ thư mục bên trong (gồm themes, products, banners...) và dán trực tiếp (Paste) vào thư mục: public/storage/ (nếu chưa có thư mục storage trong public thì tạo mới).

Chạy lại lệnh: php artisan optimize:clear và nhấn tổ hợp phím Ctrl + F5 trên trình duyệt.

Lỗi php hoặc composer không nhận lệnh trong Terminal:

Hãy mở trực tiếp cửa sổ dòng lệnh bằng cách bấm nút Terminal ở góc phải giao diện Laragon để nạp đầy đủ biến môi trường hệ thống.


## 5. THÔNG TIN TRUY CẬP THỬ NGHIỆM

Storefront (Khách hàng): [http://127.0.0.1:8000](http://127.0.0.1:8000)

Admin Panel (Quản trị): [http://127.0.0.1:8000/admin](http://127.0.0.1:8000/admin)

Email: admin@example.com

Password: admin123





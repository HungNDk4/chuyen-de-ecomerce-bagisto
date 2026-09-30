
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
Hệ thống mã nguồn này được kế thừa và triển khai thực nghiệm dựa trên nền tảng thương mại điện tử mã nguồn mở **Bagisto (Laravel Framework + Vue.js)**.

Nhóm sử dụng hệ sinh thái này làm **môi trường thực nghiệm đối chứng** nhằm phục vụ công tác phân tích, đánh giá học thuật chuyên sâu cho 02 học phần:
* **Chuyên đề 1 (Hệ Quản Trị Cơ Sở Dữ Liệu):** Khảo sát cấu trúc quan hệ RDBMS, mô hình hóa dữ liệu (ERD), đánh giá cơ chế bảo mật mật khẩu một chiều (Bcrypt), phân tích kiến trúc bảng phẳng `product_flat`, đề xuất giải pháp tách tải dữ liệu Media lên Cloud (Cloudinary/AWS S3) và tối ưu hóa truy vấn Full-text Search tiếng Việt.
* **Chuyên đề 2 (Quy Trình & Phát Triển Phần Mềm):** Thiết lập quy trình phát triển phần mềm theo mô hình Agile/Kanban trên Jira Software, quản trị phiên bản và luồng đóng góp mã nguồn qua Git/GitHub, mô hình hóa phân rã chức năng qua sơ đồ Use Case và Activity Diagram, thực thi bộ kịch bản kiểm thử hộp đen (15–20 Test Cases chức năng).

---

## 3. CÔNG NGHỆ SỬ DỤNG
* **Backend:** PHP 8.x, Laravel Framework
* **Frontend:** Blade Template, Vue.js, Tailwind CSS
* **Database:** MySQL / MariaDB (Hệ quản trị CSDL quan hệ RDBMS)
* **Công cụ hỗ trợ & Vận hành:** Laragon, HeidiSQL, DBeaver, Git, Jira Software, Ngrok

---

## 4. HƯỚNG DẪN CÀI ĐẶT DỰ ÁN & IMPORT DATABASE MẪU (DÀNH CHO THÀNH VIÊN)

> **LƯU Ý QUAN TRỌNG:** 
> Dữ liệu mẫu (gồm danh mục, sản phẩm, cấu hình kênh và tài khoản admin) đã được kết xuất sẵn trong file: `mockdata/database1.1.sql` (hoặc `database.sql`).
> Thành viên **TUYỆT ĐỐI KHÔNG** chạy các lệnh `php artisan bagisto:install` hoặc `php artisan migrate:fresh` để tránh xung đột môi trường và làm mất dữ liệu mẫu của nhóm.

### Yêu cầu môi trường bắt buộc (Sử dụng Laragon):
1. Bật **Laragon**, bấm **Start All** để khởi chạy cả **Apache** và **MySQL**.
2. Kiểm tra Extension PHP: Nhấp chuột phải vào màn hình Laragon -> **PHP** -> **Extensions** -> Đảm bảo đã tích chọn: `pdo_mysql`, `fileinfo`, `intl`, `gd`, `zip`.

---

### BƯỚC 1: IMPORT DATABASE MẪU VÀO MÁY (Chọn 1 trong 2 cách)

#### Cách A: Import trực quan bằng HeidiSQL (Khuyên dùng - Nhanh nhất)
1. Trên giao diện chính của **Laragon**, bấm nút **Database** (phần mềm **HeidiSQL** tích hợp sẵn sẽ tự động mở lên).
2. Bấm nút **Open** ở góc dưới bên phải để kết nối vào máy chủ MySQL.
3. Tạo Database mới:
   * Nhấp chuột phải vào khoảng trống ở cột danh sách cơ sở dữ liệu bên trái -> chọn **Create new** -> chọn **Database**.
   * Đặt tên: `bagisto_db`
   * Bảng mã (Collation): chọn `utf8mb4_unicode_ci` -> Bấm **OK**.
4. Nạp dữ liệu:
   * Trên thanh menu chính của HeidiSQL, vào thẻ **Tools** (Công cụ) -> chọn **Load SQL file...** (hoặc nhấn phím tắt `Ctrl + O`).
   * Tìm và mở file `mockdata/database1.1.sql` (hoặc `database.sql`) nằm trong thư mục dự án vừa tải về.
   * HeidiSQL hỏi có muốn chạy file không, bấm **Execute** (hoặc bấm biểu tượng tam giác màu xanh / phím `F9`).
   * Chờ thanh tiến trình hoàn tất (mất khoảng 5–10 giây). Nhấn `F5` để kiểm tra: toàn bộ các bảng `products`, `categories`, `admins`... đã hiển thị đầy đủ dữ liệu.

#### Cách B: Import nhanh bằng Terminal / Dòng lệnh
Nếu quen dùng dòng lệnh, mở nút **Terminal** trên giao diện Laragon và chạy:
```bash
# 1. Tạo CSDL bagisto_db
mysql -u root -e "CREATE DATABASE IF NOT EXISTS bagisto_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"

# 2. Nạp dữ liệu từ file sql vào database
mysql -u root bagisto_db < mockdata/database1.1.sql

```

---

### BƯỚC 2: CẤU HÌNH BIẾN MÔI TRƯỜNG (.ENV)

Tại thư mục dự án, tạo file `.env` từ file mẫu và thiết lập các thông số:

```bash
# Tạo file cấu hình môi trường
copy .env.example .env

# Sinh khóa bí mật ứng dụng
php artisan key:generate

```

Mở file `.env` bằng Notepad / VS Code, kiểm tra đúng các dòng kết nối CSDL như sau:

```ini
APP_NAME=Bagisto
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=[http://127.0.0.1:8000](http://127.0.0.1:8000)

DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=bagisto_db
DB_USERNAME=root
DB_PASSWORD=

```

*(Lưu ý: Mặc định trên Laragon, biến `DB_PASSWORD=` để trống hoàn toàn sau dấu bằng).*

---

### BƯỚC 3: CÀI ĐẶT THƯ VIỆN & XỬ LÝ LIÊN KẾT ẢNH (STORAGE)

Mở cửa sổ **Terminal** trên Laragon, di chuyển vào thư mục dự án và chạy các lệnh:

```bash
# 1. Cài đặt các thư viện phụ thuộc PHP (nếu chưa tải vendor)
composer install

# 2. Tạo symlink liên kết thư mục chứa hình ảnh sản phẩm/banner
php artisan storage:link

# 3. Dọn sạch toàn bộ cache hệ thống
php artisan optimize:clear

```

---

### BƯỚC 4: KHỞI ĐỘNG VÀ TRUY CẬP HỆ THỐNG

Khởi động máy chủ phát triển Laravel:

```bash
php artisan serve

```

---

## 5. THÔNG TIN TRUY CẬP HỆ THỐNG & TÀI KHOẢN MẪU

* **Giao diện người dùng (Storefront):** [http://127.0.0.1:8000](https://www.google.com/url?sa=E&source=gmail&q=http://127.0.0.1:8000)
*(Dùng cho Thành viên 3 chụp ảnh sản phẩm, giỏ hàng, checkout và thực thi bảng Test Cases)*
* **Giao diện trang quản trị (Admin Panel):** [http://127.0.0.1:8000/admin](https://www.google.com/search?q=http://127.0.0.1:8000/admin)
* **Email đăng nhập:** `admin@example.com`
* **Mật khẩu (Password):** `admin123`



---

## 6. HƯỚNG DẪN KHẮC PHỤC SỰ CỐ THƯỜNG GẶP (TROUBLESHOOTING)

* **Lỗi vỡ ảnh banner / Không hiện ảnh sản phẩm:**
* Do hệ điều hành Windows chặn quyền tạo Symlink tự động: Bạn mở File Explorer, vào thư mục `storage/app/public/`.
* Sao chép (Copy) toàn bộ các thư mục con bên trong (gồm `themes`, `products`, `banners`...) và dán trực tiếp (Paste) vào thư mục `public/storage/` (nếu chưa có thư mục storage trong `public/` thì tạo mới).
* Chạy lại lệnh: `php artisan optimize:clear` và nhấn tổ hợp phím **Ctrl + F5** trên trình duyệt.


* **Lỗi Terminal không nhận lệnh PHP/Composer:**
* Bắt buộc mở Terminal bằng cách bấm trực tiếp vào nút **Terminal** trên giao diện chính của Laragon để nạp đầy đủ đường dẫn biến môi trường.


* **Lỗi không đăng nhập được tài khoản Admin:**
* Kiểm tra lại bảng `admins` trong HeidiSQL xem email quản trị viên có đúng là `admin@example.com` không.



```

---

### Hướng dẫn bạn cập nhật nhanh lên GitHub:
1. Mở trang repo của bạn: [https://github.com/HungNDk4/chuyen-de-ecomerce-bagisto](https://github.com/HungNDk4/chuyen-de-ecomerce-bagisto) [source: 2]
2. Bấm vào file `README.md` -> bấm vào biểu tượng **Cây bút chì (Edit this file)** [source: 2].
3. Xóa nội dung cũ và dán toàn bộ đoạn văn bản ở trên vào [source: 2].
4. Kéo xuống dưới cùng bấm nút xanh **Commit changes** [source: 2]. Cả nhóm mở ra sẽ thấy hướng dẫn từng bước rõ ràng, dễ làm theo [source: 2].

```

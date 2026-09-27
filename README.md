# ĐỒ ÁN CHUYÊN ĐỀ TỐT NGHIỆP: NGHIÊN CỨU & TRIỂN KHAI HỆ THỐNG THƯƠNG MẠI ĐIỆN TỬ

## 1. THÔNG TIN ĐỀ TÀI & NHÓM THỰC HIỆN
* **Tên đề tài:** Nghiên cứu kiến trúc, quy trình phát triển và tối ưu hóa hệ quản trị cơ sở dữ liệu cho hệ thống thương mại điện tử chuyên nghiệp.
* **Thời gian thực hiện:** Tháng 09/2026 – Tháng 10/2026
* **Danh sách thành viên nhóm:**
  1. Nguyễn Đình Hùng (Leader / Tech Lead) - Quản trị mã nguồn & Triển khai hạ tầng
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

### Các bước khởi chạy:
```bash
# 1. Cài đặt các gói phụ thuộc
composer install
npm install && npm run build

# 2. Cấu hình môi trường
# Tạo file .env từ .env.example và điền thông tin Database:
# DB_DATABASE=bagisto_db, DB_USERNAME=root, DB_PASSWORD=

# 3. Khởi tạo khóa ứng dụng và cơ sở dữ liệu
php artisan key:generate
php artisan migrate:fresh --seed

# 4. Tạo liên kết thư mục ảnh lưu trữ
php artisan storage:link
php artisan optimize:clear

# 5. Khởi động máy chủ phát triển
php artisan serve

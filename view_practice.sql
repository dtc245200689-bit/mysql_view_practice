-- Đảm bảo sử dụng đúng cơ sở dữ liệu mẫu classicmodels
USE classicmodels;

-- ===============================================================
-- 1. KHỞI TẠO VIEW ĐẦU TIÊN (customer_views)
-- ===============================================================
-- Xóa view cũ nếu đã tồn tại trước đó để đảm bảo câu lệnh chạy mượt mà
DROP VIEW IF EXISTS customer_views;

-- Tạo bảng ảo chỉ chứa các cột: customerNumber, customerName, phone
CREATE VIEW customer_views AS
SELECT customerNumber, customerName, phone
FROM customers;

-- Truy vấn dữ liệu thực tế từ bảng ảo vừa tạo
SELECT * FROM customer_views;


-- ===============================================================
-- 2. CẬP NHẬT / THAY ĐỔI CẤU TRÚC VIEW (Sử dụng CREATE OR REPLACE)
-- ===============================================================
-- Thêm các cột contactFirstName, contactLastName và lọc theo thành phố Nantes
CREATE OR REPLACE VIEW customer_views AS
SELECT customerNumber, customerName, contactFirstName, contactLastName, phone
FROM customers
WHERE city = 'Nantes';

-- Truy vấn kiểm tra lại dữ liệu sau khi cập nhật cấu trúc bảng ảo
SELECT * FROM customer_views;


-- ===============================================================
-- 3. XÓA VIEW KHỎI CƠ SỞ DỮ LIỆU (DROP VIEW)
-- ===============================================================
-- Thực hiện lệnh xóa bảng ảo khi không còn nhu cầu sử dụng
DROP VIEW customer_views;

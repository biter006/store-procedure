-- Thực hành View trên CSDL classicmodels
USE classicmodels;

-- Xóa view cũ nếu đã tồn tại để có thể chạy lại bài.
DROP VIEW IF EXISTS customer_views;

-- 1. Tạo view lấy mã, tên và số điện thoại khách hàng
CREATE VIEW customer_views AS
SELECT
    customerNumber,
    customerName,
    phone
FROM customers;

-- 2. Truy vấn dữ liệu từ view
SELECT *
FROM customer_views;

-- 3. Cập nhật lại định nghĩa view: chỉ lấy khách hàng ở Nantes
CREATE OR REPLACE VIEW customer_views AS
SELECT
    customerNumber,
    customerName,
    contactFirstName,
    contactLastName,
    phone
FROM customers
WHERE city = 'Nantes';

-- 4. Kiểm tra view sau khi cập nhật
SELECT *
FROM customer_views;

-- 5. Chạy dòng dưới đây sau khi đã chụp kết quả nếu muốn xóa view.
-- DROP VIEW customer_views;

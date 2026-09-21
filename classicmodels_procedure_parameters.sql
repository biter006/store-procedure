-- Thực hành Stored Procedure với tham số IN, OUT và INOUT
USE classicmodels;

DELIMITER //

-- 1. IN: nhận mã khách hàng và trả về thông tin khách hàng đó
DROP PROCEDURE IF EXISTS getCusById //
CREATE PROCEDURE getCusById(IN cusNum INT)
BEGIN
    SELECT *
    FROM customers
    WHERE customerNumber = cusNum;
END //

-- 2. OUT: trả số lượng khách hàng của một thành phố ra biến bên ngoài
DROP PROCEDURE IF EXISTS GetCustomersCountByCity //
CREATE PROCEDURE GetCustomersCountByCity(
    IN in_city VARCHAR(50),
    OUT total INT
)
BEGIN
    SELECT COUNT(customerNumber)
    INTO total
    FROM customers
    WHERE city = in_city;
END //

-- 3. INOUT: nhận biến đếm, cộng thêm một giá trị, rồi trả lại biến đã đổi
DROP PROCEDURE IF EXISTS SetCounter //
CREATE PROCEDURE SetCounter(
    INOUT counter INT,
    IN inc INT
)
BEGIN
    SET counter = counter + inc;
END //

DELIMITER ;

-- Gọi procedure có tham số IN
CALL getCusById(175);

-- Gọi procedure có tham số OUT
CALL GetCustomersCountByCity('Lyon', @total);
SELECT @total AS so_khach_hang_tai_lyon;

-- Gọi procedure có tham số INOUT
SET @counter = 1;
CALL SetCounter(@counter, 1);
CALL SetCounter(@counter, 1);
CALL SetCounter(@counter, 5);
SELECT @counter AS gia_tri_cuoi_cung;

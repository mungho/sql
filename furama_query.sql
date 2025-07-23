USE furama_resort;

-- 2. Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 kí tự.
SELECT * FROM nhan_vien
WHERE
ho_ten LIKE 'H%'
OR ho_ten LIKE 'T%'
OR ho_ten LIKE 'K%'
AND CHAR_LENGTH(ho_ten) <= 15;

-- 3. Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT * FROM khach_hang;
SELECT * FROM khach_hang
WHERE YEAR(CURRENT_DATE()) - YEAR(ngay_sinh) BETWEEN 18 AND 50
AND (dia_chi LIKE '%Đà Nẵng' OR dia_chi LIKE '%Quảng Trị');
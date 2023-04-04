go
CREATE VIEW View1 AS
SELECT  * FROM SanPham; 
GO
CREATE VIEW View2 AS
SELECT masp,tensp,soluong,mausac,giaban,donvitinh,mota
	FROM Sanpham
	ORDER BY giaban	DESC;
GO
CREATE VIEW View3 AS
SELECT Sanpham.masp,Sanpham.tensp,Sanpham.soluong,Sanpham.mausac
	,Sanpham.giaban,Sanpham.donvitinh,Sanpham.mota,Hangsx.Tenhang
	FROM Sanpham,Hangsx
	WHERE Tenhang = 'Samsung'
GO
CREATE VIEW View4 AS
SELECT *
	FROM Nhanvien
	WHERE Gioitinh = 'Nữ' AND Phong = 'Kế toán';
GO
CREATE VIEW View5 AS
SELECT nhap.sohdn,Sanpham.Masp,Sanpham.Tensp,Hangsx.Tenhang,Nhap.soluongN,Nhap.donggiaN,Nhap.soluongN*Nhap.dongiaN AS tiennhap,Sanpham.mausac,Sanpham.donvitinh
	,Nhap.ngaynhap,Nhanvien.tennv,Nhanvien.phong
	FROM Nhap
	JOIN Sanpham ON Nhap.masp = Sanpham.masp
	JOIN Hangsx ON SanPham.Mahangsx = Hangsx.Mahangsx
	JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
	ORDER BY Nhap.Sohdn ASC;
GO
CREATE VIEW View6 AS
SELECT Sanpham.masp,Sanpham.tensp,Sanpham.soluong,Sanpham.mausac
	,Sanpham.giaban,Sanpham.donvitinh,Sanpham.mota,Hangsx.Tenhang
	FROM Sanpham,Hangsx
	WHERE Tenhang = 'Samsung'
	AND giaban BETWEEN 100000 AND 500000;
GO
CREATE VIEW View7 AS
SELECT Xuat.Sohdx,SanPham.Masp,SanPham.tensp,Hangsx.Tenhang,Xuat.soluongX,SanPham.giaban,
	Xuat.soluongX *SanPham.giaban AS tienxuat,SanPham.mausac,SanPham.donvitinh,Xuat.Ngayxuat,
	Nhanvien.Tennv,Nhanvien.Phong
FROM Xuat
INNER JOIN SanPham ON Xuat.Masp = SanPham.Masp
INNER JOIN Hangsx ON SanPham.Mahangsx = Hangsx.Mahangsx
INNER JOIN Nhanvien ON Xuat.Manv = Nhanvien.Manv
WHERE MONTH(Xuat.Ngayxuat) = 10 and YEAR(Xuat.Ngayxuat) = 2018
order by Xuat.Sohdx ASC;
GO
CREATE VIEW View8 AS
SELECT TOP 10 Xuat.Sohdx,SanPham.tensp,Xuat.soluongX
FROM Xuat
INNER JOIN SanPham ON Xuat.Masp = SanPham.Masp
WHERE YEAR(Xuat.Ngayxuat) = '2023'
ORDER BY Xuat.soluongX DESC;
GO
CREATE VIEW View9 AS
SELECT TOP 100 PERCENT Nhap.Sohdn,SanPham.Masp,SanPham.tensp,Hangsx.Tenhang,Nhap.soluongN,Nhap.dongiaN,
Nhap.soluongN * Nhap.dongiaN AS Tiennhap,SanPham.mausac,SanPham.donvitinh,Nhap.Ngaynhap,Nhanvien.Tennv,Nhanvien.Phong
FROM Nhap
JOIN SanPham ON Nhap.Masp = SanPham.Masp
JOIN Hangsx ON SanPham.Mahangsx = Hangsx.Mahangsx
JOIN Nhanvien ON Nhap.Manv = Nhanvien.Manv
WHERE MONTH(Nhap.Ngaynhap) = 10 and YEAR(Nhap.Ngaynhap) = 2018
order by Nhap.Sohdn ASC;

drop view View1
drop view View2
drop view View3
drop view View4
drop view View5
drop view View6
drop view View7
drop view View8
drop view View9
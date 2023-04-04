câu 1
SELECT Hangsx.tenhang, COUNT(Sanpham.masp) AS so_luong_sp
FROM Hangsx
JOIN Sanpham ON Hangsx.mahangsx = Sanpham.mahangsx
GROUP BY Hangsx.tenhang
--2--
SELECT masp, SUM(soluongN * dongiaN) AS TongTienNhap
FROM Nhap
WHERE YEAR(ngaynhap) = 2020
GROUP BY masp;
--3--
SELECT Sanpham.masp, Sanpham.tensp, SUM(Xuat.soluongX) as tong_soluong_xuat
FROM Sanpham
JOIN Xuat ON Sanpham.masp = Xuat.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE YEAR(Xuat.ngayxuat) = 2018 AND Hangsx.tenhang = 'Samsung'
GROUP BY Sanpham.masp, Sanpham.tensp
HAVING SUM(Xuat.soluongX) > 10000;
--4--
SELECT phong, COUNT(*) AS SoLuongNam
FROM Nhanvien
WHERE gioitinh = 'Nam'
GROUP BY phong
--5--
SELECT Hangsx.tenhang, SUM(Nhap.soluongN) as TongSoLuongNhap
FROM Nhap
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Hangsx ON Sanpham.mahangsx = Hangsx.mahangsx
WHERE YEAR(Nhap.ngaynhap) = 2020
GROUP BY Hangsx.tenhang
--6--
SELECT Nhanvien.tennv ,Nhanvien.manv ,SUM(Xuat.soluongX*Sanpham.giaban) as TongtienXuat
FROM Xuat
JOIN Sanpham ON Xuat.masp = Sanpham.masp
JOIN Nhanvien ON Xuat.manv = Nhanvien.manv
WHERE YEAR(Xuat.ngayxuat) = 2019
GROUP BY Nhanvien.tennv,Nhanvien.manv 
--7--
SELECT Nhanvien.tennv ,Nhanvien.manv ,SUM(Nhap.soluongN*Sanpham.giaban) as Tongtiennhap
from Nhap 
JOIN Sanpham ON Nhap.masp = Sanpham.masp
JOIN Nhanvien ON Nhap.manv = Nhanvien.manv
WHERE YEAR(Nhap.ngaynhap) = 2020 and Month(Nhap.ngaynhap) = 07 
GROUP BY Nhanvien.manv,Nhanvien.tennv 
having SUM(Nhap.soluongN*Sanpham.giaban)  > 100000

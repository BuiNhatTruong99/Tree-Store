USE MASTER
GO

--DROP DATABASE ASM_JAVA5
--GO

CREATE DATABASE ASM_JAVA5
GO

USE ASM_JAVA5
GO

CREATE TABLE NguoiDung (
	ID_KH int IDENTITY(1,1) PRIMARY KEY,	-- Mã người dùng
	HoTen nvarchar(50), -- Tên người dùng
	NgaySinh date, -- Ngày sinh
	GioiTinh bit, -- Giới tính
	SoDT nchar(15),	-- Số điện thoại
	Email nvarchar(50), -- Email
	Anh nvarchar (100),	-- Ảnh đại diện
	TenTK nvarchar(50), -- Tên tài khoản
	MatKhau nvarchar(50),	-- Mật khẩu
	DiaChi nvarchar(255), -- Địa chỉ
	VaiTro bit	-- Vai trò
)
GO

CREATE TABLE DanhMuc (
	ID_DM int IDENTITY(1,1) PRIMARY KEY,-- Mã danh mục
	TenDM nvarchar(50)	-- Tên danh mục
)
GO

CREATE TABLE SanPham (
	ID_SP int IDENTITY(1,1) PRIMARY KEY, -- Mã sản phẩm
	TenSP nvarchar(250),	-- Tên sản phẩm
	TrangThai bit,	-- Trạng thái còn/hết hàng
	Anh nvarchar(250),	-- Ảnh sản phẩm
	Gia decimal (9,0),	-- Giá
	SLTonKho int,	-- SL tồn kho
	MoTa nvarchar(250),	-- Mô tả
	ID_DM int, -- Mã danh mục
	Is_Delete bit, -- sp đã xóa khỏi danh sách/ chưa
	CONSTRAINT FK_SP_DM FOREIGN KEY (ID_DM) REFERENCES DanhMuc(ID_DM) ON DELETE SET NULL ON UPDATE NO ACTION
)
GO


CREATE TABLE DonDatHang (
	ID_DDH int IDENTITY(1,1) PRIMARY KEY, -- Mã đơn hàng
	NgayDat date, -- Ngày đặt
	GhiChuKH nvarchar(250), -- Ghi chú
	TongTien decimal(9,0), -- Tổng tiền
	TrangThai nvarchar(50), -- Trạng thái
	SoDT nchar(15),	-- SĐT sẽ gửi cho khách nhận hàng
	DiaChi nvarchar(255), -- Địa chỉ nhận hàng
	ID_KH int, -- Mã khách hàng
	CONSTRAINT FK_DDH_KH FOREIGN KEY (ID_KH) REFERENCES NguoiDung(ID_KH) ON DELETE NO ACTION ON UPDATE CASCADE
)
GO

CREATE TABLE DonDatChiTiet (
	ID_DDCT int IDENTITY(1,1) PRIMARY KEY, -- Mã đơn hàng chi tiết
	ID_DDH int, -- Mã đơn hàng
	ID_SP int, -- Mã sản phẩm
	SoLuong int, -- Số lượng sản phẩm
	TongTien decimal (9,0),	-- SL * Giá SP => Tổng tiền
	CONSTRAINT FK_DDCT_SP FOREIGN KEY (ID_SP) REFERENCES SanPham(ID_SP) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT FK_DDCT_DDH FOREIGN KEY (ID_DDH) REFERENCES DonDatHang(ID_DDH) ON DELETE NO ACTION ON UPDATE CASCADE,
)
GO

CREATE TABLE FeedBack (
	ID_FB int IDENTITY(1,1) PRIMARY KEY, -- Mã đánh giá
	ID_KH int, -- Mã khách hàng
	ID_SP int, -- Mã sản phẩm
	DanhGia float, -- Chỉ số đánh giá
	NoiDung nvarchar(250), -- Nội dung
	NgayDang date, -- Ngày đăng
	CONSTRAINT FK_FB_SP FOREIGN KEY (ID_SP) REFERENCES SanPham(ID_SP) ON DELETE NO ACTION ON UPDATE CASCADE,
	CONSTRAINT FK_FB_KH FOREIGN KEY (ID_KH) REFERENCES NguoiDung(ID_KH) ON DELETE NO ACTION ON UPDATE CASCADE
)
GO

------------------------- THÊM D? LI?U --------------------------
-- Insert NguoiDung
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Đỗ Phi Hùng', '2000-01-01', 1, '0383123456', 'hung@gmail.com', 'user1.png','hung123','Hung123', '1234 Quang Trung, Phường 10, Gò Vấp',1)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Cao Hoài Bảo Ngọc', '2000-01-01', 1, '0353123456', 'ngoc@gmail.com', 'user1.png','ngoc123','Ngoc123', '1234 Quang Trung, Phường 10, Gò Vấp',1)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Bùi Nhật Trường', '2000-01-01', 1, '0363123456', 'truong@gmail.com', 'user1.png','truong123','Truong123', '1234 Quang Trung, Phường 10, Gò Vấp',1)
INSERT NguoiDung  (HoTen, NgaySinh, GioiTinh, SoDT ,Email, Anh , TenTK, MatKhau, DiaChi ,VaiTro )
	VALUES (N'Nguyễn Hoàng Quốc Anh', '2000-01-01', 1, '0373123456', 'anh@gmail.com', 'user1.png','anh123','Anh123', '1234 Quang Trung, Phường 10, Gò Vấp',1)

-- Insert DanhMuc
INSERT INTO DanhMuc VALUES 
	(N'Hoa cưới'),
	(N'Hoa khai trương'),
	(N'Hoa lễ'),
	(N'Hoa viếng'),
	(N'Hoa bó'),
	(N'Hoa kiểng'),
	(N'Cây dây leo'),
	(N'Cây phong thủy'),
	(N'Cây ăn quả'),
	(N'Cây kiểng'),
	(N'Bonsai')
GO

-- Insert SanPham
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Sắc Đỏ', 1, 'Sac-Do.jpg', 1300, 20, N'Loại hoa phù hợp cho tiệc cưới, đám lễ', 1, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Tươi Đẹp', 1, 'Tuoi-Dep.jpg', 1300, 20, N'Loại hoa phù hợp cho tiệc cưới, đám lễ', 1, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Tốt Lành', 1, 'The-Best-Day.jpg', 1300, 20, N'Loại hoa phù hợp cho tiệc cưới, đám lễ', 1, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Khai Trương', 1, 'Khai-Truong-Hong.jpg', 1300, 20, N'Loại hoa phù hợp cho việc khai trương', 2, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Tài Lộc', 1, 'Vung-Tien.jpg', 1300, 20, N'Loại hoa phù hợp cho việc khai trương', 2, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Lắng Đọng', 1, 'Lang-Dong.jpg', 1300, 20, N'Loại hoa phù hợp cho việc đám, tiệc chia buồn', 4, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Hoa Chia Xa', 1, 'Chia-Xa.jpg', 1300, 20, N'Loại hoa phù hợp cho việc đám, tiệc chia buồn', 4, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Nha Đam', 1, '1.jpg', 1300, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 8, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Tài Lộc', 1, '2.jpg', 1300, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 8, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Ngân Hậu', 1, '3.jpg', 1300, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 8, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Sen Đá', 1, '19.jpg', 1300, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 10, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Chà Là Canary', 1, '20.jpg', 1300, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 10, 0)
INSERT SanPham (TenSP ,TrangThai ,Anh ,Gia ,SLTonKho ,MoTa ,Id_DM, Is_Delete)
	VALUES (N'Cây Nhai Bách', 1, '21.jpg', 1300, 20, N'Loại cây cảnh phù hợp cho việc trang trí trong nhà lẫn ngoài vườn', 10, 0)

-- Insert DonDatHang
INSERT DonDatHang(NgayDat ,GhiChuKH ,TongTien, TrangThai, SoDT, DiaChi,ID_KH) 
	VALUES ('2022-03-30', N'Giao buổi chiều',2400, 1, '0985645231', '357 Lê Văn Thọ, Phường 9, Gò Vấp, TPHCM',1)
INSERT DonDatHang(NgayDat ,GhiChuKH ,TongTien, TrangThai, SoDT, DiaChi, ID_KH) 
	VALUES ('2022-03-31', N'Giao sớm nha má',2700, 0, '0977485234', '200 Đường 3/2, Phường 12, Quận 10, TPHCM', 2)
INSERT DonDatHang(NgayDat ,GhiChuKH ,TongTien, TrangThai, SoDT, DiaChi, ID_KH)
	VALUES ('2022-04-02', N'',2600, 1, '0884245251', '686 Trường Chinh, Phường 15, Tân Bình, TPHCM', 2)

-- Insert DonDatChiTiet
INSERT DonDatChiTiet(ID_DDH ,ID_SP, SoLuong ,TongTien ) VALUES ( 1, 1, 2, 2600 )
INSERT DonDatChiTiet(ID_DDH ,ID_SP, SoLuong ,TongTien ) VALUES ( 2, 2, 1, 1300 )
INSERT DonDatChiTiet(ID_DDH ,ID_SP, SoLuong ,TongTien ) VALUES ( 2, 3, 1, 1300 )

-- Insert Feedback
INSERT FeedBack (ID_KH , ID_SP ,DanhGia ,NoiDung ,NgayDang ) 
	VALUES (1, 1, 5, N'Chất lượng sản phẩm tốt', '2022-03-31')
INSERT FeedBack (ID_KH , ID_SP ,DanhGia ,NoiDung ,NgayDang ) 
	VALUES (2, 2, 3, N'Giao hàng lâu', '2022-04-15')



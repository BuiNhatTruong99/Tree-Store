package com.poly.dao;

import com.poly.model.DonDatChiTiet;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DonDatChiTietDAO extends JpaRepository<DonDatChiTiet, Integer> {
	@Query(value = "exec dbo.spsell ", nativeQuery = true)
	int chuatt();

	@Query(value = "select sum(ct.TongTien) from DonDatHang as dh join DonDatChiTiet ct \r\n"
			+ "on ct.ID_DDH = dh.ID_DDH where TrangThai like N'Đã giao' and MONTH(dh.NgayDat) = ?1"
			,nativeQuery = true)
	String tongtien(Integer time);

	// Doanh thu năm hiện tại theo tháng - Quốc Anh
	
	@Query(value = "select SUM(ct.TongTien) from DonDatHang as dh join DonDatChiTiet ct \r\n"
			+ "	on ct.ID_DDH = dh.ID_DDH where TrangThai like N'Đã giao' and MONTH(dh.NgayDat) = 1 "
			+ "and YEAR(dh.ngaydat) = ?1", nativeQuery = true)
	String thang1(int year);

	@Query(value = "select sum(ct.TongTien)  from DonDatHang as dh join DonDatChiTiet ct \r\n"
			+ "	on ct.ID_DDH = dh.ID_DDH where TrangThai like N'Đã giao' and MONTH(dh.NgayDat) = 2 "
			+ "and YEAR(dh.ngaydat) = ?1", nativeQuery = true)
	String thang2(int year);

	@Query(value = "select sum(ct.TongTien)  from DonDatHang as dh join DonDatChiTiet ct \r\n"
			+ "	on ct.ID_DDH = dh.ID_DDH where TrangThai like N'Đã giao' and MONTH(dh.NgayDat) = 3 "
			+ "and YEAR(dh.ngaydat) = ?1", nativeQuery = true)
	String thang3(int year);

	@Query(value = "select sum(ct.TongTien)  from DonDatHang as dh join DonDatChiTiet ct \r\n"
			+ "	on ct.ID_DDH = dh.ID_DDH where TrangThai like N'Đã giao' and MONTH(dh.NgayDat) = 4 "
			+ "and YEAR(dh.ngaydat) = ?1", nativeQuery = true)
	String thang4(int year);

	@Query(value = "select sum(ct.TongTien)  from DonDatHang as dh join DonDatChiTiet ct \r\n"
			+ "	on ct.ID_DDH = dh.ID_DDH where TrangThai like N'Đã giao' and MONTH(dh.NgayDat) = 5 "
			+ "and YEAR(dh.ngaydat) = ?1", nativeQuery = true)
	String thang5(int year);

	@Query(value = "select sum(ct.TongTien)  from DonDatHang as dh join DonDatChiTiet ct \r\n"
			+ "	on ct.ID_DDH = dh.ID_DDH where TrangThai like N'Đã giao' and MONTH(dh.NgayDat) = 6 "
			+ "and YEAR(dh.ngaydat) = ?1", nativeQuery = true)
	String thang6(int year);

	@Query(value = "select sum(ct.TongTien)  from DonDatHang as dh join DonDatChiTiet ct \r\n"
			+ "	on ct.ID_DDH = dh.ID_DDH where TrangThai like N'Đã giao' and MONTH(dh.NgayDat) = 7 "
			+ "and YEAR(dh.ngaydat) = ?1", nativeQuery = true)
	String thang7(int year);

	@Query(value = "select sum(ct.TongTien)  from DonDatHang as dh join DonDatChiTiet ct \r\n"
			+ "	on ct.ID_DDH = dh.ID_DDH where TrangThai like N'Đã giao' and MONTH(dh.NgayDat) = 8 "
			+ "and YEAR(dh.ngaydat) = ?1", nativeQuery = true)
	String thang8(int year);

	@Query(value = "select sum(ct.TongTien)  from DonDatHang as dh join DonDatChiTiet ct \r\n"
			+ "	on ct.ID_DDH = dh.ID_DDH where TrangThai like N'Đã giao' and MONTH(dh.NgayDat) = 9 "
			+ "and YEAR(dh.ngaydat) = ?1", nativeQuery = true)
	String thang9(int year);

	@Query(value = "select sum(ct.TongTien)  from DonDatHang as dh join DonDatChiTiet ct \r\n"
			+ "	on ct.ID_DDH = dh.ID_DDH where TrangThai like N'Đã giao' and MONTH(dh.NgayDat) = 10 "
			+ "and YEAR(dh.ngaydat) = ?1", nativeQuery = true)
	String thang10(int year);

	@Query(value = "select sum(ct.TongTien)  from DonDatHang as dh join DonDatChiTiet ct \r\n"
			+ "	on ct.ID_DDH = dh.ID_DDH where TrangThai like N'Đã giao' and MONTH(dh.NgayDat) = 12 "
			+ "and YEAR(dh.ngaydat) = ?1", nativeQuery = true)
	String thang11(int year);

	@Query(value = "select sum(ct.TongTien) from DonDatHang as dh join DonDatChiTiet ct \r\n"
			+ "	on ct.ID_DDH = dh.ID_DDH where TrangThai like N'Đã giao' and MONTH(dh.NgayDat) = 11 "
			+ "and YEAR(dh.ngaydat) = ?1", nativeQuery = true)
	String thang12(int year);

	
}

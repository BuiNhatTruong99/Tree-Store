package com.poly.dao;


import com.poly.model.Chart;
import com.poly.model.ChuaThanhToan;
import com.poly.model.DonDatHang;
import com.poly.model.Year;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DonDatHangDAO extends JpaRepository<DonDatHang, Integer> {
/*------------- Main ----------------*/
	@Query(value = "select * from DonDatHang as d where d.trangthai like N'Chờ xác nhận' "
			+ "and MONTH(NgayDat) = ?1 ",nativeQuery = true)
	List<DonDatHang> findnotdone(Integer time);
	
	@Query(value = "select count(*) from DonDatHang as d where d.trangthai like N'Đã giao'	and MONTH(NgayDat) = ?1",nativeQuery = true)
	int finddone(Integer time);
	
	@Query(value = "select TOP 1 * from DonDatHang order by ID_DDH DESC", nativeQuery = true)
	DonDatHang getIDTopLast();
	
	@Query(value = "select * from DonDatHang as d join NguoiDung as nd on d.ID_KH = nd.ID_KH"
			+ " where d.TrangThai like N'Đã giao'",nativeQuery = true)
	List<DonDatHang> done();
	
	@Query(value = "select * from DonDatHang as d join NguoiDung as nd on d.ID_KH = nd.ID_KH"
			+ " where d.TrangThai like N'Đang giao'",nativeQuery = true)
	List<DonDatHang> Notdone();
/*------------- Đơn Hàng ----------------*/
	@Query(value = "select * from DonDatHang as d join NguoiDung as nd on d.ID_KH = nd.ID_KH"
			+ " where d.TrangThai like N'Chờ xác nhận'",nativeQuery = true)
	List<DonDatHang> confirm();
	
	// chờ xác nhận
	@Query(value = "update DonDatHang set TrangThai = N'Chờ xác nhận' where ID_DDH = ?1",nativeQuery = true)
	List<DonDatHang> promote(Integer id);
	
	// đang giao
	@Query(value = "update DonDatHang set TrangThai = N'Đang giao' where ID_DDH = ?1",nativeQuery = true)
	List<DonDatHang> increase(Integer id);
	
	// đã giao
	@Query(value = "update DonDatHang set TrangThai = N'Đã giao' where ID_DDH = ?1",nativeQuery = true)
	List<DonDatHang> up(Integer id);
	
	// xoá đơn hàng
	@Query(value = "exec del ?1",nativeQuery = true)
	List<DonDatHang> del(Integer id);
	
/*------------- Thống kê ----------------*/
	// This query get all data from SQL to put into Chart
	@Query("SELECT new Chart(month(c.ngaydat), sum(c.tongtien), YEAR(c.ngaydat)) FROM DonDatHang c where YEAR(c.ngaydat) = ?1 GROUP BY month(c.ngaydat), year(c.ngaydat)")
	List<Chart> getValue(Integer year);

	// this query get all year from sql
	@Query("Select new Year(year(ngaydat)) from DonDatHang group by year(ngaydat)")
	List<Year> getYear();
}

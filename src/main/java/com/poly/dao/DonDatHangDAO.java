package com.poly.dao;


import com.poly.model.ChuaThanhToan;
import com.poly.model.DonDatHang;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DonDatHangDAO extends JpaRepository<DonDatHang, Integer> {
	// --------------- Quốc Anh -------------------
	@Query(value = "select * from DonDatHang as d where d.trangthai like N'Chờ xác nhận' "
			+ "and MONTH(NgayDat) = ?1 ",nativeQuery = true)
	List<DonDatHang> findnotdone(Integer time);
	
	@Query(value = "select * from DonDatHang as d where d.trangthai like N'Đã giao'	and MONTH(NgayDat) = ?1",nativeQuery = true)
	List<DonDatHang> finddone(Integer time);
	
	@Query(value = "select TOP 1 * from DonDatHang order by ID_DDH DESC", nativeQuery = true)
	DonDatHang getIDTopLast();

}

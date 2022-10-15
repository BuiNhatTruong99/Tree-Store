package com.poly.dao;

import com.poly.model.DonDatHang;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DonDatHangDAO extends JpaRepository<DonDatHang, Integer> {
	@Query(value = "select d from DonDatHang d where d.trangthai like 'Chờ xác nhận'")
	List<DonDatHang> waitforcfm();
	
	@Query(value = "select d from DonDatHang d where d.trangthai like 'Đã giao'")
	List<DonDatHang> delivered();
	
	@Query(value = "select TOP 1 * from DonDatHang order by ID_DDH DESC", nativeQuery = true)
	DonDatHang getIDTopLast();
}

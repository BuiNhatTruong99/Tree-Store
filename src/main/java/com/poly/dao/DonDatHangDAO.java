package com.poly.dao;

import com.poly.model.DonDatHang;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DonDatHangDAO extends JpaRepository<DonDatHang, Integer> {
	@Query(value = "select d from DonDatHang d where d.trangthai = 'Chờ xác nhận'")
	List<DonDatHang> waitforcfm();
	
	@Query(value = "select d from DonDatHang d where d.trangthai = 'Đã giao'")
	List<DonDatHang> delivered();
}

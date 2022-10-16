package com.poly.dao;

import java.util.List;

import com.poly.model.DanhMuc;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DanhMucDAO extends JpaRepository<DanhMuc, Integer> {
	// Lệnh query jpql tìm danh mục hoa
	@Query("SELECT c FROM DanhMuc c WHERE c.id_dm >= 1 AND c.id_dm <= 6")
	List<DanhMuc> findAllByFlower();
	
	// Lệnh query jpql tìm danh mục cây cảnh
	@Query("SELECT c FROM DanhMuc c WHERE c.id_dm >= 7 AND c.id_dm <= 11")
	List<DanhMuc> findAllByTree();
	
	@Query(value = "SELECT * FROM DanhMuc WHERE id_dm = (SELECT ID_DM FROM SanPham WHERE id_sp = ?1)", nativeQuery = true)
	DanhMuc findById_SP(int id_sp);
}

package com.poly.dao;

import java.util.List;

import com.poly.model.NguoiDung;
import com.poly.model.SanPham;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SanPhamDAO extends JpaRepository<SanPham, Integer> {
	// Lệnh query jpql tìm tất cả sản phẩm có danh mục bằng id danh mục
	@Query("SELECT p FROM SanPham p WHERE p.danhmuc.id_dm = ?1")
	List<SanPham> findAllByIdDM(Integer id_dm);
	
	@Query("SELECT p FROM SanPham p WHERE p.tensp = ?1 and p.gia = ?2")
	SanPham findByName(String tensp, double gia);
}

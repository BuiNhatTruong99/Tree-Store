package com.poly.dao;

import java.util.List;

import com.poly.model.NguoiDung;
import com.poly.model.SanPham;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

//---------- PHÂN TRANG ------------
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
// ------------- END ----------------

public interface SanPhamDAO extends JpaRepository<SanPham, Integer> {
	// Lệnh query jpql tìm tất cả sản phẩm có danh mục bằng id danh mục
	@Query("SELECT p FROM SanPham p WHERE p.danhmuc.id_dm = ?1")
	List<SanPham> findAllByIdDM(Integer id_dm);
	
	@Query("SELECT p FROM SanPham p WHERE p.tensp = ?1 and p.gia = ?2")
	SanPham findByName(String tensp, double gia);
	
	//------------------ TÌM SẢN PHẨM THEO TÊN -------------------
	@Query( "SELECT o FROM SanPham o WHERE o.tensp LIKE %?1%")
	List<SanPham> findSanPhamByName(String keywords);
	//------------------ END -------------------------------------
		
	//------------------ LỌC THEO GIÁ ----------------------------
	@Query("SELECT o FROM SanPham o WHERE o.gia BETWEEN ?1 AND ?2")
	List<SanPham> findByPrice(double min, double max);	
	//------------------ END -------------------------------------
	
}

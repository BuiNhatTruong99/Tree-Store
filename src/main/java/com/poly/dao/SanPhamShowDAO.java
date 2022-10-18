package com.poly.dao;

import com.poly.model.SanPhamShow;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface SanPhamShowDAO  extends JpaRepository<SanPhamShow, Integer> {
	@Query(value = "select * from SanPham where id_sp = ?1", nativeQuery = true)
	SanPhamShow findBy_Id_SP(int id);
}

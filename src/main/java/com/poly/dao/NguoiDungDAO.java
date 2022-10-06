package com.poly.dao;

import com.poly.model.NguoiDung;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface NguoiDungDAO extends JpaRepository<NguoiDung, Integer> {
	// Lệnh query jpql tìm người dùng bằng tên tài khoản
	@Query("SELECT u FROM NguoiDung u WHERE u.tentk = ?1")
	NguoiDung findUser(String taikhoan);
	
}

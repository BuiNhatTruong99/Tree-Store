package com.poly.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.poly.model.ChuaThanhToan;

public interface ChuaThanhToanDao extends JpaRepository<ChuaThanhToan, String> {
	@Query(value = "exec sp_xacnhan", nativeQuery = true)
	List<ChuaThanhToan> choxacnhan();
}

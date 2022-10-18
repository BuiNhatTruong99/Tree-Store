package com.poly.dao;

import com.poly.model.NguoiDungShow;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface NguoiDungShowDAO extends JpaRepository<NguoiDungShow, Integer> {
	@Query(value = "select * from NguoiDung where id_kh = ?1", nativeQuery = true)
	NguoiDungShow findBy_Id_KH(int id);
}

package com.poly.dao;

import com.poly.model.DanhGia;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DanhGiaDAO extends JpaRepository<DanhGia, Integer> {
	// --------------- Quốc Anh -------------------
	@Query(value = "select * from FeedBack where DanhGia >=4",nativeQuery = true)
	List<DanhGia> dgtot();
	
	@Query(value = "select * from FeedBack where DanhGia < 4",nativeQuery = true)
	List<DanhGia> dgxau();
	
	@Query(value = "select fb.DanhGia,fb.NoiDung,nd.HoTen from FeedBack as fb join NguoiDung as nd\r\n"
			+ "on fb.ID_KH = nd.ID_KH join DonDatChiTiet as ct\r\n"
			+ "on ct.ID_SP = fb.ID_SP",nativeQuery = true)
	List<DanhGia> feedbk();
}

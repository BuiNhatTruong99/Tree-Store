package com.poly.dao;

import com.poly.model.DonDatChiTiet;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DonDatChiTietDAO extends JpaRepository<DonDatChiTiet, Integer> {
	@Query(value ="exec dbo.spsell ",nativeQuery = true)
	int chuatt();
	
	@Query(value ="select SUM(tongtien) from DonDatChiTiet")
	int tongtien();
	
//	@Query(value = "select ct.ID_DDCT , nd.HoTen as HoTen, ct.SoLuong,ct.TongTien,dh.TrangThai \r\n"
//			+ "	from DonDatChiTiet as ct join DonDatHang as dh \r\n"
//			+ "	on ct.ID_DDH= dh.ID_DDH join NguoiDung as nd on nd.ID_KH = dh.ID_KH \r\n"
//			+ "	where dh.TrangThai = '1' ", nativeQuery = true)
//	List<DonDatChiTiet> chuatt();
}

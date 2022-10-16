package com.poly.dao;

import com.poly.model.Chart;
import com.poly.model.DonDatHang;
import com.poly.model.Year;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface DonDatHangDAO extends JpaRepository<DonDatHang, Integer> {
	// This query get all data from SQL to put into Chart
	@Query("SELECT new Chart(month(c.ngaydat), sum(c.tongtien), YEAR(c.ngaydat)) FROM DonDatHang c where YEAR(c.ngaydat) = ?1 GROUP BY month(c.ngaydat), year(c.ngaydat)")
	List<Chart> getValue(Integer year);

	// this query get all year from sql
	@Query("Select new Year(year(ngaydat)) from DonDatHang group by year(ngaydat)")
	List<Year> getYear();
}

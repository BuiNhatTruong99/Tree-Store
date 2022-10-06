package com.poly.model;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "dondatchitiet")
public class DonDatChiTiet {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id_ddct;
	int soluong;
	double tongtien;
	@ManyToOne
	@JoinColumn(name = "id_ddh")
	DonDatHang dondathang;
	@ManyToOne
	@JoinColumn(name = "id_sp")
	SanPham sanpham;
}

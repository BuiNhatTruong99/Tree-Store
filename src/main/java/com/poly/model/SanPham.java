package com.poly.model;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class SanPham {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id_sp;
	String tensp;
	boolean trangthai = true;
	String anh;
	double gia;
	int sltonkho;
	String mota;
	boolean is_delete = false;
	@ManyToOne
	@JoinColumn(name = "id_dm")
	DanhMuc danhmuc;
	@OneToMany(mappedBy = "sanpham")
	List<DonDatChiTiet> dondatchitiet;
	@OneToMany(mappedBy = "sanpham")
	List<DanhGia> danhgia;
}

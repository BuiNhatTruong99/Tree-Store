package com.poly.model;

import java.util.Date;
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
@Table(name = "nguoidung")
public class NguoiDung {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id_kh;
	String hoten;
	Date ngaysinh;
	boolean gioitinh;
	String sodt;
	String email;
	String anh;
	String tentk;
	String matkhau;
	String diachi;
	boolean vaitro = false;
	@OneToMany(mappedBy = "nguoidung")
	List<DonDatHang> dondathang;
	@OneToMany(mappedBy = "nguoidung")
	List<DanhGia> danhgia;
}

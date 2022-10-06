package com.poly.model;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "feedback")
public class DanhGia {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id_fb;
	float danhgia;
	String noidung;
	@Temporal(TemporalType.DATE)
	@Column(name = "ngaydang")
	Date ngaydang = new Date();
	@ManyToOne
	@JoinColumn(name = "id_kh")
	NguoiDung nguoidung;
	@ManyToOne
	@JoinColumn(name = "id_sp")
	SanPham sanpham;
}

package com.poly.model;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
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
@Table(name = "dondathang")
public class DonDatHang {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id_ddh;
	@Temporal(TemporalType.DATE)
	@Column(name = "ngaydat")
	Date ngaydat = new Date();
	String ghichukh;
	double tongtien;
	String trangthai;
	String sodt;
	String diachi;
	@ManyToOne
	@JoinColumn(name = "id_kh")
	NguoiDung nguoidung;
	@OneToMany(mappedBy = "dondathang")
	List<DonDatChiTiet> dondatchitiet;
}

package com.poly.model;

import java.util.Date;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class NguoiDungShow {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	int id_kh;
	String hoten;
	@DateTimeFormat(pattern =  "yyyy-MM-dd")
	Date ngaysinh;
	boolean gioitinh;
	String sodt;
	String email;
	String anh;
	String tentk;
	String matkhau;
	String diachi;
	boolean vaitro;
}

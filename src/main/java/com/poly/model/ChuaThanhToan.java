package com.poly.model;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Entity
@NoArgsConstructor
@AllArgsConstructor
public class ChuaThanhToan {
	@Id
	String hoten;
	int soluong;
	double tongtien;
	String trangthai;
}

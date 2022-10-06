package com.poly.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class MucGioHang {
	private Integer id;
	private String ten;
	private String anh;
	private double gia;
	private int soluong = 1;
}

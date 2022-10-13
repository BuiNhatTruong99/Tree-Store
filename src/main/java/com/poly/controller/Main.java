package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.DanhGiaDAO;
import com.poly.dao.DonDatChiTietDAO;
import com.poly.dao.DonDatHangDAO;
import com.poly.dao.NguoiDungDAO;
import com.poly.model.DanhGia;
import com.poly.model.DonDatChiTiet;
import com.poly.model.DonDatHang;
import com.poly.model.NguoiDung;

@Controller
public class Main {
	
	@Autowired
	NguoiDungDAO dao;
	@Autowired
	DonDatChiTietDAO dddao;
	@Autowired
	DanhGiaDAO dgdao;
	@Autowired
	DonDatHangDAO ddhdao;

	@GetMapping("/admin")
	public String AdminSP(Model model)
	{
		int nguoidung = dao.findAll().size();
		model.addAttribute("user",nguoidung);
		
		int dg = dgdao.findAll().size();
		model.addAttribute("danhgia",dg);
	
		int tongdh = dddao.chuatt();
		model.addAttribute("tongsanpham",tongdh);
//		System.out.println(tongdh);
		int tongtien = dddao.tongtien();
		model.addAttribute("tongtien",tongtien);
		
//		List<DonDatChiTiet> a = dddao.chuatt();
//		System.out.println(a);
//		
		int n = ddhdao.waitforcfm().size();
		model.addAttribute("xacnhan",n);
		int d = ddhdao.delivered().size();
		model.addAttribute("dagiao",d);
		
		return "/admin/admin";
	}
	
	
}

package com.poly.controller;

import com.poly.dao.DonDatChiTietDAO;
import com.poly.dao.DonDatHangDAO;
import com.poly.model.DonDatChiTiet;
import com.poly.model.DonDatHang;
import com.poly.service.ParamService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CheckoutController {
	@Autowired
	ParamService paramService;
	
	@PostMapping("/checkout")
	public String checkout(@ModelAttribute("donDH") DonDatHang donDH) {
		
		
		
		return "redirect:/trangchu";
	}
}

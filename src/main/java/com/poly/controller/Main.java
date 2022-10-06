package com.poly.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Main {
	
//	@GetMapping("/login")
//	public String getAcc()
//	{
//		return "/account/login";
//	}
//	@GetMapping("/product")
//	public String getSp()
//	{
//		return "/product/list-products";
//	}
//	@GetMapping("/product/detail")
//	public String getListSp()
//	{
//		return "/product/product-detail";
//	}
	@GetMapping("/admin")
	public String AdminSP()
	{
		return "/admin/admin";
	}
	@GetMapping("/admin/user")
	public String User()
	{
		return "/admin/user";
	}
	@GetMapping("/admin/product")
	public String MgSP()
	{
		return "/admin/product";
	}
}

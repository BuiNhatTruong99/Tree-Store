package com.poly.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.DanhGiaDAO;
import com.poly.dao.DonDatHangDAO;
import com.poly.model.DanhGia;
import com.poly.model.DonDatHang;


@Controller
public class OderController {

	@Autowired
	DanhGiaDAO dao;
	@Autowired
	DonDatHangDAO dhdao;
	
	@RequestMapping("/admin/order")
	public String order(Model model)
	{
		// đơn đã giao
		List<DonDatHang> done = dhdao.done();
		model.addAttribute("done",done);
		
		// đơn đang giao
		List<DonDatHang> notdone = dhdao.Notdone();
		model.addAttribute("notdone",notdone);
		
		// đơn chờ xác nhận
		List<DonDatHang> confirm = dhdao.confirm();
		model.addAttribute("confirm",confirm);
		
		
		return "/admin/order";
	}
	
	// đã giao
	@RequestMapping("/update/{id}")
	public String uptrangthai(@PathVariable("id") int id)
	{	
		try {
			dhdao.up(id);
			return "redirect:/admin/order";
		} catch (Exception e) {
			return "redirect:/admin/order";
		}
	}
	// đang giao
	@RequestMapping("/increase/{id}")
	public String intrangthai(@PathVariable("id") int id)
	{
		try {
			dhdao.increase(id);
			return "redirect:/admin/order";
		} catch (Exception e) {
			// TODO: handle exception
			return "redirect:/admin/order";
		}
	}
	// chờ xác nhận
	@RequestMapping("/promote/{id}")
	public String promotetrangthai(@PathVariable("id") int id)
	{
		try {
			dhdao.promote(id);
			return "redirect:/admin/order";
		} catch (Exception e) {
			return "redirect:/admin/order";
		}
	}
	// xoá đơn hàng
	@GetMapping("/delete/{id}")
	public String deletes(@PathVariable("id") int id)
	{
		try {
			dhdao.del(id);
			return "redirect:/admin/order";
		} catch (Exception e) {
			return "redirect:/admin/order";
		}
	}
}

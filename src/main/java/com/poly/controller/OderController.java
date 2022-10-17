package com.poly.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

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
import com.poly.service.SessionService;


@Controller
public class OderController {
	@Autowired
	SessionService session;
	@Autowired
	DanhGiaDAO dao;
	@Autowired
	DonDatHangDAO dhdao;
	
	@RequestMapping("/admin/order")
	public String order(Model model, HttpServletRequest request)
	{
		session.set("uri-user", request.getRequestURI());
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
		String uri = session.get("uri-user");
		
		System.out.println(uri);
		if (uri.contains("/order")) {
			try {
				dhdao.increase(id);
				return "redirect:/admin/order";
			} catch (Exception e) {
				// TODO: handle exception
				return "redirect:/admin/order";
			}
		}else {
			try {
				dhdao.increase(id);
				return "redirect:/admin";
			} catch (Exception e) {
				// TODO: handle exception
				return "redirect:/admin";
			}
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
		String uri = session.get("uri-user");
		
		if (uri.contains("/order")) {
			try {
				dhdao.del(id);
				return "redirect:/admin/order";
			} catch (Exception e) {
				return "redirect:/admin/order";
			}
		}else {
			try {
				dhdao.del(id);
				return "redirect:/admin/order";
			} catch (Exception e) {
				return "redirect:/admin/order";
			}
		}
	}
}

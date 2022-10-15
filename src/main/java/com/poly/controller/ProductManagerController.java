package com.poly.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.DanhMucDAO;
import com.poly.dao.SanPhamDAO;
import com.poly.model.DanhMuc;
import com.poly.model.SanPham;

@Controller
public class ProductManagerController {

	@Autowired
	SanPhamDAO dao;
	@Autowired
	DanhMucDAO dmDAO;
	
	

	
	@RequestMapping("/admin/product")
	public String MgSP(Model model)
	{
		List<SanPham> sanphams = getListSanPham();
		model.addAttribute("sp",sanphams);
		SanPham sanpham = new SanPham();
		model.addAttribute("sanpham",sanpham);
		
		return "/admin/product";
	}
	@RequestMapping("/admin/product/edit/{id}")
	public String findid(Model model, @PathVariable("id") int id)
	{
		SanPham sp = dao.findById(id).get();
		model.addAttribute("sanpham",sp);
		
		return "/admin/product";
	}
	@PostMapping("/add")
	public String addSP(SanPham sanpham,HttpServletRequest req)
	{
		String dm = req.getParameter("dm");
		System.out.println(dm);	
		
			dao.save(sanpham);
		
		
//		System.out.println(sanpham.getDanhmuc());
		return "redirect:/admin/product";
	}
	@GetMapping("/admin/product/delete/{id}")
	public String deleteSP(@PathVariable("id") Integer id)
	{
		
		dao.deleteById(id);
		return "redirect:/admin/product";
	}
	
	public List<SanPham> getListSanPham()
	{
		return dao.findAll();
	}

	@ModelAttribute("danhmuc")
	public List<DanhMuc> getListDanhMuc()
	{
		return dmDAO.findAll();
	}
	
}

package com.poly.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.poly.dao.NguoiDungDAO;
import com.poly.model.NguoiDung;

@Controller
public class UserManagerController {
	
	@Autowired
	NguoiDungDAO dao;
	
	@RequestMapping("/admin/user")
	public String User(Model model)
	{
		List<NguoiDung> user = getalllist();
		model.addAttribute("user",user);
		NguoiDung nd = new NguoiDung();
		model.addAttribute("nguoidung",nd);
		
		
		return "/admin/user";
	}
	
	@RequestMapping("/add_user")
	public String add(NguoiDung nguoidung)
	{
		
		dao.save(nguoidung);
		
		return "redirect:/admin/user";
	}
	
	@PostMapping("/admin/user/update")
	public String update(NguoiDung nd)
	{
		dao.save(nd);
		
		
		return "redirect:/admin/user";
	}
	@GetMapping("/admin/user/delete/{id}")
	public String delete(Model model,@PathVariable("id") int id)
	{
		dao.deleteById(id);
		
		
		return "redirect:/admin/user";
	}
	@GetMapping("/admin/user/edit/{id}")
	public String find(Model model,@PathVariable("id") int id)
	{
		
		NguoiDung nd = dao.findById(id).get();
		model.addAttribute("nguoidung",nd);

		return "redirect:/admin/user";
	}
	
	public List<NguoiDung> getalllist()
	{
		return dao.findAll();
	}
	
}

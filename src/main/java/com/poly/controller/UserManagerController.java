package com.poly.controller;

import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.MimeTypeUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.poly.dao.NguoiDungDAO;
import com.poly.dao.NguoiDungShowDAO;
import com.poly.model.NguoiDung;
import com.poly.model.NguoiDungShow;
import com.poly.service.ParamService;

@Controller
public class UserManagerController {
	@Autowired
	ParamService param;
	@Autowired
	NguoiDungDAO dao;
	@Autowired
	NguoiDungShowDAO ndsDAO;
	
	@RequestMapping("/admin/user")
	public String User(Model model)
	{
		List<NguoiDung> user = getAllNguoiDung();
		model.addAttribute("listnd",user);
		NguoiDung nd = new NguoiDung();
		model.addAttribute("nguoidung",nd);
		
		return "/admin/user";
	}
	
	@PostMapping("/admin/user/create")
	public String addUser(@RequestParam("ngaysinh") Date ngaysinh,
					      @RequestParam(required = true, name = "gender") boolean gioitinh,
						  @RequestParam(required = false, name = "rule") boolean vaitro,
						  @RequestParam("anh") MultipartFile attach) throws IOException
	{
		NguoiDung nd = new NguoiDung();
		String fileName;
		try {
			fileName = param.saveImage(attach, "images/user");
		} catch (Exception e) {
			fileName = "imguser_default.jpg";
		}
		nd.setHoten(param.getString("hoten", ""));
		nd.setNgaysinh(ngaysinh);
		nd.setGioitinh(gioitinh);
		nd.setSodt(param.getString("sodt", "").trim());
		nd.setEmail(param.getString("email", ""));
		nd.setDiachi(param.getString("diachi", ""));
		nd.setTentk(param.getString("taikhoan", ""));
		nd.setMatkhau(param.getString("matkhau", ""));
		nd.setVaitro(vaitro);
		nd.setAnh(fileName);
		
		dao.save(nd);
		
		return "redirect:/admin/user";
	}

	@RequestMapping(value = "/admin/user/edit/{id}", method = RequestMethod.GET, produces = MimeTypeUtils.APPLICATION_JSON_VALUE)
	public ResponseEntity<NguoiDungShow> find(@PathVariable("id") int id)
	{
		// Show thông tin người dùng
		NguoiDungShow nd = ndsDAO.findBy_Id_KH(id);
		try {
			return new ResponseEntity<NguoiDungShow>(nd, HttpStatus.OK);
		} catch (Exception e) {
			return new ResponseEntity<NguoiDungShow>(HttpStatus.BAD_REQUEST);
		}
	}
	
	@PostMapping("/admin/user/update")
	public String updateUser(HttpServletRequest request,
							 @RequestParam("ngaysinh") Date ngaysinh,
					         @RequestParam(required = true, name = "gender") boolean gioitinh,
						     @RequestParam(required = false, name = "rule") boolean vaitro,
						     @RequestParam("anh") MultipartFile attach) throws IOException
	{
		int id = Integer.parseInt(request.getParameter("id"));
		NguoiDung nd = dao.findById(id).get();
		String fileName;
		try {
			fileName = param.saveImage(attach, "images/user");
		} catch (Exception e) {
			fileName = "imguser_default.jpg";
		};
		
		nd.setHoten(param.getString("hoten", ""));
		
		nd.setNgaysinh(ngaysinh);
		nd.setGioitinh(gioitinh);
		nd.setSodt(param.getString("sodt", "").trim());
		nd.setEmail(param.getString("email", ""));
		nd.setDiachi(param.getString("diachi", ""));
		nd.setTentk(param.getString("taikhoan", ""));
		nd.setMatkhau(param.getString("matkhau", ""));
		nd.setVaitro(vaitro);
		nd.setAnh(fileName);
		
		dao.save(nd);
		
		return "redirect:/admin/user";
	}
	
	@GetMapping("/admin/user/delete/{id}")
	public String delete(Model model,@PathVariable("id") int id)
	{
		dao.deleteById(id);
		return "redirect:/admin/user";
	}
	
	public List<NguoiDung> getAllNguoiDung()
	{
		return dao.findAll();
	}
	
}

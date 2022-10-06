package com.poly.controller;

import java.util.List;
import java.util.Optional;

import com.poly.dao.SanPhamDAO;
import com.poly.model.MucGioHang;
import com.poly.model.SanPham;
import com.poly.service.SessionService;
import com.poly.shopping.CartService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CartController {
	@Autowired
	CartService cartService;
	@Autowired
	SessionService sessionService;
	@Autowired
	SanPhamDAO spDAO;
	
// ---- KHÔNG CÓ TRANG GIỎ HÀNG .JSP ----
//	@RequestMapping("/giohang")
//	public String getGioHang(Model model) {
//		// Hiển thị tất cả sản phẩm đã chọn trong giỏ hàng
//		model.addAttribute("cart", cartService.getAllItems());
//		// Hiển thị số lượng sản phẩm có trong giỏ hàng
//		model.addAttribute("total", cartService.getCount());
//		return "redirect:/cart";
//	}
	
	@RequestMapping("/giohang/them/{id}")
	public String themVaoGio(@PathVariable("id") Integer id) {
		// Tìm sản phẩm bằng id	
		SanPham sanpham = spDAO.findById(id).get();
		if (sanpham != null) {
			// Set các giá trị sản phẩm vào item trong giỏ hàng
			MucGioHang item = new MucGioHang();
			item.setId(sanpham.getId_sp());
			item.setTen(sanpham.getTensp());
			item.setAnh(sanpham.getAnh());
			item.setGia(sanpham.getGia());
			item.setSoluong(1);
			
			// Thêm item vào giỏ hàng
			cartService.add(item);
		}
		
		return "redirect:/ds-sanpham";
	}
	
	@RequestMapping("/giohang/capnhat/{id}")
	public String update(@PathVariable("id") Integer id, @RequestParam("soluong") Integer qty) {
		cartService.update(id, qty);
		System.out.println(qty);
		return "redirect:/ds-sanpham";// hiển thị giỏ hàng
	}
	
	@RequestMapping("/giohang/xoa/{id}")
	public String remove(@PathVariable("id") Integer id) {
		// Xóa sản phẩm trong giỏ hàng bằng id
		cartService.remove(id);
		return "redirect:/ds-sanpham";// hiển thị giỏ hàng
	}

	@RequestMapping("/giohang/clear")
	public String clear() {
		// Làm trống giỏ hàng (Xóa sạch tất cả sản phẩm đã chọn trong giỏ hàng)
		cartService.clear();
		return "redirect:/ds-sanpham";
	}
	
}

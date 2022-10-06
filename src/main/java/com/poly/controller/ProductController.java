package com.poly.controller;

import java.util.Collection;
import java.util.List;

import com.poly.dao.DanhMucDAO;
import com.poly.dao.SanPhamDAO;
import com.poly.model.DanhMuc;
import com.poly.model.MucGioHang;
import com.poly.model.SanPham;
import com.poly.shopping.CartService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ProductController {
	@Autowired
	DanhMucDAO dmDAO;
	@Autowired
	SanPhamDAO spDAO;
	@Autowired
	CartService cartService;
	
	@RequestMapping("/trangchu")
	public String getTrangChu(Model model)
	{
		hienThiGioHang(model);
		return "/index";
	}
	
	@RequestMapping("/ds-sanpham")
	public String getDsSanPham(Model model)
	{
		hienThiGioHang(model);
		// Hiển thị tất cả sản phẩm trong dữ liệu
		List<SanPham> dssanpham = getListSanPham();
		model.addAttribute("dssanpham", dssanpham);
		return "/product/list-products";
	}
	
	@RequestMapping("/ds-sanpham/id_dm={id}")
	public String locSPTheoDS(@PathVariable("id") Integer id_dm, Model model)
	{
		hienThiGioHang(model);
		// Hiển thị tất cả sản phẩm theo id danh mục
		List<SanPham> dssanpham = getListSanPham_TheoDM(id_dm);
		model.addAttribute("dssanpham", dssanpham);
		return "/product/list-products";
	}
	
	@RequestMapping("/sanpham/id_sp={id}")
	public String sanPhamChiTiet(@PathVariable("id") Integer id_sp, Model model)
	{
		hienThiGioHang(model);
		// Lấy 1 sản phẩm từ danh sách sản phẩm bằng id
		for (int i = 0; i < getListSanPham().size(); i++) {
			if (getListSanPham().get(i).getId_sp() == id_sp) {
				SanPham sanpham = getListSanPham().get(i);
				model.addAttribute("spchitiet", sanpham);
//				if (cart.getCount() != 0) {
//					model.addAttribute("tongGio", cart.getCount());
//				} else {
//					model.addAttribute("tongGio", 0);
//				}
			}
		}
		return "/product/product-detail";
	}
	
	public void hienThiGioHang(Model model) {
		// Hiển thị tất cả sản phẩm đã chọn trong giỏ hàng
		Collection<MucGioHang> cartItems = cartService.getAllItems();
		model.addAttribute("cart", cartItems);
		// Hiển thị số lượng sản phẩm có trong giỏ hàng
		model.addAttribute("total", cartService.getCount());
		// Hiển thị tổng tiền tất cả sản phẩm trong giỏ hàng
		model.addAttribute("totalAmount", cartService.getAmount());
	}
	
	// Lấy tất cả dữ liệu trong DanhMuc
	@ModelAttribute("ListDM")
	public List<DanhMuc> getListDanhMuc()
	{
		return dmDAO.findAll();
	}
	
	// Lấy tất cả dữ liệu trong SanPham
	public List<SanPham> getListSanPham()
	{
		return spDAO.findAll();
	}
	
	// Lấy tất cả dữ liệu trong SanPham
	public List<SanPham> getListSanPham_TheoDM(Integer id)
	{
		return spDAO.findAllByIdDM(id);
	}
}

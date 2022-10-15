package com.poly.controller;

import java.util.Collection;
import java.util.List;

import com.poly.dao.DanhMucDAO;
import com.poly.dao.SanPhamDAO;
import com.poly.model.DanhMuc;
import com.poly.model.MucGioHang;
import com.poly.model.SanPham;
import com.poly.service.ParamService;
import com.poly.shopping.CartService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class ProductController {
	@Autowired
	DanhMucDAO dmDAO;
	@Autowired
	SanPhamDAO spDAO;
	@Autowired
	CartService cartService;
	@Autowired
	ParamService paramService;
	
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
		
		int update_soluong = paramService.getInt("update_soluong", 1);
		System.out.println(update_soluong);
	}
	
	// ------------------------ TÌM THEO TÊN SP ------------------------------
	@PostMapping("/search/keywords={tensp}")
	public String search(@PathVariable("tensp") String keywords, Model model) {
		hienThiGioHang(model);
		
		String search = paramService.getString("tensp", "");
		List<SanPham> searchsp = spDAO.findSanPhamByName(keywords);
		model.addAttribute("searchsp", search);
		model.addAttribute("dssanpham", searchsp);
		
		return "/product/list-products";
	}
	// ------------------------- END TÌM TÊN SP---------------------------------

	// ------------------------ LỌC THEO GIÁ ----------------------------------
	@PostMapping("/search/price")
	public String searchGia(Model model, @RequestParam("price") double price ) {
		hienThiGioHang(model);
		
		try {
			List<SanPham> sr_price = null;
			if (price == 1) {
				model.addAttribute("price", price);
				sr_price = spDAO.findByPrice(0, 499);
			} else if (price == 2) {
				model.addAttribute("price", price);
				sr_price = spDAO.findByPrice(500, 999);
			} else if (price == 3) {
				model.addAttribute("price", price);
				sr_price = spDAO.findByPrice(1000, 1499);
			} else if (price == 4) {
				model.addAttribute("price", price);
				sr_price = spDAO.findByPrice(1500, 1999);
			} else if (price == 5) {
				model.addAttribute("price", price);
				sr_price = spDAO.findByPrice(2000, 3000);
			}		

			model.addAttribute("sr_price", sr_price);
			model.addAttribute("dssanpham",sr_price);			
		} catch (Exception e) {
			e.printStackTrace();
		}

		return "/product/list-products";
	}
	// ----------------------- END LỌC THEO GIÁ ---------------------------------
	
	// Lấy tất cả dữ liệu trong DanhMuc
	@ModelAttribute("DM_CayCanh")
	public List<DanhMuc> getListCayCanh()
	{
		return dmDAO.findAllByTree();
	}

	// Lấy tất cả dữ liệu trong DanhMuc
	@ModelAttribute("DM_Hoa")
	public List<DanhMuc> getListHoa()
	{
		return dmDAO.findAllByFlower();
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

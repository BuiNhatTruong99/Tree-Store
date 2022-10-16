package com.poly.controller;

import com.poly.dao.DonDatChiTietDAO;
import com.poly.dao.DonDatHangDAO;
import com.poly.dao.SanPhamDAO;
import com.poly.model.DonDatChiTiet;
import com.poly.model.DonDatHang;
import com.poly.model.MailInfo;
import com.poly.model.MucGioHang;
import com.poly.model.NguoiDung;
import com.poly.model.SanPham;
import com.poly.service.CartServiceImpl;
import com.poly.service.MailerService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class CheckoutController {
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	SanPhamDAO spDAO;
	@Autowired
	DonDatHangDAO dondhDAO;
	@Autowired
	DonDatChiTietDAO donctDAO;
	@Autowired
	CartServiceImpl cart;
	
	//----------------------- Mail ----------------------------
	@Autowired
	MailerService sendmail;
	
	// ---------------------- End -----------------------------
	
	@PostMapping("/checkout")
	public String checkout(@ModelAttribute("donDH") DonDatHang donDH) {
		// Lấy dữ liệu từ form thanh toán rồi lưu vào bảng
		NguoiDung nd = sessionService.get("user");
		
		donDH.setNguoidung(nd);		
		double tongTien = cart.getAmount() + (cart.getAmount() * 10 / 100);
		donDH.setTongtien(tongTien);
		donDH.setTrangthai("Chờ xác nhận");
		
		// Lưu vào đơn đặt hàng
		dondhDAO.save(donDH);
		
		// Lưu vào đơn hàng chi tiết
		saveDonDat();
		
		//------------------- Mail -----------------
		try {
			MailInfo mail = new MailInfo();
			mail.setFrom("truongbnps19317@fpt.edu.vn");
			mail.setTo("ngocchbps19105@fpt.edu.vn");
			mail.setSubject("Thông báo từ Tree Store");
			mail.setBody("Quý khách vui lòng kiểm tra đơn hàng và thời gian nhận hàng");
			
			sendmail.send(mail);
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		//------------------- End ------------------
		
		cart.clear();
		
		return "redirect:/trangchu";
	}
	
	private void saveDonDat() {
		DonDatHang dondh = dondhDAO.getIDTopLast();
		for (MucGioHang itemCart : cart.getAllItems()) {
			SanPham sp = spDAO.findByName(itemCart.getTen(), itemCart.getGia());
			DonDatChiTiet donct = new DonDatChiTiet();
			donct.setSoluong(itemCart.getSoluong());
			donct.setTongtien(itemCart.getSoluong() * itemCart.getGia());
			donct.setDondathang(dondh);
			donct.setSanpham(sp);
			
			donctDAO.save(donct);

		}
	}
	
}

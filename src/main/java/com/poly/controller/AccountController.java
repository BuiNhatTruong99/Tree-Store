package com.poly.controller;

import javax.servlet.http.HttpServletRequest;

import com.poly.dao.NguoiDungDAO;
import com.poly.model.NguoiDung;
import com.poly.service.CookieService;
import com.poly.service.ParamService;
import com.poly.service.SessionService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AccountController {
	@Autowired
	CookieService cookieService;
	@Autowired
	ParamService paramService;
	@Autowired
	SessionService sessionService;
	@Autowired
	HttpServletRequest request;
	@Autowired
	NguoiDungDAO ndDAO;
	
	@RequestMapping("/login")
	public String getLogin() {
		return "/account/login";
	}
	
	@SuppressWarnings("unused")
	@PostMapping("/login")
	public String login(@RequestParam(required = false, name = "remember") boolean rem) {
		String message = "";
		
		// Đọc các tham số từ form login (username, password, remember)
		String username = paramService.getString("your_name", "");
		String password = paramService.getString("your_pass", "");
		
		// So khớp thông tin đăng nhập với dữ liệu hệ thống 
		NguoiDung user = ndDAO.findUser(username);
		String userT = user.getTentk();
		String passT = user.getMatkhau();
		
		// nếu tìm được người dùng có trong hệ thống thì đăng nhập thành công
		if (user != null) {
			if (userT.equals(username) && passT.equals(password)) {
				// Set tên người dùng vào cookie lưu giữ 1 ngày
				sessionService.set("user", user);
				
				// Ghi nhớ tài khoản vào cookie lưu giữ 1 ngày khi check remember
				if (rem) {
					cookieService.add("taikhoan", user.getTentk(), 1);
					cookieService.add("matkhau", user.getMatkhau(), 1);
				}else {
					cookieService.remove("taikhoan");
					cookieService.remove("matkhau");
				}
				
				String uri = sessionService.get("security-uri");
				if (uri != null) {
					return "redirect:" + uri; 
				}else {
					return "redirect:/trangchu";
				}
			}else {
				message = "Tài khoản hoặc mật khẩu không đúng!";
				request.setAttribute("message", message);
				return "/account/login";
			}
		}else {
			message = "Tài khoản này không tồn tại. Vui lòng bạn kéo lên để đăng ký!";
			request.setAttribute("message", message);
			return "/account/login";
		}
		
	}
	
	@PostMapping("/register")
	public String register(@RequestParam(required = false, name = "agree") boolean chkAgree, NguoiDung nd) {
		// Đọc các tham số từ form sign up (username, email, password, repeat pass, check agree)
		String re_pass = paramService.getString("re_pass", "");
		// Kiểm tra đồng ý các điều khoản
		if (chkAgree) {
			if (nd.getMatkhau().equals(re_pass)) {
				ndDAO.save(nd);
				request.setAttribute("messageS", "Đăng ký thành công bạn có thể đăng nhập ngay bây giờ!");

			}else {
				request.setAttribute("messageS", "Mật khẩu và nhập lại mật khẩu không trùng khớp!");
			}
		}else {
			request.setAttribute("messageS", "Bạn chưa đồng ý với các điều khoản mà chúng tôi đưa ra!");
		}
		return "/account/login";
	}
	
	@RequestMapping("/logout")
	public String getLogout() {
		sessionService.remove("user");
		String taikhoanRmb = cookieService.getValue("taikhoan");
		String matkhauRmb = cookieService.getValue("matkhau");
		System.out.println(taikhoanRmb);
		System.out.println(matkhauRmb);
		request.setAttribute("taikhoanLuu", taikhoanRmb);
		request.setAttribute("matkhauLuu", matkhauRmb);
		
		return "redirect:/login";
	}
}

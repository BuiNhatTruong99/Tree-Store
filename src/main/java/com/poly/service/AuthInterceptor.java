package com.poly.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.model.NguoiDung;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;

@Service
public class AuthInterceptor implements HandlerInterceptor {
	@Autowired
	SessionService session;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// Lấy dừng dẫn sau local
		String uri = request.getRequestURI();
		// Lấy người dùng từ session
		NguoiDung nd = session.get("user");
		
		String error = "";
		
		if (nd == null) {										 // Nếu người dùng chưa đăng nhập
			error = "Vui lòng đăng nhập!";
		} else if (!nd.isVaitro() && uri.startsWith("/admin")) { // Nếu người dùng ko phải admin
			error = "Truy cập bị từ chối!";
		}
		
		if (error.length() > 0) {	// Nếu có lỗi
			session.set("security-uri", uri);
			System.out.println("Auth - uri " + uri);
			// Chuyển tới đường dẫn
			response.sendRedirect("/login?error=" + error);
			
			return false;
		}
		
		return true;
	}
}

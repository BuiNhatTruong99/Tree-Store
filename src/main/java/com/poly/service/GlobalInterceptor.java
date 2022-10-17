package com.poly.service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.poly.dao.DanhMucDAO;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.ModelAndView;

@Service
public class GlobalInterceptor implements HandlerInterceptor {
	@Autowired
	DanhMucDAO dmDAO;
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response,Object handler) 
										throws Exception {
		request.setAttribute("uri", request.getRequestURI());
		return true;
	}
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		request.setAttribute("DM_Cay", dmDAO.findAllByTree());
		request.setAttribute("DM_Hoa", dmDAO.findAllByFlower());
	}
}

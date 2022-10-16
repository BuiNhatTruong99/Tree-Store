package com.poly.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.poly.dao.DonDatHangDAO;
import com.poly.model.Chart;
import com.poly.model.Year;

@Controller
public class ChartController {
	@Autowired
	DonDatHangDAO dao;

	@RequestMapping("/admin/statistical") // Filter data group by year
	public String chart(Model model, HttpServletRequest request) {
		int value;
		String year = request.getParameter("year");
		if(year != null) {
			value = Integer.parseInt(year);
		} else {
			value = 2022;
		}

		System.out.println(year);
		List<Chart> list = dao.getValue(value);
		model.addAttribute("value", list);
		return "/admin/thongke";
	}

	@ModelAttribute("years") // Get all year put into select box
	public List<Year> getYear() {
		return dao.getYear();
	}
}

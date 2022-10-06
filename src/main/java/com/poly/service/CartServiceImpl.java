package com.poly.service;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

import com.poly.model.MucGioHang;
import com.poly.shopping.CartService;

import org.springframework.stereotype.Service;
import org.springframework.web.context.annotation.SessionScope;

@SessionScope
@Service
public class CartServiceImpl implements CartService {
	Map<Integer, MucGioHang> maps = new HashMap<>();
	
	@Override
	public void add(MucGioHang item) 
	{
		// Lấy item trong map bằng id
		MucGioHang cartItem = maps.get(item.getId());
		
		// Nếu trong giỏ hàng không có sản phẩm đó thì thêm mới vào maps
		if (cartItem == null) {
			maps.put(item.getId(), item);
		}else {
			// Ngược lại nếu đã tồn tại sản phẩm đó trong giỏ thì sẽ lấy (số lượng có trong giỏ + 1)
			cartItem.setSoluong(cartItem.getSoluong() + 1);
		}
	}
	
	@Override
	public MucGioHang update(int id, int soluong) 
	{
		// Cập nhật số lương trong giỏ hàng
		MucGioHang cartItem = maps.get(id);
		cartItem.setSoluong(soluong);
		return cartItem;
	}
	
	@Override
	public void remove(int id) 
	{
		maps.remove(id);
	}
	
	@Override
	public void clear() {
		maps.clear();
	}
	
	// Lấy tất cả sản phẩm trong maps để hiển thị trong giỏ hàng
	@Override
	public Collection<MucGioHang> getAllItems() {
		return maps.values();
	}
	
	// Tính tổng số lượng sản phẩm có trong giỏ hàng
	@Override
	public int getCount() {
		int count = 0;
		if (maps.size() == 0) {
			count = 0;
		} else {
			count = maps.size();
		}
		return count;
	}
	
	// Tính tổng giá trong giỏ hàng gồm: tổng giá * tổng số lượng (sử dụng Lamda thay vì for)
	@Override
	public double getAmount() {
		return maps.values().stream().mapToDouble(item -> item.getSoluong() * item.getGia()).sum();
	}
}

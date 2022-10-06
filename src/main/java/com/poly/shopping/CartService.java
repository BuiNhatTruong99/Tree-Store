package com.poly.shopping;

import java.util.Collection;

import com.poly.model.MucGioHang;

public interface CartService {
	// Định nghĩa các hàm trong CartServiceImpl
	
	/*
	 * Thêm item vào giỏ hàng hoặc tăng số lượng +1 nếu không tồn tại
	 * @param item là sản phẩm cần thêm vào giỏ hàng
	 */
	void add(MucGioHang item);
	
	/*
	 * Tăng hoặc giảm số lượng của item có trong giỏ hàng
	 * @param1 id là id của item cần thay đổi số lượng
	 * @param2 soluong là số lượng đã chỉnh sửa cho item đó
	 * return trả về CartItem đã được cập nhật số lượng
	 */
	MucGioHang update(int id, int soluong);
	
	/*
	 * Xóa một item trong giỏ hàng dựa vào id
	 * @param id là id của item cần xóa
	 */
	void remove(int id);

	/*
	 * Xóa sạch tất cả item trong giỏ hàng (làm trống maps)
	 */
	void clear();

	/*
	 * Lấy tất cả item trong giỏ hàng
	 */
	Collection<MucGioHang> getAllItems();
	
	/**
	* Lấy tổng số lượng các item trong giỏ hàng
	*/
	int getCount();
	
	/*
	 * Lấy tổng tiền của tất cả item trong giỏ hàng
	 */
	double getAmount();
}

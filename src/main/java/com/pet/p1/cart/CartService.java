package com.pet.p1.cart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.p1.member.MemberVO;

@Service
public class CartService {
	@Autowired
	private CartDAO cartDAO;
	
	public List<CartVO> cartList(MemberVO memberVO) throws Exception{
		return cartDAO.cartList(memberVO);
	}
	
	public int cartDelete(List<Long> list) throws Exception{
		return cartDAO.cartDelete(list);
	}
}

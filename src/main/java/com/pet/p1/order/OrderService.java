package com.pet.p1.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.p1.member.MemberVO;

@Service
public class OrderService {

		@Autowired
		private OrderDAO orderDAO;
		
		public int orderCart(OrderVO orderVO) throws Exception{
			return orderDAO.orderCart(orderVO);
		}
		
		public OrderVO orderSelectOne(MemberVO memberVO)throws Exception{
			return orderDAO.orderSelectOne(memberVO);
		}
}

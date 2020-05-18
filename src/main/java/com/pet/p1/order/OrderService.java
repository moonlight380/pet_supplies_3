package com.pet.p1.order;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {

		@Autowired
		private OrderDAO orderDAO;
		
		public int orderCart(OrderVO orderVO) throws Exception{
			return orderDAO.orderCart(orderVO);
		}
}

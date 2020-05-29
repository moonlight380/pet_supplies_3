package com.pet.p1.order;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.p1.member.MemberVO;
import com.pet.p1.orderInfo.OrderInfoVO;

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
		public int orderInfoInsert(OrderInfoVO orderInfoVO)throws Exception{
			return orderDAO.orderInfoInsert(orderInfoVO);
		}
		
		public List<OrderInfoVO> orderInfoList(MemberVO memberVO)throws Exception{
			
			
			memberVO.makeRow();
			long totalCount = orderDAO.orderInfoCount(memberVO);
			memberVO.makePage(totalCount);
			return orderDAO.orderInfoList(memberVO);
		}
		
		public List<OrderInfoVO> aorderList(MemberVO memberVO)throws Exception{
			return orderDAO.aorderList(memberVO);
		}
		
		public int adminUpdate(OrderInfoVO orderInfoVO)throws Exception{
			return orderDAO.adminUpdate(orderInfoVO);
		}
		
		public List<OrderInfoVO> orderSelect(String id) throws Exception {
			
			return orderDAO.orderSelect(id);
		}
		
}

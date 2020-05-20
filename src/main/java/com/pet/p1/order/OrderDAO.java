package com.pet.p1.order;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.p1.member.MemberVO;

@Repository
public class OrderDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	
	private final String NAMESPACE="com.pet.p1.order.OrderDAO.";
	
	public int orderCart(OrderVO orderVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"orderCart", orderVO);
	}
	
	public OrderVO orderSelectOne(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"orderSelectOne",memberVO);
	}
	
}

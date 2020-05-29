package com.pet.p1.order;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.p1.member.MemberVO;
import com.pet.p1.orderInfo.OrderInfoVO;

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
	public int orderInfoInsert(OrderInfoVO orderInfoVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"orderInfoInsert",orderInfoVO);
	}
	
	public List<OrderInfoVO> orderInfoList(MemberVO memberVO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"orderInfoList",memberVO);
	}
	
	
	
	public long orderInfoCount(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"orderInfoCount",memberVO);
	}
	
	public List<OrderInfoVO> aorderList(MemberVO memberVO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"aorderList", memberVO);
	}
	
	public int adminUpdate(OrderInfoVO orderInfoVO)throws Exception{
		return sqlSession.update(NAMESPACE+"adminUpdate", orderInfoVO);
	}
	
	public Long aorderInfoCount()throws Exception{
		return sqlSession.selectOne(NAMESPACE+"aorderInfoCount");
	}
	
	//interceptor
		public List<OrderInfoVO> orderSelect(String id)throws Exception{
			return sqlSession.selectList(NAMESPACE+"orderSelect",id);
		}
}

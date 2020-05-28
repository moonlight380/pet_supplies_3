package com.pet.p1.cart;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.pet.p1.member.MemberVO;


@Repository
public class CartDAO {
	@Autowired
	private SqlSession sqlSessions;
	
	private final String NAMESPACE="com.pet.p1.cart.CartDAO.";
	
	public CartVO cartCheck(CartVO cartVO)throws Exception{
		return sqlSessions.selectOne(NAMESPACE+"cartCheck",cartVO);
	}
	
	public List<CartVO> cartSelect(List<Long> list) throws Exception{
		return sqlSessions.selectList(NAMESPACE+"cartSelect",list);
	}
	
	public List<CartVO> cartList(MemberVO memberVO) throws Exception{
		return sqlSessions.selectList(NAMESPACE+"cartList",memberVO);
	}
	
	public int cartDelete(List<Long> list) throws Exception{
		return sqlSessions.delete(NAMESPACE+"cartDelete", list);
	}
	
	public int cartUpdateP(Long cnum) throws Exception{
		return sqlSessions.update(NAMESPACE+"cartUpdateP",cnum);
	}
	public int cartUpdate(CartVO cartVO) throws Exception{
		return sqlSessions.update(NAMESPACE+"cartUpdate",cartVO);
	}
	
	public int cartInsert(CartVO cartVO)throws Exception{
		return sqlSessions.insert(NAMESPACE+"cartInsert",cartVO);
	}
	
	public long direct(MemberVO memberVO) throws Exception{
		return sqlSessions.selectOne(NAMESPACE+"direct",memberVO);
	}

}

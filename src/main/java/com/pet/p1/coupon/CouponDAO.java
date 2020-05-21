package com.pet.p1.coupon;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.p1.member.MemberVO;

@Repository
public class CouponDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.pet.p1.coupon.CouponDAO.";
	
	public List<CouponVO> couponList(MemberVO memberVO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"couponList",memberVO);
	}

}

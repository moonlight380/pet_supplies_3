package com.pet.p1.coupon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.pet.p1.member.MemberVO;

@Service
public class CouponService {
	
	@Autowired
	private CouponDAO couponDAO;
	
	public List<CouponVO> couponList(MemberVO memberVO)throws Exception{
		return couponDAO.couponList(memberVO);
	}
	
	public int coupon(MemberVO memberVO)throws Exception{
		return couponDAO.coupon(memberVO);
	}



}

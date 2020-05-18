package com.pet.p1.coupon;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.p1.member.MemberVO;

@Controller
@RequestMapping(value = "/coupon/**")
public class CouponController {
	
	@Autowired
	private CouponService couponService; 
	
	//-- coupon
	@PostMapping("couponList")
	public void couponList()throws Exception{
		
	}
	@GetMapping("couponList")
	public ModelAndView couponList( HttpSession session)throws Exception{
		 
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		System.out.println(memberVO.getId());
		List<CouponVO> ar = couponService.couponList(memberVO);
		System.out.println(ar);
		if(memberVO != null) {
			mv.addObject("coupon", ar);
		}
		return mv;
	}

}

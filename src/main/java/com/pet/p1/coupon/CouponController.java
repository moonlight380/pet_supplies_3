package com.pet.p1.coupon;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.pet.p1.cart.CartService;
import com.pet.p1.cart.CartVO;
import com.pet.p1.member.MemberVO;

@Controller
@RequestMapping(value = "/coupon/**")
public class CouponController {
	
	@Autowired
	private CouponService couponService; 
	@Autowired
	private CartService cartService; 
	
	//-- coupon
	@PostMapping("couponList")
	public void couponList()throws Exception{
		
	}
	@GetMapping("couponList")
	public ModelAndView couponList( HttpSession session)throws Exception{
		 
		ModelAndView mv = new ModelAndView();
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		List<CouponVO> ar = couponService.couponList(memberVO);
		List<CartVO> ar1 = cartService.cartList(memberVO);
		System.out.println(ar);
		System.out.println(ar1);
		if(memberVO != null) {
			mv.addObject("coupon", ar);
			mv.addObject("cart", ar1);
		}
		return mv;
	}
	

	
	

}

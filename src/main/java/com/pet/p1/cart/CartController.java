package com.pet.p1.cart;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.pet.p1.member.MemberService;
import com.pet.p1.member.MemberVO;

@Controller
@RequestMapping(value="/cart/**")
public class CartController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private MemberService memberService;
	
	
	@PostMapping("cartInsert")
	@ResponseBody
	public int cartInsert(CartVO cartVO,HttpSession session)throws Exception{
		String id = cartVO.getId();
		
		MemberVO memberVO = new MemberVO();
		memberVO.setId(id);
		int result = cartService.cartInsert(cartVO);
		long count = memberService.memberCart(memberVO);
		session.setAttribute("cartCount", count);
		return result;
	}
	
	@GetMapping("cartSelect")
	@ResponseBody
	public void cartSelect(HttpSession session)throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		long cnum = cartService.direct(memberVO);
		session.setAttribute("cnum", cnum);
		
		
		
	}

	
	
	
	
	
	
	
}

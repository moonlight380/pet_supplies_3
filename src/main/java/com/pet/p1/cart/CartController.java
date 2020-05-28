package com.pet.p1.cart;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.pet.p1.member.MemberService;
import com.pet.p1.member.MemberVO;

@Controller
@RequestMapping(value="/cart/**")
public class CartController {
	
	@Autowired
	private CartService cartService;
	@Autowired
	private MemberService memberService;
	
	
	
	@PostMapping("cartCheck")
	@ResponseBody
	public void cartCheck(CartVO cartVO,HttpServletRequest request)throws Exception{
		System.out.println(cartVO.getId());
		System.out.println(cartVO.getProductNum());
		CartVO check = cartService.cartCheck(cartVO);
		request.setAttribute("check", check);
		CartVO a = (CartVO)request.getAttribute("check");
		System.out.println(check);
		
		System.out.println("---------------------");
		
		System.out.println("request : "+a);
		
		
		
		
		
	}
	
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

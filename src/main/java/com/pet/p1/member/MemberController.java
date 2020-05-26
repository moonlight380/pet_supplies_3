package com.pet.p1.member;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.CookieValue;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.method.annotation.ResponseBodyEmitterReturnValueHandler;


import com.fasterxml.jackson.databind.ObjectMapper;

import com.pet.p1.cart.CartService;
import com.pet.p1.cart.CartVO;
import com.pet.p1.mail.JavaMailInfo;
import com.pet.p1.order.OrderService;
import com.pet.p1.order.OrderVO;
import com.pet.p1.orderInfo.OrderInfoVO;
import com.pet.p1.product.DogService;
import com.pet.p1.product.DogVO;
import com.pet.p1.util.Pager;


@Controller
@RequestMapping(value = "/member/**")
public class MemberController {

	@Autowired
	private MemberService memberService;
	@Autowired
	private CartService cartService;
	@Autowired
	private OrderService orderService;
	@Autowired
	private JavaMailInfo javaMailInfo; 
	
//--------------------------------------------------------------------------------------------------------------


	@GetMapping("memberPurchase")
	public ModelAndView memberOrderInfo2(HttpSession session,ModelAndView mv,HttpServletRequest request)throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		memberVO.setOrderCheck(1);
		String curPage = request.getParameter("curPage");
		
		
		
		if(curPage==null) {
			curPage="1";
		}
		Long curPage2 = Long.parseLong(curPage);
		
		memberVO.setCurPage(curPage2);
		List<OrderInfoVO> ar = orderService.orderInfoList(memberVO);

		
		
		mv.addObject("orderList",ar);
		mv.addObject("pager",memberVO);
		mv.setViewName("member/memberPurchase");
		return mv;
		
		
	}

	@GetMapping("memberOrderInfo")
	public ModelAndView memberOrderInfo(HttpSession session,ModelAndView mv,HttpServletRequest request)throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		memberVO.setOrderCheck(0);
		String curPage = request.getParameter("curPage");
		
		
		
		if(curPage==null) {
			curPage="1";
		}
		Long curPage2 = Long.parseLong(curPage);
		
		memberVO.setCurPage(curPage2);
		List<OrderInfoVO> ar = orderService.orderInfoList(memberVO);

		
		
		mv.addObject("orderList",ar);
		mv.addObject("pager",memberVO);
		mv.setViewName("member/memberOrderInfo");
		return mv;
	}
		

	@GetMapping("orderWait")
	public void orderWait()throws Exception{

	}
	
	
	@PostMapping("orderInfoInsert")
	@ResponseBody
	public void orderInfoInsert(OrderInfoVO orderInfoVO,HttpSession session)throws Exception{
		orderService.orderInfoInsert(orderInfoVO);
		session.setAttribute("cartSelect", null);
		
		
	}
	
	@GetMapping("memberCartHeader")
	public void memberCartHeader(HttpSession session)throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		long count = memberService.memberCart(memberVO);
		session.setAttribute("cartCount", count);
	}
	
	
	@PostMapping("memberPaymentList")
	@ResponseBody
	public void memberPaymentList(Long[] ids,HttpSession session)throws Exception{
		List<Long> list = Arrays.asList(ids);
		
		
		
		List<CartVO> ar = cartService.cartSelect(list);
		session.setAttribute("cartSelect", ar); 
		
	}
	

	
	@PostMapping("memberPayment")
	@ResponseBody
	public int memberPayment(OrderVO orderVO)throws Exception{
		
		
		
		int result = orderService.orderCart(orderVO);
		return result;
	}
	

	@PostMapping("cartUpdate")
	@ResponseBody   				//ajax실행시 return으로 jsp를 찾는데 그것 대신 data형태로 찾는것
	public int cartUpdate(CartVO cartVO)throws Exception{
	
		int result = cartService.cartUpdate(cartVO);
		
		return result;
	}
	
	
	
	@GetMapping("cartDelete")
	public ModelAndView cartDelete(Long [] ids)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<Long> list = Arrays.asList(ids);
		int result = cartService.cartDelete(list);
		mv.addObject("result",result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	@GetMapping("memberCartRefresh")
	public ModelAndView memberCartRefresh(HttpSession session)throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		List<CartVO> ar = cartService.cartList(memberVO);
		mv.addObject("cart",ar);
		mv.setViewName("member/memberCartRefresh");
		long count = memberService.memberCart(memberVO);
		session.setAttribute("cartCount", count);
		return mv;
	}
	
	
	//--장바구니
	@GetMapping("memberCart")
	public ModelAndView cartList(HttpSession session)throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		if (memberVO == null) {
			/*
			 * mv.addObject("result", "로그인을 해주세요."); mv.addObject("path", "./memberLogin");
			 * mv.setViewName("common/result");
			 */
			

		} else {
			
			List<CartVO> ar = cartService.cartList(memberVO);
			mv.addObject("cart",ar);
			mv.setViewName("member/memberCart");
		
		}
		
		return mv;
		
		
	}
	
	//--장바구니 끝
	
	
	
	//--회원가입
	@RequestMapping(value= "memberJoin")
	public void memberJoin() {
		
	}
	
	@RequestMapping(value= "memberJoin", method = RequestMethod.POST)
	public ModelAndView memberJoin(MemberVO memberVO, ModelAndView mv,HttpSession session) throws Exception {
		  int result = memberService.memberJoin(memberVO,session);

		  if(result>0) {
			  mv.setViewName("member/memberJoinSuccess");
			}else {
				 mv.addObject("result", "회원가입에 실패했습니다 다시 시도해주세요");
				 mv.addObject("path", "./memberJoin");
				 mv.setViewName("common/result");
			}

		return mv;
	}
	//--회원가입 끝
	
	//--로그인/로그아웃
	@RequestMapping(value= "memberLogin")
	public void memberLogin(@CookieValue(value = "cId", required = false)String cId, Model model) {
		model.addAttribute("cId", cId);
	}
	
	@RequestMapping(value= "memberLogin", method = RequestMethod.POST)
	public ModelAndView memberLogin(ModelAndView mv, MemberVO memberVO,HttpSession session, String remember, HttpServletResponse response) throws Exception {
		
		Cookie cookie = new Cookie("cId", "");
		
		if(remember != null) {
			cookie.setValue(memberVO.getId());
		}
		response.addCookie(cookie); 	//만든 쿠키 넣기
		
		 memberVO = memberService.memberLogin(memberVO);

		 if(memberVO != null) {
			 session.setAttribute("member", memberVO);
			 long count = memberService.memberCart(memberVO);
			 session.setAttribute("cartCount", count);
			 mv.setViewName("redirect:../");
		 }else {
			 mv.addObject("result", "아이디와 비밀번호를 확인해주세요");
			 mv.addObject("path", "./memberLogin");
			 mv.setViewName("common/result");
		 }
				 
		return mv;
	}
	

	@RequestMapping(value = "memberLogout")
	public String memberLogout(HttpSession session)throws Exception{
		session.invalidate();
		return "redirect:../";
	}
	
	//--로그인/로그아웃 끝
	
	//-- kakao 로그인
	@GetMapping("kakaoLogin")
	public ModelAndView kakaoLogin(@RequestParam("code") String code, HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
		String access_Token = memberService.getAccessToken(code);
		HashMap<String, Object> memberInfo = memberService.getmemberInfo(access_Token);
		System.out.println("login Controller:"+memberInfo);
		
		// 클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
		/*
		 * if(memberInfo.get("email") != null) { session.setAttribute("memberId",
		 * memberInfo.get("email")); 
		 * }
		 */
		session.setAttribute("access_Token", access_Token);
		session.setAttribute("kmember", memberInfo);
		
		MemberVO memberVO = new MemberVO();
		memberVO.setId((String)memberInfo.get("kakaoId"));
		memberVO = memberService.memberIdCheck(memberVO);
		
		if(memberVO != null) {
		
			memberVO = memberService.snsLogin(memberVO);
			 session.setAttribute("member", memberVO);
			 long count = memberService.memberCart(memberVO);
			 session.setAttribute("cartCount", count);
			 mv.setViewName("redirect:../");
		}else {
			
			mv.setViewName("member/kakaoJoin");
		}
		return mv;
	}
	
	//-- kakaoJoin
	@GetMapping("kakaoJoin")
	public ModelAndView kakaoJoin()throws Exception{
		ModelAndView mv = new ModelAndView();
		
		return mv;
	}
	
	@PostMapping("snsJoin")
	public ModelAndView snsJoin(MemberVO memberVO,HttpSession session)throws Exception{
		ModelAndView mv = new ModelAndView();
	
		int result = memberService.snsJoin(memberVO, session);
		  String msg ="Member Join Fail";
		  if(result>0) { 
			msg = "회원가입 완료!"
					+ "로그인을해주세요";
			}
		  
		  mv.addObject("result", msg); 
		  mv.addObject("path", "../");
		  mv.setViewName("common/result");
		  
		return mv;

	}
	
	//-- kakao 로그아웃
	@GetMapping("kakaoLogout")
	public String kakaoLogout(HttpSession session) {
		System.out.println("로그아웃");
		memberService.kakaoLogout((String)session.getAttribute("access_Token"));
		session.removeAttribute("access_Token");

		return "redirect:../";
	}
	
	//-- email 중복검사
	@PostMapping("memberEmailCheck")
	public ModelAndView memberEMCheck(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();

		memberVO = memberService.memberEMCheck(memberVO);
		
		/*
		 * ObjectMapper mapper = new ObjectMapper(); String membervo =
		 * mapper.writeValueAsString(memberVO);
		 */
		
		 int result = 0; 
		 if(memberVO == null){ 
			 result = 1;
			 };
		 
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	//-- id 중복검사
	@PostMapping("memberIdCheck")
	public ModelAndView memberIdCheck(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = memberService.memberIdCheck(memberVO);
		//null -> 가입 가능 1
		//!null -> 중복 0
		int result = 0;
		if(memberVO == null) {
			result = 1;
		}
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	//-- id 중복검사 끝
	
	//-- phone 중복검사 
	@PostMapping("memberPCheck")
	public ModelAndView memberPCheck(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		memberVO = memberService.findPhone(memberVO);
		int result = 0;
		if(memberVO == null) {
			result = 1;
		}
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
	//-- ID 찾기
	@GetMapping("memberID")
	public void memberID()throws Exception{
		
	}

	//-- ID 찾기 성공
	@GetMapping("idFindSuccess")
	public ModelAndView findSuccess(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", memberVO);
		
		return mv;
	}

	//-- ID 찾기 실패
	@GetMapping("idFindFail")
	public void findFail()throws Exception{
		
	}

	//-- PW 찾기
	@GetMapping("memberPW")
	public void memberPW()throws Exception{
			
	}

	//-- PW 찾기 성공
	@GetMapping("pwFindSuccess")
	public ModelAndView pwFindSuccess(MemberVO memberVO)throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.addObject("user", memberVO);
		
		return mv;
	}

	//-- email로 찾기
	@PostMapping("findEmail")
	@ResponseBody
	public MemberVO findEmail(MemberVO memberVO)throws Exception{

		memberVO = memberService.memberEMCheck(memberVO);
		
		return memberVO;
	}

	//-- Phone으로 찾기
	@PostMapping("findPhone")
	@ResponseBody
	public MemberVO findPhone(MemberVO memberVO)throws Exception{
		
		memberVO = memberService.findPhone(memberVO);
		
		return memberVO;
	}

	//-- PW 임시 비밀번호 메일 보내기
	@GetMapping("sendMail")
	public String sendMail(String mailto,String id)throws Exception{
		String code = "<비밀번호 찾기 안내 메일>";
		javaMailInfo.Sendmail(mailto,code,id);
		
		return "member/pwFindSuccess";	
	}

	//-- memberPayment
	@GetMapping("memberPayment")
	public void memberPayment(MemberVO memberVO)throws Exception{
	
	}

	//kakaoPay
	@RequestMapping(value = "kakaoPay",method = RequestMethod.GET)
	public ModelAndView kakaoPay(ModelAndView mv) throws Exception{
		mv.setViewName("member/kakao");
		
		return mv;
	}

	
	
	/*
	 * @GetMapping("memberOrder") public ModelAndView memberOrder(HttpSession
	 * session)throws Exception{ MemberVO memberVO =
	 * (MemberVO)session.getAttribute("member"); ModelAndView mv = new
	 * ModelAndView(); OrderVO orderVO = new OrderVO();
	 * 
	 * orderVO = orderService.orderSelectOne(memberVO);
	 * mv.addObject("order",orderVO); mv.setViewName("member/memberOrder"); return
	 * mv; }
	 */
	



	//-- 결제 성공시
	@GetMapping("kakaopaySuccess")
	public ModelAndView kakaopaySuccess(HttpSession session)throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		OrderVO orderVO = new OrderVO();
		orderVO = orderService.orderSelectOne(memberVO);
		mv.addObject("order", orderVO);
		mv.setViewName("member/kakaopaySuccess");
		return mv;
		
	}

	//-- 결제 실패시
	@GetMapping("kakaopayFail")
	public void kakaopayFail()throws Exception{

	}

	//-- 무통장 결제
	@GetMapping("accountPaySuccess")
	public ModelAndView accountPaySuccess(HttpSession session)throws Exception{
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		ModelAndView mv = new ModelAndView();
		OrderVO orderVO = new OrderVO();
		orderVO = orderService.orderSelectOne(memberVO);
		mv.addObject("order", orderVO);
		mv.setViewName("member/accountPaySuccess");
		return mv;
	}
	
	
//-------------------------------------------------------------------------------------------------------	
	
	@RequestMapping(value="memberList", method = RequestMethod.GET)
	public ModelAndView memberList(Pager memberPager, ModelAndView mv)throws Exception{
		List<MemberVO> ar = memberService.memberList(memberPager);
		
		mv.addObject("list", ar);
		mv.addObject("pager", memberPager);
		mv.setViewName("member/memberList");
		
		return mv;
	}
	
	@RequestMapping(value= "memberPage")
	public ModelAndView memberPage(HttpSession session)throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		Long oc = memberService.orderCount(memberVO);
		ModelAndView mv = new ModelAndView();
		mv.addObject("ocount", oc);
		mv.setViewName("member/memberPage");
		return mv;
	}

	
	@RequestMapping(value= "memberUpdate")
	public void memberUpdate() {
		
	}
	
	@RequestMapping(value= "memberUpdate", method = RequestMethod.POST)
	public ModelAndView memberUpdate(ModelAndView mv, MemberVO memberVO, HttpSession session) throws Exception {
		String id = ((MemberVO)session.getAttribute("member")).getId();
		memberVO.setId(id);
		
		int result = memberService.memberUpdate(memberVO);
		
		if(result>0) {
			session.setAttribute("member", memberVO);
			mv.setViewName("redirect:./memberPage");
		}else {
			 mv.addObject("result", "Update Fail");
			 mv.addObject("path", "./memberPage");
			 mv.setViewName("common/result");
		}
		
		return mv;
	}
	
	@RequestMapping(value= "memberDelete")
	public ModelAndView memberDelete(ModelAndView mv, HttpSession session) throws Exception {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		int result = memberService.memberDelete(memberVO);
		if(result>0) {
			session.invalidate();
			mv.addObject("result", "Delete Success");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
		}else {
			mv.addObject("result", "Delete Fail");
			mv.addObject("path", "../");
			mv.setViewName("common/result");
		}
		
		return mv;
	}
	
	
	
	@GetMapping("memberDeletes")
	public ModelAndView memberDeletes(String [] ids, ModelAndView mv)throws Exception{
		// 배열을 List로 변환
		List<String> list = Arrays.asList(ids); 
		int result = memberService.memberDeletes(list);
		
		mv.addObject("result", result);
		mv.setViewName("common/ajaxResult");
		
		return mv;
		
//		for(String id : ids) {
//			MemberVO memberVO = new MemberVO();
//			memberVO.setId(id);
//			memberService.memberDelete(memberVO);
//		}
		
	}
	
	@GetMapping("memberLists")
	public ModelAndView memberLists(Pager pager)throws Exception{
		ModelAndView mv = new ModelAndView();
		List<MemberVO> ar = memberService.memberList(pager);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("member/memberLists");
		
		return mv;
	}
	
	

}
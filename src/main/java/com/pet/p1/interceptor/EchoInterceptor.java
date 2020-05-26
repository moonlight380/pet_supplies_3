package com.pet.p1.interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pet.p1.board.BoardVO;
import com.pet.p1.member.MemberVO;

@Component
public class EchoInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, java.lang.Object handler)
			throws Exception {

		boolean check = false;
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");

		if (memberVO.getId() != null) {
			check = true;
		} else {
			response.sendRedirect("../member/memberLogin");
		}

		return check;
	}

}

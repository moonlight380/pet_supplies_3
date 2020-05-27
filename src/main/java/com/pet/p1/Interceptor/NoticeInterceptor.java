package com.pet.p1.Interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pet.p1.board.BoardVO;
import com.pet.p1.member.MemberVO;

@Component
public class NoticeInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		boolean check = false;
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");

		//ModelAndView modelAndView = new ModelAndView();
		//BoardVO boardVO = (BoardVO) modelAndView.getModel().get("vo");
		//String board = (String) modelAndView.getModel().get("board");
		//board = "./" + board + "List";
		
		//String snum = String.valueOf(boardVO.getNum());

		if (memberVO != null && memberVO.getId().equals("admin")) {
			check = true;
			System.out.println("관리자");
		} else if (memberVO != null) {
			response.sendRedirect("./noticeList");

		} else {
			request.setAttribute("result", "권한이 없습니다");
			request.setAttribute("path", "../member/memberLogin");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
		}

		return check;
	}
}

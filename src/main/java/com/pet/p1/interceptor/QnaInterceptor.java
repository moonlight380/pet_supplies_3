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
public class QnaInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		boolean check = true;

		if (memberVO == null) {
			check = false;
			response.sendRedirect("../member/memberLogin");
		}

		/*
		 * ModelAndView modelAndView = new ModelAndView(); String path =
		 * request.getServletPath(); path = path.substring(path.lastIndexOf("/"));
		 * String method = request.getMethod(); BoardVO boardVO = (BoardVO)
		 * modelAndView.getModel().get("vo");
		 * 
		 * if (memberVO != null && method.equals("GET") && path.equals("/qnaDelete") &&
		 * !memberVO.getId().equals("admin") &&
		 * !memberVO.getId().equals(boardVO.getId())) { check = false;
		 * response.sendRedirect("../member/memberLogin"); }
		 */

		return check;
	}// login end prehandle

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf("/"));
		String method = request.getMethod();

		// select
		if (method.equals("GET") && path.equals("/qnaSelect")) {
			MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
			BoardVO boardVO = (BoardVO) modelAndView.getModel().get("vo");
			String board = (String) modelAndView.getModel().get("board");
			board = "./" + board + "List";
			System.out.println(board);

			if (memberVO != null) {
				if (!memberVO.getId().equals("admin")) {
					if (!memberVO.getId().equals(boardVO.getId())) {
						modelAndView.setViewName("redirect:" + board);
					}
				}
			} else {
				modelAndView.addObject("result", "권한이 없음");
				modelAndView.addObject("path", board);
				modelAndView.setViewName("common/result");
			}
		} // end select

		// update
		if (method.equals("GET") && path.equals("/qnaUpdate")) {
			MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
			BoardVO boardVO = (BoardVO) modelAndView.getModel().get("vo");
			String board = (String) modelAndView.getModel().get("board");
			board = "./" + board + "List";
			System.out.println(board);
			System.out.println(boardVO.getId());

			if (memberVO != null) {
				if (!memberVO.getId().equals("admin")) {
					if (!memberVO.getId().equals(boardVO.getId())) {
						modelAndView.setViewName("redirect:" + board);
					}
				}
			} else {
				modelAndView.addObject("result", "권한이 없음");
				modelAndView.addObject("path", board);
				modelAndView.setViewName("common/result");
			}
		} // end update

		// delete
		if (method.equals("GET") && path.equals("/qnaDelete")) {
			MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
			BoardVO boardVO = (BoardVO) modelAndView.getModel().get("vo");
			String board = (String) modelAndView.getModel().get("board");
			board = "./" + board + "List";
			System.out.println(board);
			System.out.println(boardVO.getId());

			if (memberVO != null) {
				if (!memberVO.getId().equals("admin")) {
					if (!memberVO.getId().equals(boardVO.getId())) {
						modelAndView.setViewName("redirect:" + board);
					}
				}
			} else {
				modelAndView.addObject("result", "권한이 없음");
				modelAndView.addObject("path", board);
				modelAndView.setViewName("common/result");
			}
		} // end delete

	}// end posthandle

}
// end class

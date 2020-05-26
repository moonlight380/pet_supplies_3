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
		
		//ModelAndView mv = new ModelAndView();
		//BoardVO boardVO = (BoardVO) mv.getModel().get("vo");
		
		boolean check;

		if (memberVO != null && memberVO.getId().equals("admin")) {
			check = true;
		} else if (memberVO != null) {
			check = true;
		} else {
			check = false;
			response.sendRedirect("../member/memberLogin");
		}

		return check;
	}// login end prehandle

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf("/"));
		System.out.println(path);
		String method = request.getMethod();
		System.out.println(method);

		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		BoardVO boardVO = (BoardVO) modelAndView.getModel().get("vo");
		String board = (String) modelAndView.getModel().get("board");
		board = "./" + board + "List";
		System.out.println(board);

		// select
/*		if (path.equals("/qnaSelect")) {

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
			}*/
		//} // end select

		// update
		if (path.equals("/qnaUpdate") && method.equals("GET")) {

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

		// reply
		if (path.equals("/qnaReply") && method.equals("GET")) {

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
		} // end reply
		
		// delete
		if (path.equals("/qnaDelete") && method.equals("GET")) {

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

package com.pet.p1.Interceptor;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pet.p1.board.BoardVO;
import com.pet.p1.member.MemberVO;
import com.pet.p1.order.OrderDAO;
import com.pet.p1.order.OrderService;
import com.pet.p1.orderInfo.OrderInfoVO;
import com.pet.p1.review.ReviewDAO;
import com.pet.p1.review.ReviewService;

@Component
public class ReviewInterceptor extends HandlerInterceptorAdapter {

	@Autowired
	private ReviewDAO reviewDAO;

	@Autowired
	private ReviewService reviewService;

	@Autowired
	private OrderDAO orderDAO;

	@Autowired
	OrderService orderService;

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");

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
	}

	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		String path = request.getServletPath();
		path = path.substring(path.lastIndexOf("/"));

		String method = request.getMethod();
		MemberVO memberVO = (MemberVO) request.getSession().getAttribute("member");
		BoardVO boardVO = (BoardVO) modelAndView.getModel().get("vo");
		String board = (String) modelAndView.getModel().get("board");
		board = "./" + board + "List";

		// select

		if (path.equals("/reviewSelect")) {

			if (memberVO != null) {
				if (memberVO.getId().equals("admin") || memberVO.getId().equals(boardVO.getId())) {
					System.out.println(boardVO.getNum());
					// reviewDAO.hitUpdate(boardVO.getNum());
				}
			}

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
		if (path.equals("/reviewUpdate") && method.equals("GET")) {

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
		if (path.equals("/reviewReply") && method.equals("GET")) {

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
		if (path.equals("/reviewDeleteReal") && method.equals("GET")) {

			if (memberVO != null) {
				if (memberVO.getId().equals("admin") || memberVO.getId().equals(boardVO.getId())) {
					System.out.println(boardVO.getNum());
					int result = reviewService.boardDelete(boardVO.getNum());

					if (result > 0) {
						modelAndView.setViewName("redirect:" + board);
					}
				}
			}

			if (memberVO != null) {
				if (!memberVO.getId().equals("admin")) {
					if (!memberVO.getId().equals(boardVO.getId())) {
						modelAndView.addObject("result", "권한이 없음");
						modelAndView.addObject("path", board);
						modelAndView.setViewName("common/result");
					}
				}
			} else {
				modelAndView.addObject("result", "권한이 없음");
				modelAndView.addObject("path", board);
				modelAndView.setViewName("common/result");
			}
		} // end delete

	} // end postHandle

}

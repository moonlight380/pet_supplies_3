package com.pet.p1.Interceptor;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pet.p1.member.MemberVO;

@Component
public class AdminIntercepter extends HandlerInterceptorAdapter{
	
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		boolean check=false;
		MemberVO memberVO=(MemberVO)request.getSession().getAttribute("member");
		String id="admin";
		
		if(memberVO.getId().equals(id)) {
			check= true;
			System.out.println("admin임");
		}else{
			System.out.println("admin이 아님");
			
			request.setAttribute("result", "관리자페이지 입니다.");
			request.setAttribute("path", "../");
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp"); 
			view.forward(request, response);
		}
	
	}
}

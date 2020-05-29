package com.pet.p1.Interceptor;

import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.pet.p1.member.MemberVO;


@Component
public class MemberIntercepter extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		boolean check = false;
		
		Object object = request.getSession().getAttribute("member");
		
		if(object != null) {
			check = true;
		}else {

			String path = request.getContextPath();
			request.setAttribute("result", "로그인 후 이용하실 수 있습니다");
			request.setAttribute("path", path+"/member/memberLogin");

			
			RequestDispatcher view = request.getRequestDispatcher("/WEB-INF/views/common/result.jsp");
			view.forward(request, response);
		
		}
		
		
		return check;
	}
	
	
	
}

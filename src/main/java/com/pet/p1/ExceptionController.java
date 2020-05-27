package com.pet.p1;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionController {
	
	
	
	@ExceptionHandler(value = Exception.class)
	public ModelAndView testHandle()throws Exception{
		ModelAndView mv = new ModelAndView();
		mv.setViewName("common/result");
		mv.addObject("path", "../");
		mv.addObject("result", "error");
		
		
		return mv;
	}

}

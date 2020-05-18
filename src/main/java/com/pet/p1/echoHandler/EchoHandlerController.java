package com.pet.p1.echoHandler;

import org.springframework.stereotype.Controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/echo/**")
public class EchoHandlerController {

	@GetMapping("socket")
	public ModelAndView socket(ModelAndView mv) throws Exception {
		mv.setViewName("echo/socket");
		return mv;
	}

	@GetMapping("chat")
	public ModelAndView chat(ModelAndView mv) throws Exception {
		mv.setViewName("echo/chat");
		return mv;
	}

	@GetMapping("chatmodal")
	public ModelAndView chatModal(ModelAndView mv) throws Exception {
		mv.setViewName("echo/chatmodal");
		return mv;
	}

}

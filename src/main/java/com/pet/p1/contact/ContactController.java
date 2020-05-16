package com.pet.p1.contact;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/nav/**")
public class ContactController {

	@GetMapping("contact")
	public ModelAndView ContactPage() throws Exception {
		ModelAndView mv = new ModelAndView();
		return mv;
	}

	@GetMapping("test")
	public void TestPage() throws Exception {

	}
}

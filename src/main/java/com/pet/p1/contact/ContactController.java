package com.pet.p1.contact;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/nav/**")
public class ContactController {

	@GetMapping("contact")
	public void ContactPage() throws Exception {
		
	}

	@GetMapping("test")
	public void TestPage() throws Exception {

	}
}

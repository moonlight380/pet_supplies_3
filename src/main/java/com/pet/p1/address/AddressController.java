package com.pet.p1.address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/product/**")// 일단은 프로덕트로 오는 것들을 받는다. 차후에 변경
public class AddressController {
	@Autowired
	private AddressService addressService;
	
	//address
	@RequestMapping(value = "address",method = RequestMethod.GET)
	public ModelAndView address (ModelAndView mv) throws Exception{
		mv.setViewName("product/address");	
		System.out.println("address/get");
		return mv;
	}
	//address
	@RequestMapping(value = "address",method = RequestMethod.POST)
	public ModelAndView address (ModelAndView mv,AddressVO addressVO) throws Exception{
		int result=addressService.address_insert(addressVO);
		
		if(result>0) {
			mv.setViewName("redirect:../");
		}else {
			mv.addObject("result","address_insert");
			mv.addObject("path","./dogList");
			mv.setViewName("common/result");
		}
		
		mv.setViewName("product/address");

		return mv;
	}
	
	
	//address_list
	@RequestMapping(value = "address_list",method = RequestMethod.GET)
	public ModelAndView address_list (ModelAndView mv) throws Exception{
		mv.setViewName("product/address_list");	
		System.out.println("addressList/get");
		return mv;
	}
	//address_list(post)
	@PostMapping("address_list")
	public String address_list () throws Exception{
		String path="product/address_list";
		System.out.println("addressList/post");
		return path;
	}
}

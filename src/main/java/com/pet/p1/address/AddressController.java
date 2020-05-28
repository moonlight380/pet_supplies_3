package com.pet.p1.address;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/member/**")
public class AddressController {
	@Autowired
	private AddressService addressService;
	
//-----------------------------address(insert)-----------------------------//
	@RequestMapping(value = "address",method = RequestMethod.GET)
	public ModelAndView address (ModelAndView mv) throws Exception{
		mv.setViewName("member/address");	
		System.out.println("address/get");
		return mv;
	}
//-----------------------------address(insert)-----------------------------//
	@RequestMapping(value = "address",method = RequestMethod.POST)
	public ModelAndView address (ModelAndView mv,AddressVO addressVO) throws Exception{
		int result=addressService.address_insert(addressVO);
		
		if(result>0) {
			mv.setViewName("redirect:./address_list");
			mv.addObject("addrVO", addressVO);
		}else {
			mv.addObject("result","address_insert");
			mv.addObject("path","./address");
			mv.setViewName("common/result");
		}
	
		return mv;
	}

//-----------------------------address_list (get)-----------------------------//
	@RequestMapping(value = "address_list",method = RequestMethod.GET)
	public ModelAndView address_list (ModelAndView mv,AddressVO addressVO) throws Exception{
		
		
		List<AddressVO> ar=addressService.address_list(addressVO);
		
		System.out.println("addressList/get");
		mv.addObject("list", ar);
		mv.addObject("addressVO", addressVO);	
		mv.setViewName("member/address_list");	
		return mv;
	}
//-----------------------------address_list(post)-----------------------------//
	@PostMapping("address_list")
	public String address_list () throws Exception{
		String path="product/address_list";
		System.out.println("addressList/post");
		return path;
	}
	
	@GetMapping("address_reset")
	public ModelAndView address_reset(ModelAndView mv,AddressVO addressVO)throws Exception{
		List<AddressVO> ar=addressService.address_list(addressVO);
		
		System.out.println("addressList/get");
		mv.addObject("list", ar);
		mv.addObject("addressVO", addressVO);	
		mv.setViewName("member/address_list");	
		return mv;
	}
	
//-----------------------------address_select(get)-----------------------------//
	@GetMapping(value="address_select")
	public ModelAndView address_select(long addressNum,ModelAndView mv) throws Exception{		
		AddressVO addressVO=addressService.address_select(addressNum);	
		mv.addObject("vo", addressVO);		
		mv.setViewName("member/address_update");		
		System.out.println(addressVO.getAddr_name());
		return mv;
	}
	

	
//-----------------------------address_update(get)-----------------------------//
	
	@GetMapping(value="address_update")
	public ModelAndView address_update(ModelAndView mv,AddressVO addressVO,long addressNum) throws Exception{
		
		addressVO=addressService.address_select(addressNum);
		
		mv.addObject("vo", addressVO);
		mv.setViewName("member/address_update");
		return mv;
	}
	
	
//-----------------------------address_update(post)-----------------------------//
	@PostMapping("address_update")
	public String address_update(ModelAndView mv,AddressVO addressVO)throws Exception{		
		int result=addressService.address_update(addressVO);		
		
		String path;
		if(result>0) {
			path="redirect:./address_list";
			System.out.println("성공");
			
		} else {
			System.out.println("실패");		
			path="redirect:./address_select?addressNum="+addressVO.getAddressNum();
		}
		return path;
		
	}
	
//-----------------------------address_delete(get)-----------------------------//	
	@GetMapping("address_delete")
	@ResponseBody
	public void address_delete(Long [] deleteAddress) throws Exception{
		
		List<Long> list = Arrays.asList(deleteAddress); //배열을 리스트로 바꾸기
		int result=addressService.address_delete(list);
		
		String path;
		if(result>0) {
			path="redirect:./address_list";
			System.out.println("삭제 성공");
		}
	}
	
	
	
}// end class

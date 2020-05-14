package com.pet.p1.product;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.p1.util.Pager;

@Controller
@RequestMapping("/product/**")
public class DogController {
@Autowired
private DogService dogService;


@ModelAttribute("p")
public String getBoard()throws Exception{
	return "dog";
}
@RequestMapping(value = "dogkakaoPay",method = RequestMethod.GET)
public ModelAndView dogkakaoPay (ModelAndView mv) throws Exception{
	mv.setViewName("product/pkakaoPay");
	
	return mv;
}

@RequestMapping(value = "kakao",method = RequestMethod.GET)
public ModelAndView kakao (ModelAndView mv) throws Exception{
	mv.setViewName("product/kakao");
	
	return mv;
}
//List
	@RequestMapping(value ="dogList", method = RequestMethod.GET )
	public ModelAndView dogList (ModelAndView mv,Pager pager)throws Exception {
		
		System.out.println("kind:"+pager.getKind());
		System.out.println("search:"+pager.getSearch());
		
		List<DogVO> ar =dogService.dogList(pager);
		System.out.println(pager.getTotalPage());
		
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
		
		mv.setViewName("product/pList");

		return mv;
	}
//dogNewList
	@RequestMapping(value ="dogNewList", method = RequestMethod.GET )
	public ModelAndView dogNewList(ModelAndView mv,Pager pager)throws Exception {
			
		System.out.println("kind:"+pager.getKind());
		System.out.println("search:"+pager.getSearch());
			
		List<DogVO> ar =dogService.dogNewList(pager);
		System.out.println(pager.getTotalPage());
			
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
			
		mv.setViewName("product/pNewList");

		return mv;
		
		}	
	
//dogBestList	
	@RequestMapping(value ="dogBestList", method = RequestMethod.GET )
	public ModelAndView dogBestList	(ModelAndView mv,Pager pager)throws Exception {
			
		System.out.println("kind:"+pager.getKind());
		System.out.println("search:"+pager.getSearch());
			
		List<DogVO> ar =dogService.dogBestList(pager);
		System.out.println(pager.getTotalPage());
			
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
			
		mv.setViewName("product/pBestList");

		return mv;
		
		}	
//dogTimeSale	
	@RequestMapping(value ="dogTimeSale", method = RequestMethod.GET )
	public ModelAndView dogTimeSale	(ModelAndView mv,Pager pager)throws Exception {
			
		System.out.println("kind:"+pager.getKind());
		System.out.println("search:"+pager.getSearch());
			
		List<DogVO> ar =dogService.dogTimeSale(pager);
		System.out.println(pager.getTotalPage());
			
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
			
		mv.setViewName("product/pTimeSale");

		return mv;
		
		}	
	
	
	
	
//write_get	(insert)
	@RequestMapping(value = "dogWrite",method = RequestMethod.GET)
	public ModelAndView dogWrite (ModelAndView mv) throws Exception{
		mv.setViewName("product/pWrite");
		
		return mv;
	}
//Write_post(insert)
	@RequestMapping(value ="dogWrite", method = RequestMethod.POST)
	public ModelAndView dogWrite(DogVO dogVO , ModelAndView mv,MultipartFile firstFile, MultipartFile[] files) throws Exception{	
		
		int result=dogService.dogWrite(dogVO, firstFile,files);	
		//result=0;
		
		if(result>0) {
			mv.setViewName("redirect:./dogList");
		}else {
			mv.addObject("result","WRITER FAIL");
			mv.addObject("path","./noticeList");
			mv.setViewName("common/result");
		}
		
		return mv;
	}	
	
//Select
	@GetMapping("dogSelect") 
		public ModelAndView dogSelect(long productNum) throws Exception{
		
			DogVO dogVO=dogService.dogSelect(productNum);
			ModelAndView mv= new ModelAndView();
			mv.addObject("vo",dogVO);		
			mv.setViewName("product/pSelect");
			
			
			return mv;
		}	
	
//update_get
	@GetMapping("dogUpdate")
	public ModelAndView dogUpdate(Model model,ModelAndView mv,DogVO dogVO,long productNum)throws Exception{
		dogVO =dogService.dogSelect(productNum);
		mv.addObject("vo",dogVO);	
		mv.setViewName("product/pUpdate");
		//size(): 리스트에 들어있는 객체의 수
		model.addAttribute("size", dogVO.getProductFileVOs().size());
		return mv;
	}
//update_post	
	@RequestMapping(value = "dogUpdate", method=RequestMethod.POST)
	public String boardUpdate(ModelAndView mv,Model model,DogVO dogVO,long productNum,MultipartFile firstFile, MultipartFile[] files) throws Exception {
		for(MultipartFile multipartFile:files) {
			System.out.println("files:"+multipartFile.getOriginalFilename());
		}
		
		int result=dogService.dogUpdate(dogVO, firstFile, files);
		//result=0;
		String path="";
		if(result>0) {
			path="redirect:./dogList";
			
		}else {
			path="redirect:./dogSelect?productNum="+dogVO.getProductNum(); 
		}
		
		return path;		
	}
//delete
		@RequestMapping(value = "dogDelete", method=RequestMethod.GET)
		public ModelAndView dogDelete(long productNum,DogVO dogVO,ModelAndView mv) throws Exception {
			int result=dogService.dogDelete(productNum);
			if(result>0) {
			mv.addObject("result","dog product Delete Success");
	
			}else {
			mv.addObject("result","dog product Delete Fail");
			}
			mv.addObject("path","./dogList");
			mv.setViewName("common/result");
			
			return mv;
				
			}
	
}//end class

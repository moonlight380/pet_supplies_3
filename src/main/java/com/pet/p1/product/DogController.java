package com.pet.p1.product;

import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.p1.address.AddressVO;
import com.pet.p1.board.BoardVO;
import com.pet.p1.member.MemberVO;
import com.pet.p1.review.ReviewService;
import com.pet.p1.util.Pager;

@Controller
@RequestMapping("/product/**")
public class DogController {
@Autowired
private DogService dogService;
@Autowired
private ReviewService reviewService;


@ModelAttribute("p")
public String getBoard()throws Exception{
	return "dog";
}

//------------------------------List페이지에서 전체삭제, 개별삭제-------------------------------------//

	@GetMapping("product_list_delete")
	@ResponseBody
	public void product_list_delete(Long [] deleteProduct) throws Exception{
		List<Long> list = Arrays.asList(deleteProduct); //배열을 리스트로 바꾸기
		int result=dogService.product_list_delete(list);
		
		String path;
		if(result>0) {
			path="redirect:./dogList";
			System.out.println("리스트페이지에서 상품 삭제 성공");
		}

	}


	
//-----------------------------------------------List-------------------------------------------------------------//
	@RequestMapping(value ="dogList", method = RequestMethod.GET )
	public ModelAndView dogList (ModelAndView mv,Pager pager,HttpSession session)throws Exception {
		
		
		List<DogVO> ar =dogService.dogList(pager);
		//System.out.println(pager.getTotalPage());
		
		mv.addObject("list",ar);
		mv.addObject("pager",pager);
		
		mv.setViewName("product/pList");

		return mv;
	}
//dogNewList
	@RequestMapping(value ="dogNewList", method = RequestMethod.GET )
	public ModelAndView dogNewList(ModelAndView mv,Pager pager)throws Exception {
			
			
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
			
		/*
		 * System.out.println("kind:"+pager.getKind());
		 * System.out.println("search:"+pager.getSearch());
		 */
			
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
	
		List<DogVO> ar =dogService.dogTimeSale(pager); //dogVO의 주소를 줌
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
			mv.addObject("path","./dogList");
			mv.setViewName("common/result");
		}
		
		return mv;
	}	
	
//Select
	@GetMapping("dogSelect") 
		public ModelAndView dogSelect(long productNum,DogVO dogVO, HttpSession session) throws Exception{
			dogVO=dogService.dogSelect(dogVO);
			List<BoardVO>ar = reviewService.pboardList(productNum);
			
			ModelAndView mv= new ModelAndView();
			

			mv.addObject("vo",dogVO);
			mv.addObject("list", ar);
			mv.setViewName("product/pSelect");
			
			
			
			return mv;
		}	
	
//dogSelectTimeSale		
	@GetMapping("dogSelectTimeSale") 
	public ModelAndView dogSelectTimeSale(long productNum,DogVO dogVO, HttpSession session) throws Exception{
		dogVO=dogService.dogSelectTimeSale(dogVO);
		List<BoardVO>ar = reviewService.pboardList(productNum);
		
		ModelAndView mv= new ModelAndView();

		mv.addObject("vo",dogVO);
		mv.addObject("list", ar);
		mv.setViewName("product/pSelectTimeSale");

		return mv;
	}	
	
//timeSaleUpdate
	 	@RequestMapping(value="timeSaleUpdate", method=RequestMethod.GET)
	    @ResponseBody
		public void timeSaleUpdate(Long[] ids)throws Exception{
		
	 	System.out.println("타임세일업데이트  controller");
	 	System.out.println("ids:"+ids);
	 	
		List<Long> list = Arrays.asList(ids);
		int result=dogService.timeSaleUpdate(list);
	
		if(result>0) {
			System.out.println("성공");
		}
		
//		for(int i =0;i<list.size();i++) {
//			long productNum = list.get(i);
//			dogService.timeSaleUpdate(productNum);
//		}

		
		}	
			
	
//update_get
	@GetMapping("dogUpdate")
	public ModelAndView dogUpdate(Model model,ModelAndView mv,DogVO dogVO)throws Exception{
		dogVO =dogService.dogSelect(dogVO);
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

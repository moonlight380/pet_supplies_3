package com.pet.p1.product.file;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;


@Controller
@RequestMapping("/productFile/**")
public class ProductFileController {
	@Autowired
	private ProductFileService productFileService;

//fileInsert
@PostMapping("fileInsert")
	public ModelAndView fileInsert(MultipartFile files,ModelAndView mv) throws Exception{
		String fileName =productFileService.fileInsert(files);
		mv.addObject("result", fileName);
		mv.setViewName("common/ajaxResult");
		return mv;
	}
	
//	@GetMapping("fileDown")
//	public ModelAndView fileDown(ProductFileVO productFileVO)throws Exception{
//		ModelAndView mv = new ModelAndView();
//		productFileVO=productFileService.fileSelect(productFileVO);
//		mv.addObject("file",productFileVO);
//		mv.setViewName("fileDown");
//		
//		return mv;
//	}


//fileList
@GetMapping("fileList")
	public ModelAndView fileList (ModelAndView mv,ProductFileVO productFileVO)throws Exception{
		mv.addObject("file",productFileVO);
		return mv;

		
	}
	
//summerDelete
@PostMapping("summerDelete")
	public ModelAndView fileDelete(String fileName)throws Exception{
		ModelAndView mv = new ModelAndView();
		int result =productFileService.fileDelete(fileName); //호출
		mv.addObject("result",result);
		mv.setViewName("common/ajaxResult");
		return mv;
	}


@PostMapping("fileDelete")
@ResponseBody//꼭 키가 없어도 데이터만 보내도 데이터만 나온다. //reponse에 들어가는 바디에 들어간다. 
	public int fileDelete(ProductFileVO productFileVO)throws Exception{
		//ModelAndView mv = new ModelAndView();	
		int result = productFileService.fileDelete(productFileVO);
		
//		mv.addObject("result", result);
//		mv.setViewName("common/ajaxResult");
		
		return result;		
	}
	
	
}//end class

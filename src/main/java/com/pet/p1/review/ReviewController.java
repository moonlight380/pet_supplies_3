package com.pet.p1.review;

import java.util.List;

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

import com.pet.p1.board.BoardVO;
import com.pet.p1.util.Pager;

@Controller
@RequestMapping("/review/**")
public class ReviewController {

	@Autowired
	private ReviewService reviewService;

	@ModelAttribute("board")
	public String getBoard() throws Exception {
		return "review";
	}

	@GetMapping("reviewDelete")
	public ModelAndView boardDelete(long num) throws Exception {
		ModelAndView mv = new ModelAndView();
		int result = reviewService.boardDelete(num);
		if (result > 0) {
			mv.addObject("result", "삭제 성공");
		} else {
			mv.addObject("result", "삭제 실패");
		}
		mv.addObject("path", "./reviewList");
		mv.setViewName("common/result");
		return mv;
	}

	@RequestMapping(value = "reviewUpdate", method = RequestMethod.GET)
	public String boardUpdate(long num, Model model) throws Exception {
		BoardVO boardVO = reviewService.boardSelect(num);
		model.addAttribute("vo", boardVO);
		ReviewVO reviewVO = (ReviewVO) boardVO;
		model.addAttribute("size", reviewVO.getBoardFileVOs().size());
		return "board/boardUpdate";
	}

	@RequestMapping(value = "reviewUpdate", method = RequestMethod.POST)
	public String boardUpdate(ReviewVO reviewVO, MultipartFile[] files) throws Exception {
		for (MultipartFile multipartFile : files) {
			System.out.println(multipartFile.getOriginalFilename());
		}
		;

		int result = reviewService.boardUpdate(reviewVO, files);
		String path = "";

		if (result > 0) {
			path = "redirect:./reviewList";
		} else {
			path = "redirect:./reviewSelect?num=" + reviewVO.getNum();
		}

		return path;
	}

	@GetMapping("reviewWrite")
	public ModelAndView boardWrite(ModelAndView mv) throws Exception {
		mv.setViewName("board/boardWrite");
		return mv;
	}

	@PostMapping("reviewWrite")
	public ModelAndView boardWrite(ReviewVO reviewVO, MultipartFile[] files, ModelAndView mv) throws Exception {

		int result = reviewService.boardWrite(reviewVO, files);
		String msg = "리뷰 작성 오류";
		if (result > 0) {
			msg = "리뷰가 등록되었습니다";
			mv.setViewName("redirect:./reviewList");
		} else {
			mv.addObject("result", msg);
			mv.addObject("path", "./reviewList");
			mv.setViewName("common/result");
		}
		return mv;
	}

	@GetMapping("reviewSelect")
	public ModelAndView boardSelect(Long num, ModelAndView mv) throws Exception {

		BoardVO boardVO = reviewService.boardSelect(num);

		long minNum = reviewService.minNum(num);
		long maxNum = reviewService.maxNum(num);

		mv.addObject("maxNum", maxNum);
		mv.addObject("minNum", minNum);
		mv.addObject("vo", boardVO);
		mv.setViewName("board/boardSelect");
		return mv;
	}

	@GetMapping("reviewList")
	public ModelAndView boardList(Pager pager, ModelAndView mv) throws Exception {
		List<BoardVO> ar = reviewService.boardList(pager);
		List<Long> rNumber = reviewService.rNum();

		mv.addObject("listNo", rNumber);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("board/boardList");
		return mv;
	}

	@GetMapping("reviewReply")
	public ModelAndView boardReply(ModelAndView mv, long num) throws Exception {
		mv.addObject("num", num);
		mv.setViewName("board/boardReply");
		return mv;
	}

	@PostMapping("reviewReply")
	public ModelAndView boardReply(ModelAndView mv, ReviewVO reviewVO) throws Exception {
		int result = reviewService.boardReply(reviewVO);

		if (result > 0) {
			mv.setViewName("redirect:./reviewList");
		} else {
			mv.addObject("result", "리뷰 작성 실패");
			mv.addObject("path", "./reviewList");
			mv.setViewName("common/result");
		}

		return mv;
	}
}

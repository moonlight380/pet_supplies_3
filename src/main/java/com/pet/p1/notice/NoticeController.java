package com.pet.p1.notice;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.p1.board.BoardVO;
import com.pet.p1.util.Pager;

@Controller
@RequestMapping("/notice/**")
public class NoticeController {

	@Autowired
	private NoticeService noticeService;

	@ModelAttribute("board")
	public String getBoard() throws Exception {
		return "notice";
	}

	@RequestMapping(value = "noticeDelete", method = RequestMethod.GET)
	public ModelAndView boardDelete(long num, ModelAndView mv) throws Exception {
		int result = noticeService.boardDelete(num);
		if (result > 0) {
			mv.addObject("result", "삭제 성공");
		} else {
			mv.addObject("result", "삭제 실패");
		}
		mv.addObject("path", "./noticeList");
		mv.setViewName("common/result");
		return mv;
	}

	@RequestMapping(value = "noticeUpdate", method = RequestMethod.GET)
	public String boardUpdate(long num, Model model) throws Exception {
		BoardVO boardVO = noticeService.boardSelect(num);
		model.addAttribute("vo", boardVO);
		NoticeVO noticeVO = (NoticeVO) boardVO;
		model.addAttribute("size", noticeVO.getBoardFileVOs().size());
		return "board/boardUpdate";
	}

	@RequestMapping(value = "noticeUpdate", method = RequestMethod.POST)
	public String boardUpdate(NoticeVO noticeVO, MultipartFile[] files) throws Exception {
		for (MultipartFile multipartFile : files) {
			System.out.println(multipartFile.getOriginalFilename());
		}
		;

		int result = noticeService.boardUpdate(noticeVO, files);
		String path = "";

		if (result > 0) {
			path = "redirect:./noticeList";
		} else {
			path = "redirect:./noticeSelect?num=" + noticeVO.getNum();
		}

		return path;
	}

	@RequestMapping(value = "noticeWrite", method = RequestMethod.GET)
	public String boardWrite() throws Exception {
		return "board/boardWrite";
	}

	@RequestMapping(value = "noticeWrite", method = RequestMethod.POST)
	public ModelAndView boardWrite(NoticeVO noticeVO, MultipartFile[] files, ModelAndView mv) throws Exception {

		int result = noticeService.boardWrite(noticeVO, files);
		if (result > 0) {
			mv.setViewName("redirect:./noticeList");
		} else {
			mv.addObject("result", "글쓰기 실패");
			mv.addObject("path", "./noticeList");
			mv.setViewName("common/result");
		}
		return mv;
	}

	@RequestMapping(value = "noticeSelect", method = RequestMethod.GET)
	public ModelAndView boardSelect(long num) throws Exception {
		ModelAndView mv = new ModelAndView();
		BoardVO boardVO = noticeService.boardSelect(num);
		long minNum = noticeService.minNum(num);
		long maxNum = noticeService.maxNum(num);

		mv.addObject("maxNum", maxNum);
		mv.addObject("minNum", minNum);
		mv.addObject("vo", boardVO);
		mv.setViewName("board/boardSelect");
		return mv;
	}

	@RequestMapping(value = "noticeList", method = RequestMethod.GET)
	public ModelAndView boardList(Pager pager, ModelAndView mv) throws Exception {

		List<BoardVO> ar = noticeService.boardList(pager);
		List<Long> rNumber = noticeService.rNum();

		mv.addObject("listNo", rNumber);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("board/boardList");
		return mv;
	}
}

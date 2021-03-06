package com.pet.p1.qna;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.pet.p1.board.BoardVO;
import com.pet.p1.member.MemberVO;
import com.pet.p1.util.Pager;

@Controller
@RequestMapping("/qna/**")
public class QnaController {

	@Autowired
	private QnaService qnaService;

	@ModelAttribute("board")
	public String getBoard() throws Exception {
		return "qna";
	}

	@GetMapping("qnaDelete")
	public ModelAndView boardDelete(long num) throws Exception {

		ModelAndView mv = new ModelAndView();

		BoardVO boardVO = qnaService.boardSelect(num);

		mv.addObject("vo", boardVO);
		mv.addObject("path", "./qnaSelect?num=" + num);
		mv.addObject("truePath", "./qnaDeleteReal?num=" + num);

		mv.setViewName("common/deleteResult");

		return mv;
	}

	@GetMapping("qnaDeleteReal")
	public ModelAndView boardDeleteReal(long num) throws Exception {

		ModelAndView mv = new ModelAndView();

		BoardVO boardVO = qnaService.boardSelect(num);

		mv.addObject("vo", boardVO);
		// mv.setViewName("board/boardList");

		mv.addObject("result", "권한이 없음");
		mv.addObject("path", "./qnaList");
		mv.setViewName("common/result");

		// mv.addObject("path", "./qnaSelect?num=" + num);

		// mv.addObject("result","실행 완료");
		// mv.setViewName("./qnaList");

		/*
		 * int result = qnaService.boardDelete(num);
		 * 
		 * if (result > 0) { mv.addObject("result", "삭제 성공"); } else {
		 * mv.addObject("result", "삭제 실패"); } mv.addObject("path", "./qnaList");
		 * mv.setViewName("common/result");
		 */

		return mv;
	}

	@RequestMapping(value = "qnaUpdate", method = RequestMethod.GET)
	public String boardUpdate(long num, Model model) throws Exception {
		BoardVO boardVO = qnaService.boardSelect(num);
		model.addAttribute("vo", boardVO);
		QnaVO qnaVO = (QnaVO) boardVO;
		model.addAttribute("size", qnaVO.getBoardFileVOs().size());
		return "board/boardUpdate";
	}

	/*
	 * @GetMapping("qnaUpdate") public ModelAndView boardUpdate(long num) throws
	 * Exception { ModelAndView mv = new ModelAndView(); BoardVO boardVO =
	 * qnaService.boardSelect(num); mv.addObject("vo", boardVO);
	 * 
	 * QnaVO qnaVO = (QnaVO) boardVO; // ??? mv.addObject("size",
	 * qnaVO.getBoardFileVOs().size()); mv.setViewName("board/boardUpdate"); return
	 * mv; }
	 */

	@RequestMapping(value = "qnaUpdate", method = RequestMethod.POST)
	public String boardUpdate(QnaVO qnaVO, MultipartFile[] files) throws Exception {
		for (MultipartFile multipartFile : files) {
			System.out.println(multipartFile.getOriginalFilename());
		}
		;

		int result = qnaService.boardUpdate(qnaVO, files);
		String path = "";

		if (result > 0) {
			path = "redirect:./qnaList";
		} else {
			path = "redirect:./qnaSelect?num=" + qnaVO.getNum();
		}

		return path;
	}

	/*
	 * @PostMapping("qnaUpdate") public ModelAndView boardUpdate(QnaVO qnaVO,
	 * MultipartFile[] files) throws Exception { ModelAndView mv = new
	 * ModelAndView();
	 * 
	 * for (MultipartFile multipartFile : files) {
	 * System.out.println(multipartFile.getOriginalFilename()); }
	 * 
	 * int result = qnaService.boardUpdate(qnaVO, files); String path = "";
	 * 
	 * if (result > 0) { mv.addObject(path, "redirect:./qnaList"); } else {
	 * mv.addObject(path, "redirect:./qnaSelect?num=" + qnaVO.getNum()); }
	 * mv.setViewName(path); return mv; }
	 */

	@GetMapping("qnaWrite")
	public ModelAndView boardWrite(ModelAndView mv) throws Exception {
		mv.setViewName("board/boardWrite");
		return mv;
	}

	@PostMapping("qnaWrite")
	public ModelAndView boardWrite(QnaVO qnaVO, MultipartFile[] files, ModelAndView mv) throws Exception {

		int result = qnaService.boardWrite(qnaVO, files);
		String msg = "글쓰기 실패";
		if (result > 0) {
			msg = "글이 등록되었습니다";
			mv.setViewName("redirect:./qnaList");
		} else {
			mv.addObject("result", msg);
			mv.addObject("path", "./qnaList");
			mv.setViewName("common/result");
		}
		return mv;
	}

	@GetMapping("qnaSelect")
	public ModelAndView boardSelect(Long num, ModelAndView mv, HttpSession session) throws Exception {

		// interceptor
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		// 조회글
		BoardVO boardVO = qnaService.boardSelect(num);
		QnaVO qnaVO = (QnaVO) qnaService.boardSelect(num);
		// 원글
		String idCompare = qnaService.refId(qnaVO.getRef());
		System.out.println(idCompare);

		mv.setViewName("nav/page404");

		if (boardVO.getId().equals(memberVO.getId()) || memberVO.getId().equals("admin")
				|| memberVO.getId().equals(idCompare)) {

			long minNum = qnaService.minNum(num);
			long maxNum = qnaService.maxNum(num);

			mv.addObject("maxNum", maxNum);
			mv.addObject("minNum", minNum);

			mv.addObject("vo", boardVO);
			mv.setViewName("board/boardSelect");
		}
		//

		return mv;
	}

	@GetMapping("qnaList")
	public ModelAndView boardList(Pager pager, ModelAndView mv) throws Exception {
		List<BoardVO> ar = qnaService.boardList(pager);
		List<Long> rNumber = qnaService.rNum();

		mv.addObject("listNo", rNumber);
		mv.addObject("list", ar);
		mv.addObject("pager", pager);
		mv.setViewName("board/boardList");
		return mv;
	}

	@GetMapping("qnaReply")
	public ModelAndView boardReply(ModelAndView mv, long num, HttpSession session) throws Exception {

		// interceptor
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		// 조회글
		BoardVO boardVO = qnaService.boardSelect(num);
		QnaVO qnaVO = (QnaVO) qnaService.boardSelect(num);
		// 원글
		String idCompare = qnaService.refId(qnaVO.getRef());
		System.out.println(idCompare);

		mv.setViewName("nav/page404");

		if (boardVO.getId().equals(memberVO.getId()) || memberVO.getId().equals("admin")
				|| memberVO.getId().equals(idCompare)) {
			mv.addObject("vo", boardVO);

			mv.addObject("num", num);
			mv.setViewName("board/boardReply");
		}
		return mv;
	}

	@PostMapping("qnaReply")
	public ModelAndView boardReply(ModelAndView mv, QnaVO qnaVO) throws Exception {
		int result = qnaService.boardReply(qnaVO);

		if (result > 0) {
			mv.setViewName("redirect:./qnaList");
		} else {
			mv.addObject("result", "답변 달기 실패");
			mv.addObject("path", "./qnaList");
			mv.setViewName("common/result");
		}

		return mv;
	}

}

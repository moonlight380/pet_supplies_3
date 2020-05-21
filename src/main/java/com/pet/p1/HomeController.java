package com.pet.p1;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.pet.p1.board.BoardVO;
import com.pet.p1.notice.NoticeService;
import com.pet.p1.review.ReviewService;
import com.pet.p1.util.Pager;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	private NoticeService noticeService;
	@Autowired
	private ReviewService reviewService;
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) throws Exception {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		//noticeList receive
		Pager pager = new Pager();
		List<BoardVO> ar = noticeService.boardList(pager);
		model.addAttribute("nlist", ar);
		
		//review receive
		Pager pager2 = new Pager();
		List<BoardVO> ar2 = reviewService.boardList(pager2);
		model.addAttribute("rlist", ar2);

		return "index";
	}
	
}

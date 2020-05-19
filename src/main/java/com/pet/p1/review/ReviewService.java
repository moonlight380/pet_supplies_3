package com.pet.p1.review;

import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.pet.p1.board.BoardService;
import com.pet.p1.board.BoardVO;
import com.pet.p1.board.file.BoardFileDAO;
import com.pet.p1.board.file.BoardFileVO;
import com.pet.p1.util.FileSaver;
import com.pet.p1.util.Pager;

@Service
public class ReviewService implements BoardService {

	@Autowired
	private ReviewDAO reviewDAO;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private BoardFileDAO boardFileDAO;
	@Autowired
	private ServletContext servletContext;

	public int boardReply(BoardVO boardVO) throws Exception {
		int result = reviewDAO.boardReplyUpdate(boardVO);
		result = reviewDAO.boardReply(boardVO);
		return result;
	}

	@Override
	public List<BoardVO> boardList(Pager pager) throws Exception {

		pager.makeRow();

		pager.makePage(reviewDAO.boardCount(pager));

		return reviewDAO.boardList(pager);
	}

	public List<BoardVO> pboardList(long productNum) throws Exception {

		return reviewDAO.pboardList(productNum);
	}

	@Override
	public BoardVO boardSelect(long num) throws Exception {
		reviewDAO.hitUpdate(num);
		return reviewDAO.boardSelect(num);
	}

	@Override
	public int boardWrite(BoardVO boardVO, MultipartFile[] files) throws Exception {
		// 1. sequnce num qna table insert
		int result = reviewDAO.boardWrite(boardVO);

		// 3. HDD에 파일저장하고 boardFile table insert
		String path = servletContext.getRealPath("/resources/reviewUpload");

		for (MultipartFile file : files) {
			BoardFileVO boardFileVO = new BoardFileVO();
			String fileName = fileSaver.saveByTransfer(file, path);
			boardFileVO.setNum(boardVO.getNum());
			boardFileVO.setFileName(fileName);
			boardFileVO.setOriName(file.getOriginalFilename());
			boardFileVO.setBoard(3);
			boardFileDAO.fileInsert(boardFileVO);
		}

		return result;
	}

	@Override
	public int boardUpdate(BoardVO boardVO, MultipartFile[] files) throws Exception {
		// TODO Auto-generated method stub
		String path = servletContext.getRealPath("/resources/reviewUpload");
		System.out.println(path);
		int result = reviewDAO.boardUpdate(boardVO);

		for (MultipartFile multipartFile : files) {

			if (multipartFile.getSize() > 0) {
				String fileName = fileSaver.saveByUtils(multipartFile, path);
				BoardFileVO boardFileVO = new BoardFileVO();
				boardFileVO.setNum(boardVO.getNum());
				boardFileVO.setFileName(fileName);
				boardFileVO.setOriName(multipartFile.getOriginalFilename());
				boardFileVO.setBoard(3);
				result = boardFileDAO.fileInsert(boardFileVO);

				if (result < 1) {
					throw new Exception();
				}
			}
		}

		return 0;
	}

	@Override
	public int boardDelete(long num) throws Exception {
		// TODO Auto-generated method stub
		List<BoardFileVO> list = boardFileDAO.fileList(num);

		String path = servletContext.getRealPath("/resources/reviewUpload");
		System.out.println(path);
		for (BoardFileVO boardFileVO : list) {
			fileSaver.deleteFile(boardFileVO.getFileName(), path);
		}

		boardFileDAO.fileDeleteAll(num);
		return reviewDAO.boardDelete(num);
	}

}

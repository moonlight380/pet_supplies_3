package com.pet.p1.qna;

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
public class QnaService implements BoardService {

	@Autowired
	private QnaDAO qnaDAO;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private BoardFileDAO boardFileDAO;
	@Autowired
	private ServletContext servletContext;

	public int boardReply(BoardVO boardVO) throws Exception {
		int result = qnaDAO.boardReplyUpdate(boardVO);
		result = qnaDAO.boardReply(boardVO);
		return result;
	}

	@Override
	public List<BoardVO> boardList(Pager pager) throws Exception {

		pager.makeRow();

		pager.makePage(qnaDAO.boardCount(pager));

		return qnaDAO.boardList(pager);
	}

	@Override
	public BoardVO boardSelect(long num) throws Exception {
		// qnaDAO.hitUpdate(num);
		return qnaDAO.boardSelect(num);
	}

	@Override
	public int boardWrite(BoardVO boardVO, MultipartFile[] files) throws Exception {
		// 1. sequnce num qna table insert
		int result = qnaDAO.boardWrite(boardVO);

		// 3. HDD에 파일저장하고 boardFile table insert
		String path = servletContext.getRealPath("/resources/qnaUpload");

		for (MultipartFile file : files) {
			if (file.getSize() > 0) {
				BoardFileVO boardFileVO = new BoardFileVO();
				String fileName = fileSaver.saveByTransfer(file, path);
				boardFileVO.setNum(boardVO.getNum());
				boardFileVO.setFileName(fileName);
				boardFileVO.setOriName(file.getOriginalFilename());
				boardFileVO.setBoard(2);
				boardFileDAO.fileInsert(boardFileVO);
				if (result < 1) {
					throw new Exception();
				}
			}
		}
		return result;
	}

	@Override
	public int boardUpdate(BoardVO boardVO, MultipartFile[] files) throws Exception {
		// TODO Auto-generated method stub
		String path = servletContext.getRealPath("/resources/qnaUpload");
		System.out.println(path);
		int result = qnaDAO.boardUpdate(boardVO);

		for (MultipartFile multipartFile : files) {

			if (multipartFile.getSize() > 0) {
				String fileName = fileSaver.saveByUtils(multipartFile, path);
				BoardFileVO boardFileVO = new BoardFileVO();
				boardFileVO.setNum(boardVO.getNum());
				boardFileVO.setFileName(fileName);
				boardFileVO.setOriName(multipartFile.getOriginalFilename());
				boardFileVO.setBoard(2);
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

		String path = servletContext.getRealPath("/resources/qnaUpload");
		for (BoardFileVO boardFileVO : list) {
			fileSaver.deleteFile(boardFileVO.getFileName(), path);
		}

		boardFileDAO.fileDeleteAll(num);
		return qnaDAO.boardDelete(num);
	}

	public long minNum(long num) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.minNum(num);
	}

	public long maxNum(long num) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.maxNum(num);
	}

	public List<Long> rNum() throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.rNum();
	}

	public String refId(long num) throws Exception {
		// TODO Auto-generated method stub
		return qnaDAO.refId(num);
	}

}

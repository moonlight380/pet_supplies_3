package com.pet.p1.notice;
import java.util.List;
import com.pet.p1.board.BoardVO;
import com.pet.p1.board.file.BoardFileVO;

public class NoticeVO extends BoardVO {
	
	private List<BoardFileVO> boardFileVOs;

	public List<BoardFileVO> getBoardFileVOs() {
		return boardFileVOs;
	}

	public void setBoardFileVOs(List<BoardFileVO> boardFileVOs) {
		this.boardFileVOs = boardFileVOs;
	}
}

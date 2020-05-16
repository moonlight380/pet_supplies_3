package com.pet.p1.review;

import java.util.List;


import com.pet.p1.board.BoardVO;
import com.pet.p1.board.file.BoardFileVO;

public class ReviewVO extends BoardVO {

	private long ref;
	private long step;
	private long depth;
	private List<BoardFileVO> boardFileVOs;

	public long getRef() {
		return ref;
	}

	public void setRef(long ref) {
		this.ref = ref;
	}

	public long getStep() {
		return step;
	}

	public void setStep(long step) {
		this.step = step;
	}

	public long getDepth() {
		return depth;
	}

	public void setDepth(long depth) {
		this.depth = depth;
	}

	public List<BoardFileVO> getBoardFileVOs() {
		return boardFileVOs;
	}

	public void setBoardFileVOs(List<BoardFileVO> boardFileVOs) {
		this.boardFileVOs = boardFileVOs;
	}

}

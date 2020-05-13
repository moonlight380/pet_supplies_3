package com.pet.p1.board;

import java.util.List;

import com.pet.p1.util.Pager;

public interface BoardDAO {

	// 페이지 총 갯수 확인
	public long boardCount(Pager pager) throws Exception;

	// 게시판 리스트
	public List<BoardVO> boardList(Pager pager) throws Exception;

	// 특정 게시물 내용보기
	public BoardVO boardSelect(long num) throws Exception;

	// 게시물 작성
	public int boardWrite(BoardVO boardVO) throws Exception;

	// 게시물 삭제
	public int boardDelete(long num) throws Exception;

	// 게시물 업데이트
	public int boardUpdate(BoardVO boardVO) throws Exception;

	// 조회수 업데이트
	public int hitUpdate(long num) throws Exception;
}

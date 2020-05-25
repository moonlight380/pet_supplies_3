package com.pet.p1.notice;

import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.p1.board.BoardDAO;
import com.pet.p1.board.BoardVO;
import com.pet.p1.util.Pager;
import java.sql.Connection;

@Repository
public class NoticeDAO implements BoardDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE = "com.pet.p1.notice.NoticeDAO.";

	public long boardNum() throws Exception {
		return sqlSession.selectOne(NAMESPACE + "boardNum");
	}

	@Override
	public long boardCount(Pager pager) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "boardCount", pager);
	}

	@Override
	public List<BoardVO> boardList(Pager pager) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.selectList(NAMESPACE + "boardList", pager);
	}

	@Override
	public BoardVO boardSelect(long num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "boardSelect", num);
	}

	@Override
	public int boardWrite(BoardVO boardVO) throws Exception {
		return sqlSession.insert(NAMESPACE + "boardWrite", boardVO);

	}

	@Override
	public int boardDelete(long num) throws Exception {
		return sqlSession.delete(NAMESPACE + "boardDelete", num);
	}

	@Override
	public int boardUpdate(BoardVO boardVO) throws Exception {
		return sqlSession.update(NAMESPACE + "boardUpdate", boardVO);
	}

	@Override
	public int hitUpdate(long num) throws Exception {
		// TODO Auto-generated method stub
		return sqlSession.update(NAMESPACE + "hitUpdate", num);
	}
	public long minNum(long num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "minNum", num);
	}
	public long maxNum(long num) throws Exception {
		return sqlSession.selectOne(NAMESPACE + "maxNum", num);
	}
}

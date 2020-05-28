package com.pet.p1.member;


import java.util.List;


import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.p1.memberReview.MemberReviewVO;
import com.pet.p1.util.Pager;

@Repository
public class MemberDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.pet.p1.member.MemberDAO.";
	

	public List<MemberReviewVO> memberReview(MemberVO memberVO)throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberReview",memberVO);
	}
	
	
	public Long couponCount(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"couponCount",memberVO);
	}
	

	public int pwUpdate(MemberVO memberVO)throws Exception{
		return sqlSession.update(NAMESPACE+"pwUpdate", memberVO);
	}
	
	public Long memberCart(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberCart", memberVO);
	}
	
	public Long memberCount(Pager memberPager) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberCount", memberPager);
	}
	
	public List<MemberVO> memberList(Pager memberPager)throws Exception{
		return sqlSession.selectList(NAMESPACE+"memberList", memberPager);
	}
	
	public MemberVO memberLogin(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberLogin", memberVO);
	}
	
	public int memberJoin(MemberVO memberVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"memberJoin", memberVO);
	}
	
	public int snsJoin(MemberVO memberVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"snsJoin", memberVO);
	}
	
	public MemberVO snsLogin(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"snsLogin", memberVO);
	}
	
	public int memberUpdate(MemberVO memberVO)throws Exception{
		return sqlSession.update(NAMESPACE+"memberUpdate", memberVO);
	}
	
	public MemberVO selectPW(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"selectPW", memberVO);
	}
	
	public int memberDelete(MemberVO memberVO)throws Exception{
		return sqlSession.delete(NAMESPACE+"memberDelete", memberVO);
	}
	
	public MemberVO memberEMCheck(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberEMCheck", memberVO);
	}
	
	public MemberVO memberIdCheck(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"memberIdCheck",memberVO);
	}
	
	public MemberVO findPhone(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"findPhone", memberVO);
	}
	
	public int memberDeletes(List<String> list)throws Exception{
		return sqlSession.delete(NAMESPACE+"memberDeletes", list);
	}
	
	public Long orderCount(MemberVO memberVO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"orderCount",memberVO);
	}
	
	public int pointUpdate(MemberVO memberVO)throws Exception{
		return sqlSession.update(NAMESPACE+"pointUpdate", memberVO);
	}

}
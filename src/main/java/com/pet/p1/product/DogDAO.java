package com.pet.p1.product;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.pet.p1.product.file.ProductFileVO;
import com.pet.p1.util.Pager;

@Repository
public class DogDAO {

	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="com.pet.p1.product.DogDAO.";

//dual에서 먼저 조회
	public long dogNum() throws Exception{
			return sqlSession.selectOne(NAMESPACE+"dogNum");
	}
//list
	public List<DogVO> dogList(Pager pager) throws Exception{
		
		return sqlSession.selectList(NAMESPACE+"dogList",pager);
	}
	
//dogNewList
	public List<DogVO> dogNewList(Pager pager) throws Exception{
			
		return sqlSession.selectList(NAMESPACE+"dogNewList",pager);
	}
	
//dogBestList
	public List<DogVO> dogBestList(Pager pager) throws Exception{
			
		return sqlSession.selectList(NAMESPACE+"dogBestList",pager);
	}		
	
//dogTimeSale
	public List<DogVO> dogTimeSale(Pager pager) throws Exception{
				
		return sqlSession.selectList(NAMESPACE+"dogTimeSale",pager);
	}	

//count
	public long dogCount(Pager pager) throws Exception {
		
		return sqlSession.selectOne(NAMESPACE+"dogCount", pager);
	}
//dogWrite(insert)
	public int dogWrite(DogVO dogVO)throws Exception{
		System.out.println("dogDAO");
		return sqlSession.insert(NAMESPACE+"dogWrite",dogVO);
	}
	
	
//SELECT
	public DogVO dogSelect(DogVO dogVO) throws Exception {
		return sqlSession.selectOne(NAMESPACE+"dogSelect", dogVO);
	}
//dogSelectTimeSale
	public DogVO dogSelectTimeSale(DogVO dogVO) throws Exception {	
		return sqlSession.selectOne(NAMESPACE+"dogSelectTimeSale", dogVO);
	}
//timeSaleUpdate
	public int timeSaleUpdate(List<Long> list) throws Exception{
		System.out.println("타임세일업데이트DAO");
	
		return sqlSession.update(NAMESPACE+"timeSaleUpdate", list);
	}
	
//update
	public int dogUpdate(DogVO dogVO) throws Exception{
	
		return sqlSession.update(NAMESPACE+"dogUpdate",dogVO);
	}
//HIT UPDATE
	public int hitUpdate(DogVO dogVO) throws Exception {
	
		return sqlSession.update(NAMESPACE+"hitUpdate", dogVO);
	}

//DELETE
	public int dogDelete(long productNum) throws Exception {
		System.out.println("DAO");
		return sqlSession.delete(NAMESPACE+"dogDelete",productNum);
	}

//fileList
	public List<ProductFileVO> fileList(long productNum) throws Exception{
		return sqlSession.selectList(NAMESPACE+"fileList", productNum);
	}
	
}//end class


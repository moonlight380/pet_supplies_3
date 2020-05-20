package com.pet.p1.address;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddressDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="com.pet.p1.address.AddressDAO.";
	
	//address_insert
	public int address_insert(AddressVO addressVO)throws Exception{
		return sqlSession.insert(NAMESPACE+"address_insert",addressVO);
	}
	
	//address_list
	public List<AddressVO> address_list(AddressVO addressVO)throws Exception{		
		return sqlSession.selectList(NAMESPACE+"address_list", addressVO);
	}
	
	
	//address_select
	public AddressVO address_select(long addressNum)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"address_select", addressNum);
	}
	
	
	//address_update
	public int address_update(AddressVO addressVO)throws Exception{
		return sqlSession.update(NAMESPACE+"address_update", addressVO);
	}
	
	//address_delete
	public int address_delete(List<Long> deleteAddress)throws Exception{
		System.out.println("address_delete_DAO");
		return sqlSession.delete(NAMESPACE+"address_delete", deleteAddress);
	}

}

package com.pet.p1.address;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AddressDAO {
	
	@Autowired
	private SqlSession sqlSession;
	private final String NAMESPACE ="com.pet.p1.address.AddressDAO.";

	public int address_insert(AddressVO addressVO)throws Exception{
		System.out.println("addressVO");
		return sqlSession.insert(NAMESPACE+"address_insert",addressVO);
	}
}

package com.pet.p1.address;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional//알아서 롤백
public class AddressService {
	@Autowired
	private AddressDAO addressDAO;
	
	
	
	public int address_insert(AddressVO addressVO)throws Exception{
		 int result= addressDAO.address_insert(addressVO);
		return result;
	}
	
	
}

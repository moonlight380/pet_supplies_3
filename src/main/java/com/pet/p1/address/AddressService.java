package com.pet.p1.address;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional//알아서 롤백
public class AddressService {
	@Autowired
	private AddressDAO addressDAO;
	
	
	//address_insert
	public int address_insert(AddressVO addressVO)throws Exception{
		 int result= addressDAO.address_insert(addressVO);
		return result;
	}
	//address_list
	public List<AddressVO> address_list (AddressVO addressVO)throws Exception{
		
		return addressDAO.address_list(addressVO);
	}
	
	//address_select
	public AddressVO address_select (long addressNum) throws Exception{
		return addressDAO.address_select(addressNum);
	}
	
	
	//address_update
	public int address_update (AddressVO addressVO)throws Exception{
		return addressDAO.address_update(addressVO);
	}
	
	//address_delete
	public int address_delete (List<Long> deleteAddress)throws Exception{
		return addressDAO.address_delete(deleteAddress);
	}
	
}

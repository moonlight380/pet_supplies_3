package com.pet.p1.product.file;

import static org.junit.Assert.assertEquals;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class ProductFile {
	@Autowired
	private ProductFileDAO productFileDAO;
	
	@Test
	public void fileService() throws Exception{
		
		ProductFileVO productFileVO = new ProductFileVO(); // 한번 돌때마다 새로운 파일
		productFileVO.setNum(productFileVO.getNum());//productTable에 글을 인서트하면 이 파일이 누구의 글에 있는 파일이냐
		productFileVO.setFileName("fileName");
		productFileVO.setOriName("file");
		productFileVO.setBoard(1);
		productFileVO.setFileNum(85);
		int result=productFileDAO.fileInsert(productFileVO);
		assertEquals(1, result);
	}

}

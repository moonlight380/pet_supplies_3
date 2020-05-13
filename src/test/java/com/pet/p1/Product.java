package com.pet.p1;

import static org.junit.Assert.*;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.pet.p1.product.DogDAO;
import com.pet.p1.product.DogVO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/**/*-context.xml"})
public class Product {

	@Autowired
	private SqlSession sql;
	@Autowired
	private DogVO dogVO;
	@Autowired
	private DogDAO dogDAO;
	
	@Test
	public void test() throws Exception{
		
		dogVO.setContents("contents");
		
		dogVO.setPrice(10000);
		dogVO.setProductName("name");
		dogVO.setContents("contents");
		int result=dogDAO.dogWrite(dogVO);
	}

}

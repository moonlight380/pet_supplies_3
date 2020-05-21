package com.pet.p1.product;

import java.util.Arrays;
import java.util.Collection;
import java.util.List;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.pet.p1.product.file.ProductFileDAO;
import com.pet.p1.product.file.ProductFileVO;
import com.pet.p1.util.FileSaver;
import com.pet.p1.util.Pager;

@Service
@Transactional //알아서 롤백
public class DogService {
	@Autowired
	private DogDAO dogDAO;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileSaver fileSaver;
	@Autowired
	private ProductFileDAO productFileDAO;
	
//dogList	
	public List<DogVO> dogList(Pager pager) throws Exception{
		pager.makeRow();
		
		long totalCount= dogDAO.dogCount(pager);
		pager.makePage(totalCount);
		
		
		return dogDAO.dogList(pager);
	}
//dogNewList	
	public List<DogVO> dogNewList(Pager pager) throws Exception{
		pager.makeRow();
		long totalCount= dogDAO.dogCount(pager);
		pager.makePage(totalCount);
		
		return dogDAO.dogNewList(pager);
	}	
//dogBestList	
	public List<DogVO> dogBestList(Pager pager) throws Exception{
		pager.makeRow();
		long totalCount= dogDAO.dogCount(pager);
		pager.makePage(totalCount);		
		return dogDAO.dogBestList(pager);
	}	

//dogTimeSale	
	public List<DogVO> dogTimeSale(Pager pager) throws Exception{
		pager.makeRow();
		long totalCount= dogDAO.dogCount(pager);
		pager.makePage(totalCount);
		System.out.println("dogTimeSale	sevice in");
		return dogDAO.dogTimeSale(pager);
	}	
	
//dogWrite(insert)
	public int dogWrite(DogVO dogVO,MultipartFile firstFile, MultipartFile[] files) throws Exception {
		String path = servletContext.getRealPath("/resources/dogUpload");
		
		System.out.println(path);
		
		
		//시퀀스 번호 받기 dual로 맵퍼에서 가져옴
		dogVO.setProductNum(dogDAO.dogNum());
		
		//dogDAO table insert
		int result=dogDAO.dogWrite(dogVO);
		
		///------------------------ 대표 이미지
		if(firstFile.getSize()>0) {
			ProductFileVO productFileVO = new ProductFileVO(); // 한번 돌때마다 새로운 파일
			String fileName=fileSaver.saveByTransfer(firstFile,  path);
			productFileVO.setNum(dogVO.getProductNum());//productTable에 글을 인서트하면 이 파일이 누구의 글에 있는 파일이냐
			productFileVO.setFileName(fileName);
			productFileVO.setOriName(firstFile.getOriginalFilename());
			productFileVO.setBoard(1);
			productFileVO.setFirstFile(0);
			productFileDAO.fileInsert(productFileVO); //파일의 갯수만큼이라서 반복문 안에
		
		}
		//-------------------------------
		
		for(MultipartFile file:files) {
			if(file.getSize()>0) {
			ProductFileVO productFileVO = new ProductFileVO(); // 한번 돌때마다 새로운 파일
			String fileName=fileSaver.saveByTransfer(file, path);
			productFileVO.setNum(dogVO.getProductNum());//productTable에 글을 인서트하면 이 파일이 누구의 글에 있는 파일이냐
			productFileVO.setFileName(fileName);
			productFileVO.setOriName(file.getOriginalFilename());
			productFileVO.setBoard(1);
			productFileVO.setFirstFile(1);
			productFileDAO.fileInsert(productFileVO); //파일의 갯수만큼이라서 반복문 안에
			}
		}
		
		return result;
	}
	
	
	
//select
	
	public DogVO dogSelect(long productNum) throws Exception {
		dogDAO.hitUpdate(productNum);
		return dogDAO.dogSelect(productNum);
	}
	
	
	
//update
	public int dogUpdate (DogVO dogVO,MultipartFile firstFile, MultipartFile[] files) throws Exception{	
		
String path = servletContext.getRealPath("/resources/dogUpload");
		
		System.out.println(path);
		
		//dogDAO table insert
		int result=dogDAO.dogUpdate(dogVO);
		
		///------------------------ 대표 이미지
		if(firstFile.getSize()>0) {
			ProductFileVO productFileVO = new ProductFileVO(); 
			
			String fileName=fileSaver.saveByTransfer(firstFile,path);
			productFileVO.setNum(dogVO.getProductNum());//productTable에 글을 인서트하면 이 파일이 누구의 글에 있는 파일이냐
			productFileVO.setFileName(fileName);
			productFileVO.setOriName(firstFile.getOriginalFilename());
			productFileVO.setBoard(1);
			productFileVO.setFirstFile(0);
			int result2=productFileDAO.fileInsert(productFileVO); //파일의 갯수만큼이라서 반복문 안에
			System.out.println(result2);
		}
		//-------------------------------
		
		for(MultipartFile file:files) {
			if(file.getSize()>0) {
			ProductFileVO productFileVO = new ProductFileVO(); // 한번 돌때마다 새로운 파일
			String fileName=fileSaver.saveByTransfer(file, path);
			productFileVO.setNum(dogVO.getProductNum());//productTable에 글을 인서트하면 이 파일이 누구의 글에 있는 파일이냐
			productFileVO.setFileName(fileName);
			productFileVO.setOriName(file.getOriginalFilename());
			productFileVO.setBoard(1);
			productFileVO.setFirstFile(1);
			productFileDAO.fileInsert(productFileVO); //파일의 갯수만큼이라서 반복문 안에
			}
		}
		
		return result;
		
		
		
		
	}
	
//delete
	public int dogDelete(long productNum) throws Exception {
		List<ProductFileVO>list=productFileDAO.fileList(productNum);
		//1.하드디스크에서 해당 파일들을 삭제
		String path = servletContext.getRealPath("/resources/dogUpload");
		System.out.println(path); //잘 지워졌나 확인해 보기 위해서
		
		for(ProductFileVO productFileVO:list) {
			FileSaver fileSaver= new FileSaver();
			fileSaver.deleteFile(productFileVO.getFileName(),path);
			}
		//2.데이터베이스에서 삭제
		int result=productFileDAO.fileDeleteAll(productNum);
		
		if(result>0) {
			System.out.println("데이터베이스 삭제 성공");
		}else {
			System.out.println("데이터베이스 삭제 실패");
		}
		
		return dogDAO.dogDelete(productNum);
	}
	
}//end class

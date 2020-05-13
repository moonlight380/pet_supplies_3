package com.pet.p1.product.file;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.pet.p1.util.FileSaver;

@Service
@Transactional //알아서 롤백
public class ProductFileService {
	@Autowired
	private ProductFileDAO productFileDAO;
	@Autowired
	private ServletContext servletContext;
	@Autowired
	private FileSaver fileSaver;
	
////////////////////////////fileInsert (summer)//////////////////////////////
	public String fileInsert(MultipartFile files) throws Exception{
		//1.HDD 저장
		String path=servletContext.getRealPath("/resources/summer");
		System.out.println(path);
		path=fileSaver.saveByTransfer(files, path);
		path=servletContext.getContextPath()+"/resources/summer/"+path;
		//getContextPath():web application의 Server측 Path 취득

		return path;
	}	
//////////////////////////////////fileSelect//////////////////////////
	public ProductFileVO fileSelect(ProductFileVO productFileVO)throws Exception{
		
		return productFileDAO.fileSelect(productFileVO);
	}

///////////////////////fileDelete_productFileVO/////////////////////
	public int fileDelete(ProductFileVO productFileVO)throws Exception{
	productFileVO=productFileDAO.fileSelect(productFileVO);// 번호 받아오고
	int result=productFileDAO.fileDelete(productFileVO);
	String board="dogUpload";
	if(productFileVO.getBoard()==2) {
		board="catUpload";
	}
	//HDD에서 삭제
	String path=servletContext.getRealPath("/resources/"+board);
	
	return result;
	}
	
	
///////////////////////////fileDelete(summer)////////////////////////////////
	public int fileDelete(String fileName) throws Exception{
		//1. HDD 삭제 (summer)
		String path= servletContext.getRealPath("/resources/summer");
		int result=fileSaver.deleteFile(fileName, path); //숫자를 리턴해서 int
		
		return result;
	}	
	
	
}//end productFileService

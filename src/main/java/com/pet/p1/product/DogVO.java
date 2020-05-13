package com.pet.p1.product;

import java.sql.Date;
import java.util.List;
import com.pet.p1.product.file.ProductFileVO;


public class DogVO {
	
	private long productNum;
	private String productName;
	private long price;
	private String contents;
	private long amount;
	private long hit;
	private Date regDate;
	private List<ProductFileVO> productFileVOs;
	private long point;
	

	public long getPoint() {
		return point;
	}
	public void setPoint(long point) {
		this.point = point;
	}
	
	public List<ProductFileVO> getProductFileVOs() {
		return productFileVOs;
	}
	public void setProductFileVOs(List<ProductFileVO> productFileVOs) {
		this.productFileVOs = productFileVOs;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public long getPrice() {
		return price;
	}
	public void setPrice(long price) {
		this.price = price;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	public long getHit() {
		return hit;
	}
	public void setHit(long hit) {
		this.hit = hit;
	}
	
	
	

}

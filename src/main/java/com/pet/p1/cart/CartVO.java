package com.pet.p1.cart;

public class CartVO {
	private String id;
	private long cnum;
	private long productNum;
	private long cAmount;
	private String productName;
	private long price;
	private String fileName;
	private long sale;
	
	
	
	
	
	
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
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
	public long getPoint() {
		return point;
	}
	public void setPoint(long point) {
		this.point = point;
	}
	private long point;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public long getCnum() {
		return cnum;
	}
	public void setCnum(long cnum) {
		this.cnum = cnum;
	}
	public long getProductNum() {
		return productNum;
	}
	public void setProductNum(long productNum) {
		this.productNum = productNum;
	}
	public long getcAmount() {
		return cAmount;
	}
	public void setcAmount(long cAmount) {
		this.cAmount = cAmount;
	}
	public long getSale() {
		return sale;
	}
	public void setSale(long sale) {
		this.sale = sale;
	}
	
	
}

package com.pet.p1.orderInfo;

import java.sql.Date;

public class OrderInfoVO {
	
	
	private long orderNum;
	private String id;
	private long productNum;
	private String productName;
	private long price;
	private long amount;
	private Date regDate;
	private long point;
	private String fileName;
	private long priceAll;
	private long charge;
	private long orderCheck;
	
	
	public long getOrderCheck() {
		return orderCheck;
	}
	public void setOrderCheck(long orderCheck) {
		this.orderCheck = orderCheck;
	}
	public long getPriceAll() {
		return priceAll;
	}
	public void setPriceAll(long priceAll) {
		this.priceAll = priceAll;
	}
	public long getCharge() {
		return charge;
	}
	public void setCharge(long charge) {
		this.charge = charge;
	}
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
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
	public long getAmount() {
		return amount;
	}
	public void setAmount(long amount) {
		this.amount = amount;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public long getPoint() {
		return point;
	}
	public void setPoint(long point) {
		this.point = point;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	
}

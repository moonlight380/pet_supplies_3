package com.pet.p1.order;

import java.sql.Date;

public class OrderVO {

	
	private long orderNum;
	private long priceAll;
	private String id;
	private Date pDate;
	private long coupon;
	private String charge;
	private long orNum;
	public long getOrderNum() {
		return orderNum;
	}
	public void setOrderNum(long orderNum) {
		this.orderNum = orderNum;
	}
	public long getPriceAll() {
		return priceAll;
	}
	public void setPriceAll(long priceAll) {
		this.priceAll = priceAll;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Date getpDate() {
		return pDate;
	}
	public void setpDate(Date pDate) {
		this.pDate = pDate;
	}
	public long getCoupon() {
		return coupon;
	}
	public void setCoupon(long coupon) {
		this.coupon = coupon;
	}
	public String getCharge() {
		return charge;
	}
	public void setCharge(String charge) {
		this.charge = charge;
	}
	public long getOrNum() {
		return orNum;
	}
	public void setOrNum(long orNum) {
		this.orNum = orNum;
	}
	
}

package com.pet.p1.board;

import java.sql.Date;

public class BoardVO {
	
	private long num;
	private String title;
	private String id;
	private String contents;
	private Date regDate;
	private long hit;

	public long getNum() {
		return num;
	}

	public void setNum(long num) {
		this.num = num;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public long getHit() {
		return hit;
	}

	public void setHit(long hit) {
		this.hit = hit;
	}

}

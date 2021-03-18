package com.jmt.indiego.vo;

import java.sql.Date;

public class Portfolio {
	private int no,userNo;
	private String title,fileName,image;
	private Date regdate;
	
	public Portfolio() {
	}
	
	public Portfolio(int userNo,String title, String image, String fileName) {
		super();
		this.userNo=userNo;
		this.title = title;
		this.fileName = fileName;
		this.image = image;
	}

	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getUserNo() {
		return userNo;
	}
	public void setUserNo(int userNo) {
		this.userNo = userNo;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	
	
}

package com.jmt.indiego.vo;

import java.sql.Timestamp;

public class Likes {
	private int no,userNo,contentsNo;
	private String type,prosCons;
	private Timestamp regdate;
	
	public Likes() {
		// TODO Auto-generated constructor stub
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

	public int getContentsNo() {
		return contentsNo;
	}

	public void setContentsNo(int contentsNo) {
		this.contentsNo = contentsNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getProsCons() {
		return prosCons;
	}

	public void setProsCons(String prosCons) {
		this.prosCons = prosCons;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
}

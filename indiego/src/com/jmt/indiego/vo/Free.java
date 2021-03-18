package com.jmt.indiego.vo;

import java.sql.Timestamp;

public class Free {
	private int no, views, userNo, replynum , likenum;
	private String title, contents,nickName,regdateTo;
	private Timestamp regdate;
	

	
	
	
	public int getReplynum() {
		return replynum;
	}


	public void setReplynum(int replynum) {
		this.replynum = replynum;
	}


	public int getLikenum() {
		return likenum;
	}


	public void setLikenum(int likenum) {
		this.likenum = likenum;
	}


	public Free() {
		
	}
	
	
	public String getRegdateTo() {
		return regdateTo;
	}


	public void setRegdateTo(String regdateTo) {
		this.regdateTo = regdateTo;
	}


	public String getNickName() {
		return nickName;
	}


	public void setNickName(String nickName) {
		this.nickName = nickName;
	}


	public Free(int no, int views) {
		this.no=no;
		this.views=views;
	}
	

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public int getViews() {
		return views;
	}

	public void setViews(int views) {
		this.views = views;
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

	public String getContents() {
		return contents;
	}

	public void setContents(String contents) {
		this.contents = contents;
	}

	public Timestamp getRegdate() {
		return regdate;
	}

	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}

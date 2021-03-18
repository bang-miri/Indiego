package com.jmt.indiego.vo;

import java.sql.Date;
import java.sql.Timestamp;
import java.util.Calendar;

public class Project {
//NO	TITLE	GAME_TITLE	START_DATE	END_DATE	MAX_PERSONNEL	VISIBILITY	SYSTEM	IMAGE	REGDATE	GENRE_NO	USER_NO	

	private int no , maxPersonnel , genreNo , userNo , count;
	private String title , gameTitle , visivility , system , image , userName;
	private Date startDate , endDate;
	private Timestamp regDate;
	private String launchingV;
	
	
	
	public Project() {
		// TODO Auto-generated constructor stub
	
	}
	public Project(String title,Date startDate, int maxPersonnel,String visivility, int userNo,   String launchingV) {
		super();
		this.maxPersonnel = maxPersonnel;
		this.userNo = userNo;
		this.title = title;
		this.visivility = visivility;
		this.startDate = startDate;
		this.launchingV = launchingV;
	}

	public int getCount() {
		return count;
	}


	public void setCount(int count) {
		this.count = count;
	}


	public String getUserName() {
		return userName;
	}


	public void setUserName(String userName) {
		this.userName = userName;
	}


	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getMaxPersonnel() {
		return maxPersonnel;
	}
	public void setMaxPersonnel(int maxPersonnel) {
		this.maxPersonnel = maxPersonnel;
	}
	public int getGenreNo() {
		return genreNo;
	}
	public void setGenreNo(int genreNo) {
		this.genreNo = genreNo;
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
	public String getGameTitle() {
		return gameTitle;
	}
	public void setGameTitle(String gameTitle) {
		this.gameTitle = gameTitle;
	}
	public String getVisivility() {
		return visivility;
	}
	public void setVisivility(String visivility) {
		this.visivility = visivility;
	}
	public String getSystem() {
		return system;
	}
	public void setSystem(String system) {
		this.system = system;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public Date getStartDate() {
		return startDate;
	}
	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}
	public Date getEndDate() {
		return endDate;
	}
	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}
	public Timestamp getRegDate() {
		return regDate;
	}
	public void setRegDate(Timestamp regDate) {
		this.regDate = regDate;
	}
	private int getStartTime(int type) {
		Calendar startDate=Calendar.getInstance();
		startDate.setTime(this.startDate);
		
		return startDate.get(type);
	}
	public int getStartDateYear() {
		return getStartTime(Calendar.YEAR);
	}
	public int getStartDateMonth() {
		return getStartTime(Calendar.MONTH)+1;
	}
	public int getStartDateDay() {
		return getStartTime(Calendar.DATE);
	}
	
	private int getEndTime(int type) {
		Calendar endDate=Calendar.getInstance();
		endDate.setTime(this.endDate);
		
		return endDate.get(type);
	}
	public int getEndDateYear() {
		return getEndTime(Calendar.YEAR);
	}
	public int getEndDateMonth() {
		return getEndTime(Calendar.MONTH)+1;
	}
	public int getEndDateDay() {
		return getEndTime(Calendar.DATE);
	}
	public String getFormatDate() {
		if(this.endDate==null) {
			return getStartDateYear()+"."+getStartDateMonth()+" ~ 진행중";
					
		}else {
			return getStartDateYear()+"."+getStartDateMonth()+" ~ "
					+getEndDateYear()+"."+getStartDateMonth();
		}
	}
	
	
}

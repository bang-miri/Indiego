package com.jmt.indiego.vo;

import java.sql.Date;
import java.util.Calendar;

public class Career {

	private int no,userNo;
	private String company,jobRank,job;
	private Date joinDate,leaveDate,regdate;
	public Career() {


	}
	
	
	public Career( int userNo, String company, String jobRank, String job, Date joinDate, Date leaveDate) {
		super();
		this.userNo = userNo;
		this.company = company;
		this.jobRank = jobRank;
		this.job = job;
		this.joinDate = joinDate;
		this.leaveDate = leaveDate;
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
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public String getJobRank() {
		return jobRank;
	}
	public void setJobRank(String jobRank) {
		this.jobRank = jobRank;
	}
	public String getJob() {
		return job;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public Date getJoinDate() {
		return joinDate;
	}
	public void setJoinDate(Date joinDate) {
		this.joinDate = joinDate;
	}
	public Date getLeaveDate() {
		return leaveDate;
	}
	public void setLeaveDate(Date leaveDate) {
		this.leaveDate = leaveDate;
	}
	public Date getRegdate() {
		return regdate;
	}
	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	private int getJoinTime(int type) {
		Calendar joinDate=Calendar.getInstance();
		joinDate.setTime(this.joinDate);
		
		return joinDate.get(type);
	}
	public int getJoinDateYear() {
		return getJoinTime(Calendar.YEAR);
	}
	public int getJoinDateMonth() {
		return getJoinTime(Calendar.MONTH)+1;
	}
	public int getJoinDateDay() {
		return getJoinTime(Calendar.DATE);
	}
	
	private int getLeaveTime(int type) {
		Calendar leaveDate=Calendar.getInstance();
		leaveDate.setTime(this.leaveDate);
		
		return leaveDate.get(type);
	}
	public int getleaveDateYear() {
		return getLeaveTime(Calendar.YEAR);
	}
	public int getleaveDateMonth() {
		return getLeaveTime(Calendar.MONTH)+1;
	}
	public int getleaveDateDay() {
		return getLeaveTime(Calendar.DATE);
	}
	public String getFormatDate() {
		
		
		return getJoinDateYear()+"."+getJoinDateMonth()+" ~ "+dateCompare(joinDate);
	}
	
	public String dateCompare(Date joinDate) {
		Calendar now =Calendar.getInstance();
		int year=now.get(Calendar.YEAR);
		int month=now.get(Calendar.MONTH)+1;
		int date=now.get(Calendar.DATE);

		Date Today=Date.valueOf(year+"-"+month+"-"+date);
		
		int compare=joinDate.compareTo(Today);
		if(compare>0) {
			return "재직중";
		}else {
			return getleaveDateYear()+"."+getleaveDateMonth();
		}
		
	}
	
}

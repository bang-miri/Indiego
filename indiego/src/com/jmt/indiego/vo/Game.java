package com.jmt.indiego.vo;

import java.sql.Date;
import java.sql.Timestamp;

public class Game {
	//NO	IMAGE	PRICE	SALE_PRICE	RELEASE_DATE	CONTENTS	EVALUATION	LIKES	DOWNLOADS	REGDATE	FILE_NAME	
	
	
	private int no , price , salePrice , likes , downloads;
	private String image , contents , fileName;
	private int evaluation;
	private Date releaseDate;
	private Timestamp regdate;

	
	private String gameName ,genre;
	
	
	public String getGameName() {
		return gameName;
	}


	public void setGameName(String gameName) {
		this.gameName = gameName;
	}


	public String getGenre() {
		return genre;
	}


	public void setGenre(String genre) {
		this.genre = genre;
	}

	
	
	
	
	
	

	public Game() {
		// TODO Auto-generated constructor stub
	}
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getSalePrice() {
		return salePrice;
	}
	public void setSalePrice(int salePrice) {
		this.salePrice = salePrice;
	}
	public int getLikes() {
		return likes;
	}
	public void setLikes(int likes) {
		this.likes = likes;
	}
	public int getDownloads() {
		return downloads;
	}
	public void setDownloads(int downloads) {
		this.downloads = downloads;
	}
	
	
	public String getImage() {
		return image;
	}


	public void setImage(String image) {
		this.image = image;
	}


	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getFileName() {
		return fileName;
	}
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	
	
	
	
	public int getEvaluation() {
		return evaluation;
	}


	public void setEvaluation(int evaluation) {
		this.evaluation = evaluation;
	}


	public Date getReleaseDate() {
		return releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.releaseDate = releaseDate;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
	
	
}

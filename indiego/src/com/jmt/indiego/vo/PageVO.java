package com.jmt.indiego.vo;

public class PageVO {
	
	private int start, end, typeNo;
	
	public PageVO() {
		// TODO Auto-generated constructor stub
	}
	
	public PageVO(int page, int numPage, int typeNo) {
		this(page,numPage);
		this.typeNo = typeNo;
	}

	public PageVO(int page, int numPage) {
		end = page*numPage;
		start = end-(numPage-1);
	}

	public int getTypeNo() {
		return typeNo;
	}

	public void setTypeNo(int typeNo) {
		this.typeNo = typeNo;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

}

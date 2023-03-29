package com.bit.web.vo;


public class PageBean {
	private int totalPage;
	private int start;
	private int end;
	private int currentPage;
	private int currentBlock;
	private int startPage;
	private int endPage;
	
	public PageBean() {
		super();
	}

	public PageBean(int totalPage, int start, int end, int currentPage, int currentBlock, int startPage, int endPage) {
		super();
		this.totalPage = totalPage;
		this.start = start;
		this.end = end;
		this.currentPage = currentPage;
		this.currentBlock = currentBlock;
		this.startPage = startPage;
		this.endPage = endPage;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
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

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getCurrentBlock() {
		return currentBlock;
	}

	public void setCurrentBlock(int currentBlock) {
		this.currentBlock = currentBlock;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	@Override
	public String toString() {
		return "PageBean [totalPage=" + totalPage + ", start=" + start + ", end=" + end + ", currentPage=" + currentPage
				+ ", currentBlock=" + currentBlock + ", startPage=" + startPage + ", endPage=" + endPage + "]";
	}
	
	
	

}

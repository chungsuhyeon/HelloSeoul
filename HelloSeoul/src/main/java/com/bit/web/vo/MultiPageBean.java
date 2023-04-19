package com.bit.web.vo;

import lombok.Data;

@Data
public class MultiPageBean {
	private int pageScale;
	private int blockScale;
	private int currentPage;
	private int currentBlock;
	private int totalPage;
	private int totalBlock;
	private int pageStart;
	private int pageEnd;
	
}

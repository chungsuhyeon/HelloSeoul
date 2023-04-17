package com.bit.web.vo;

import lombok.Data;

@Data
public class MultiPageBean {
	private int pageScale;
	private int blockStartNum;
	private int blockEndNum;
	private int lastPageNum;
}

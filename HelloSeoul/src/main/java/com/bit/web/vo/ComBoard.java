package com.bit.web.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ComBoard {
	private int com_no;
	private String user_id;
	private int com_ctg;
	private String com_title;
	private String com_cont;
	private String com_filename;
	private int com_hit;
	private String com_regdate;
	private String user_nick;
	private int good;
	private int bad;
	private int reply;
//	private MultipartFile file;
}

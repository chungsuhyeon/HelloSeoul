package com.bit.web.vo;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Fileupload {
	private String name;
	private MultipartFile file;
}

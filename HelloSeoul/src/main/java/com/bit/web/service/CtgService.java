package com.bit.web.service;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bit.web.vo.LocGunGuBean;

public interface CtgService {
	
	List<LocGunGuBean> readyForSg();
	
	String test(HttpServletRequest resq);
}

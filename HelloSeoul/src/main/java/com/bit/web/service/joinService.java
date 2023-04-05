package com.bit.web.service;

import java.util.HashMap;
import java.util.List;

import com.bit.web.vo.JoinSeoulBean;

public interface joinService {
	
	boolean ajaxGetId(String id); //아이디(email)중복체크
	
	boolean checkUsernick(String nickname); // nick name 중복체크
	
	List<Object> ajaxcontinent(String id); // 대륙선택 후 해당 국가 리스트로 
	
	
	
}
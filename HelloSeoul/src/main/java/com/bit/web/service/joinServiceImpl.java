package com.bit.web.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.web.dao.JoinSeoulDao;
import com.bit.web.vo.JoinSeoulBean;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class joinServiceImpl implements joinService{
	
	@Autowired
	JoinSeoulDao dao;
	
	//아이디(email)중복체크
	@Override
	public boolean ajaxGetId(String id) {
		System.out.println(dao.ajaxGetId(id));
		//System.out.println("boolean " + dao.ajaxGetId(id)!=null);
		return dao.ajaxGetId(id)!=null;
	}
	
	//nick name 중복체크
	@Override
	public boolean checkUsernick(String nickname) {
		return dao.getNick(nickname) != null;
	}
	
	// 대륙선택 후 해당 국가 리스트로
	@Override
	public List<Object> ajaxcontinent(String id) {
		System.out.println(id);
		return dao.selectcontinent(id);
	}
	
	
}

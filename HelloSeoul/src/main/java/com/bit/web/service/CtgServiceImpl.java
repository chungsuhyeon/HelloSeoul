package com.bit.web.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bit.web.dao.CtgDao;
import com.bit.web.vo.LocGunGuBean;

@Service
public class CtgServiceImpl implements CtgService{
	
	@Resource
	private CtgDao dao;

	@Override
	public List<LocGunGuBean> readyForSg() {
		return dao.readyForLocation(); 
		
	}
	
	
	
	

}

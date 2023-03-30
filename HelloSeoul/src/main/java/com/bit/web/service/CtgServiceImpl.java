package com.bit.web.service;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.web.dao.CtgDao;
import com.bit.web.vo.LocGunGuBean;


@Service
public class CtgServiceImpl implements CtgService{
	
	@Autowired
	private CtgDao dao;

	@Override
	public List<LocGunGuBean> readyForSg() {
		System.out.println("service");
		return dao.readyForLocation(); 
		
	}

	@Override
	public String test(HttpServletRequest resq) {
		String x = (String)(resq.getSession().getAttribute("user_id"));
		// TODO Auto-generated method stub
		return x;
	}
	
	
	
	
	
	

}

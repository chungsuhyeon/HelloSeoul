package com.bit.web.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.web.dao.JoinSeoulDao;
import com.bit.web.vo.JoinSeoulBean;

@Controller
public class JoinSeoulController {
	@Autowired
	private JoinSeoulDao dao;

	@PostMapping(value = "ajaxFindID")
	@ResponseBody
	public String findId(@RequestParam(value = "id", required = false, defaultValue = "blue@bit.com") String id) {
		System.out.println(id);
		System.out.println(dao.ajaxGetId(id));
		// return "ok";
		return dao.ajaxGetId(id) != null ? String.valueOf(true) : String.valueOf(false);
		// return "test";
	}
	
	@PostMapping(value = "ajaxcontinent")
	  
	@ResponseBody
	public String selectcontinent(@RequestParam(value ="id", required = false)String id) { 
		System.out.println(id); 
		return "";
	  
	  
	  }
	

	@PostMapping(value = "joinMemberInsert")
	public String joinMemberInsert(JoinSeoulBean bean) {
		System.out.println(bean);
		System.out.println(bean.getUser_nation().getClass().getName());// User_nation 타입 확인
		// 33 출력
		// System.out.println(user_nation);

		bean.setUser_nation(dao.getJoinnation(bean.getUser_nation()));
		dao.insertMember(bean);
		System.out.println(bean);
		// return "test";
		return "Final_Pro/login";
	}

}

package com.bit.web.controller;

import java.util.HashMap;
import java.util.List;

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

	
// email 중복체크
		@PostMapping(value = "ajaxFindID")
		@ResponseBody
		public String ajaxFindID(@RequestParam(value = "id", required = false, defaultValue = "blue@bit.com") String id) {
			System.out.println(id);
			System.out.println(dao.ajaxGetId(id));
			// return "ok";
			return dao.ajaxGetId(id) != null ? String.valueOf(true) : String.valueOf(false);
			// return "test";
		}
	
// nick name 중복체크
		@PostMapping(value = "checkUsernick")
		@ResponseBody
		public String findNick(@RequestParam(value = "nickname", required = false, defaultValue = "") String nickname) {
			//System.out.println(nickname);
			//System.out.println(dao.getNick(nickname));
			// return "ok";
			return dao.getNick(nickname) != null ? String.valueOf(true) : String.valueOf(false);
			// return "test";
		}		
	
	
// 대륙 해시맵으로 불러오기 
		@PostMapping(value = "ajaxcontinent")	  
		@ResponseBody
		public List<Object> selectcontinent(@RequestParam(value ="id", required = false)String id) { 
//			System.out.println("controller"+id); 
//			System.out.println(dao.selectcontinent(id));
//			return "success";
			return dao.selectcontinent(id);
		    }	
	

// 회원가입정보 디비에 저장 		
		@PostMapping(value = "joinMemberInsert")
		public String joinMemberInsert(JoinSeoulBean bean) {
			System.out.println(bean);
			System.out.println(bean.getUser_nation().getClass().getName()); 
			bean.setUser_nation(dao.getJoinnation(bean.getUser_nation()));
			dao.insertMember(bean);
			System.out.println(bean);
			// return "test";
			return "Final_Pro/login";
		}

}
package com.bit.web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.web.dao.JoinSeoulDao;
import com.bit.web.service.joinService;
import com.bit.web.vo.JoinSeoulBean;

@Controller
public class JoinSeoulController {
	@Autowired
	private JoinSeoulDao dao;
	@Autowired
	joinService joinService;
	
// email 중복체크
		@PostMapping(value = "ajaxFindID")
		@ResponseBody
		public String ajaxFindID(@RequestParam(value = "id", required = false, defaultValue = "blue@bit.com") String id) {
			System.out.println(id);
			System.out.println(dao.ajaxGetId(id));			
			return joinService.ajaxGetId(id) ? String.valueOf(true) : String.valueOf(false);
			
		}
	
// nick name 중복체크
		@PostMapping(value = "checkUsernick")
		@ResponseBody
		public String findNick(@RequestParam(value = "nickname", required = false, defaultValue = "") String nickname) {
			return joinService.checkUsernick(nickname) ? String.valueOf(true) : String.valueOf(false);
			
		}	
	
// 대륙 해시맵으로 불러오기 
		@PostMapping(value = "ajaxcontinent")	  
		@ResponseBody
		public List<Object> selectcontinent(@RequestParam(value ="id", required = false)String id) { 
			return joinService.ajaxcontinent(id);
		    }		

// 회원가입정보 디비에 저장 		
		@PostMapping(value = "joinMemberInsert")
			public String joinMemberInsert(JoinSeoulBean bean) {
				System.out.println(bean);
				System.out.println(bean.getUser_nation().getClass().getName()); 
				bean.setUser_nation(dao.getJoinnation(bean.getUser_nation()));
				dao.joinMemberInsert(bean);
				System.out.println(bean);
				// return "test";
				return "Final_Pro/login";
				}
		
// password 변경 업데이트		
			@RequestMapping("joinPwUpdate")
			public void joinPwUpdate(HttpServletRequest request) {
				System.out.println(request);
				HashMap<String, String> map = new HashMap<String, String>();
				map.put("user_id", (String) request.getParameter("user_id"));
				map.put("user_pw", (String) request.getParameter("user_pw"));	
				System.out.println(map.get("user_id"));
				dao.pwUpdate(map);	
							
			}
}
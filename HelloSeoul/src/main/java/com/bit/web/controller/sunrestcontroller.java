package com.bit.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bit.web.dao.CtgDao;
import com.bit.web.service.CtgService;
import com.bit.web.vo.LocGunGuBean;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.MypageJjimBean;

import scala.collection.generic.BitOperations.Int;

@RestController
public class sunrestcontroller {
	
	@Resource
	private CtgService ctg;
	
	@PostMapping(value = "showLocInfo")	
	public List<MainDbBean> showDb() {
		return ctg.showLocinfo();
	}
	
	@PostMapping(value = "searchList")
	public List<MainDbBean> searchList(String loc_sg, String detailctg, String query) {
		return ctg.searchLoc(loc_sg, detailctg, query);
	}
	
	@PostMapping(value="insertJjim")
	public void insertJjim(@RequestParam(value="jjimpoint[]") List<Integer> jjimpoint, HttpServletRequest resq) {
		String user_id = (String) resq.getSession().getAttribute("user_id");
		ctg.insertJjim(jjimpoint, user_id);
	}
	
	@PostMapping(value = "searchHot")
	public List<MainDbBean> searchHotspot(String query) {
		return ctg.searchHot(query);
	}
	
	@PostMapping(value = "hotspotrecommend")
	public List<MainDbBean> hotspotrecom(String sg){
		System.out.println(sg);
		return ctg.hotspotrecom(sg);
	}
	
	@PostMapping(value = "userrecom")
	public String userrecom(String userid) {
		System.out.println(userid);
		if(userid!="") {
			//dao.selecttagimg rownum3
		}
		return userid;
	}
	
	@PostMapping(value = "paging")
	public List<HashMap<String, Object>> pagingsys(int page) {
		System.out.println(page);
		System.out.println(ctg.HotspotPaging(page));
		return ctg.HotspotPaging(page);
	}
	
	@PostMapping(value="aiLearning")
	public void leariningresult(String inurl) {
		//StringBuffer url = readFromUrl(inurl);
	}
	

}

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
import com.bit.web.vo.LocGunGuBean;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.MypageJjimBean;

import scala.collection.generic.BitOperations.Int;

@RestController
public class sunrestcontroller {
	
	@Resource
	private CtgDao dao;
	
	@PostMapping(value = "showMainDb")	
	public List<MainDbBean> showDb() {
		
		return dao.showDb();
	}
	
	@PostMapping(value = "searchList")
	public List<MainDbBean> searchList(String loc_sg, String detailctg, String query) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("loc_sg",loc_sg);
		map.put("loc_ctg2", detailctg);
		map.put("query", query);		
		System.out.println(dao.searchList(map));
		return dao.searchList(map);
	}
	
	@PostMapping(value="insertJjim")
	public String insertJjim(@RequestParam(value="jjimpoint[]") List<Integer> jjimpoint, HttpServletRequest request) {
		for(int x : jjimpoint) {
			System.out.println(x);
			System.out.println(dao.searchInsertJjim(x));
			MainDbBean bean = dao.searchInsertJjim(x);
			MypageJjimBean bean2 =new MypageJjimBean();
			bean2.setLoc_pc(bean.getLoc_pc());
			bean2.setLoc_name(bean.getLoc_name());
			bean2.setLoc_ctg1(bean.getLoc_ctg1());
			bean2.setLoc_ctg2(bean.getLoc_ctg2());
			bean2.setLoc_sg(bean.getLoc_sg());
			bean2.setUser_id((String)request.getSession().getAttribute("user_id"));
			System.out.println(bean2);
			
		}
		return "success!";
	}

}

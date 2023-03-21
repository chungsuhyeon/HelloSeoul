package com.bit.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bit.web.dao.CtgDao;
import com.bit.web.vo.LocGunGuBean;
import com.bit.web.vo.MainDbBean;

import scala.collection.generic.BitOperations.Int;

@RestController
public class sunrestcontroller {
	
	@Resource
	private CtgDao dao;
	
	@PostMapping(value = "showMainDb")	
	public List<MainDbBean> showDb() {
		
		return dao.showDb();
	}
	
	@PostMapping(value = "searchFood")
	public List<MainDbBean> searchFood(String loc_sg, int loc_ctg2, String query) {
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("loc_sg", loc_sg);
		map.put("loc_ctg2", loc_ctg2);
		map.put("query", query);		
		System.out.println(map);
		System.out.println(dao.searchFood(map));
		return dao.searchFood(map);
	}
	
	@PostMapping(value="insertJjim")
	public String insertJjim(@RequestParam(value="jjimpoint[]") List<Integer> jjimpoint) {
		for(int x : jjimpoint) {
			System.out.println(x);
			System.out.println(dao.searchInsertJjim(x));
		}
		return "success!";
	}

}

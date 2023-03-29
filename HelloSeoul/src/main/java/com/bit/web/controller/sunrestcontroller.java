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
		map.put("loc_sg", loc_sg);
		map.put("loc_ctg2", detailctg);
		map.put("query", query);		
		System.out.println(map);
		System.out.println(dao.searchFood(map));
		return dao.searchFood(map);
	}
	
	@PostMapping(value="insertJjim")
	public int insertJjim(@RequestParam(value="jjimpoint[]") List<Integer> jjimpoint, HttpServletRequest resq) {
		//System.out.println(jjimpoint.contains(1234));
		//contains
		String user_id = (String) resq.getSession().getAttribute("user_id");
		List<Integer> listjjim =  dao.checkJjimList(user_id);
		int sameCount = 0;
		
		
		for(int i: jjimpoint) {
			if(listjjim.contains(i)) {
				sameCount +=1;
				continue;
			}
			else {
				MainDbBean dbbean = dao.searchInsertJjim(i);
				MypageJjimBean jbean = new MypageJjimBean();
				jbean.setUser_id(user_id);
				jbean.setLoc_pc(dbbean.getLoc_pc());
				jbean.setLoc_name(dbbean.getLoc_name());
				jbean.setLoc_ctg1(dbbean.getLoc_ctg1());
				jbean.setLoc_ctg2(dbbean.getLoc_ctg2());
				jbean.setLoc_sg(dbbean.getLoc_sg());
				System.out.println(jbean);
				dao.insertjjim(jbean);				
			}
		}
		
//		for(int i : jjimpoint) {
//			int x = 0;
//			
//			for(int j : listjjim) {
//				if(j==i) {
//					x = 0;
//					sameCount +=1;
//					break;
//				}
//				else {
//					x += 1;
//				}
//			}
//			if(x>0) {
//				MainDbBean dbbean = dao.searchInsertJjim(i);
//				MypageJjimBean jbean = new MypageJjimBean();
//				jbean.setUser_id(user_id);
//				jbean.setLoc_pc(dbbean.getLoc_pc());
//				jbean.setLoc_name(dbbean.getLoc_name());
//				jbean.setLoc_ctg1(dbbean.getLoc_ctg1());
//				jbean.setLoc_ctg2(dbbean.getLoc_ctg2());
//				jbean.setLoc_sg(dbbean.getLoc_sg());
//				System.out.println(jbean);
//				dao.insertjjim(jbean);
//			}
//		}
		return sameCount;
	}
	
	@PostMapping(value = "searchHot")
	public List<MainDbBean> searchHotspot(String query) {
		return dao.searchHot(query);
	}
	
	@PostMapping(value = "hotspotrecommend")
	public List<MainDbBean> hotspotrecom(String sg){
		System.out.println(sg);
		return dao.hotspotrecom(sg);
	}
	
	@PostMapping(value = "userrecom")
	public String userrecom(String userid) {
		System.out.println(userid);
		if(userid!="") {
			//dao.selecttagimg rownum3
		}
		return userid;
	}

}

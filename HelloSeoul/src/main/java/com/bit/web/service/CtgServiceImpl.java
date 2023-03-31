package com.bit.web.service;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.web.dao.CtgDao;
import com.bit.web.vo.LocGunGuBean;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.MypageJjimBean;


@Service
public class CtgServiceImpl implements CtgService{
	
	@Autowired
	private CtgDao dao;
	
	
	//controller service begin
	@Override
	public List<LocGunGuBean> readyForSg() {
		// TODO Auto-generated method stub
		return dao.readyForLocation(); 
		
	}
	
	@Override
	public List<HashMap<Object, String>> readyForCtg() {
		// TODO Auto-generated method stub
		return dao.readyForCategory();
	}

	@Override
	public List<MainDbBean> readyForHot() {
		// TODO Auto-generated method stub
		return dao.readyForHotspot();
	}

	@Override
	public MainDbBean hotspotinfo(int loc_pc) {
		// TODO Auto-generated method stub
		return dao.hotspotinfo(loc_pc);
	}
	//controller service end

	
	//rest controller service begin
	@Override
	public List<MainDbBean> showLocinfo() {
		// TODO Auto-generated method stub
		return dao.showDb();
	}

	@Override
	public List<MainDbBean> searchLoc(String loc_sg, String detailctg, String query) {
		// TODO Auto-generated method stub
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("loc_sg", loc_sg);
		map.put("loc_ctg2", detailctg);
		map.put("query", query);		
		return dao.searchLoc(map);
	}

	@Override
	public void insertJjim(List<Integer> jjimpoint, String user_id) {
		// TODO Auto-generated method stub
		List<Integer> listjjim =  dao.checkJjimList(user_id);
		
		for(int i: jjimpoint) {
			if(listjjim.contains(i)) {
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
	}

	@Override
	public List<MainDbBean> searchHot(String query) {
		// TODO Auto-generated method stub
		return dao.searchHot(query);
	}

	@Override
	public List<MainDbBean> hotspotrecom(String sg) {
		// TODO Auto-generated method stub
		return dao.hotspotrecom(sg);
	}
	
	
	
	
	
	//rest controller service end
	
	
	
	
	
	
	
	
	

}

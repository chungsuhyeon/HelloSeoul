package com.bit.web.service;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bit.web.vo.JoinSeoulBean;
import com.bit.web.vo.LocGunGuBean;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.PageBean;

public interface CtgService {
	
	//controller
	List<LocGunGuBean> readyForSg();
	List<HashMap<Object, String>> readyForCtg();
	List<MainDbBean> readyForHot();
	MainDbBean hotspotinfo(int loc_pc);
	
	//restcontroller
	List<MainDbBean> showLocinfo();
	List<MainDbBean> searchLoc(String loc_sg, String detailctg, String query);
	void insertJjim(List<Integer> jjimpoint, String user_id);
	List<MainDbBean> searchHot(String query);
	List<MainDbBean> hotspotrecom(String sg);
	List<HashMap<String, Object>> hotspotshow(int page,String ctg1);
	List<JoinSeoulBean> collectUsers();
	
}

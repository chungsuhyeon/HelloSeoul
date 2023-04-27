package com.bit.web.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import com.bit.web.vo.JoinSeoulBean;
import com.bit.web.vo.LocGunGuBean;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.MultiPageBean;
import com.bit.web.vo.PageBean;

public interface CtgService {
	
	//controller
	List<LocGunGuBean> readyForSg();
	List<HashMap<Object, String>> readyForCtg();
	List<MainDbBean> readyForHot();
	MainDbBean hotspotinfo(int loc_pc);
	
	//restcontroller
	MainDbBean showLocinfo(String name);
	List<MainDbBean> searchLoc(String loc_sg, String loc_ctg1, String detailctg, String query);
	void insertJjim(List<Integer> jjimpoint, String user_id);
	List<MainDbBean> searchHot(String query);
	List<MainDbBean> hotspotrecom(String sg);
	List<HashMap<String, Object>> hotspotshow(int page,String ctg1);
	List<JoinSeoulBean> collectUsers();
	List<HashMap<String, Object>> recommandFood(String foodname);
	void insertOneJjim(int pc, String id);
	String jsonParsingCoin(String day)throws IOException;
	List<HashMap<String, Object>> reportComm();
	MultiPageBean makingTotals(int blockScale, int pageScale);
	MultiPageBean changePage(int page, int block, MultiPageBean bean);
	List<MainDbBean> showDBs(int start, int end);
	MultiPageBean makingTotals2(int blockScale, int pageScale, String user_id);
	List<Object> userPlanner(String id, String user_nick, int start, int end);
	List<HashMap<String, Object>> getUsers();
	List<HashMap<String, Object>> getffCount();
}

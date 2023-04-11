package com.bit.web.service;

import java.util.HashMap;
import java.util.List;

import com.bit.web.vo.JoinSeoulBean;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.MypageMainPlannerBean;
import com.bit.web.vo.MypagePlannerBean;

public interface MypageService {
	JoinSeoulBean loginPass(String id, String pw);
	
	HashMap<String, Object> userInfo(String id);
	
	List<Object> userPlanner(String id);
	
	String userJjimList(String id);
	
	List<Object> mypageScheduleWishList(String id);
	
	HashMap<String, Object> mypagePlannerTabBar(int no);
	
	List<Object> mypagePlannerTabContent(int no);
	
	void mypageJjimDelete(Object id, String[] list);
	
	MainDbBean getlocInfo(int loc_pc);
	
	int mypagePlannerNext(Object id, String modi, MypagePlannerBean bean);
	
	List<Object> mypagePlannerScheduleAdd(String[] loc_pc);
	
	void mypageScheduleDelete(int no);
	
	void mypagePlannerDelete(int no);
	
	void mypageScheduleInsert(Object id, MypageMainPlannerBean bean);
	
	MypagePlannerBean mypageDateInfo(int no);
	
}

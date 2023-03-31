package com.bit.web.service;

import java.util.HashMap;
import java.util.List;

public interface MypageService {
	String loginPass(String id, String pw);
	
	HashMap<String, Object> userInfo(String id);
	
	List<Object> userPlanner(String id);
	
	String userJjimList(String id);
	
	List<Object> mypageScheduleWishList(String id);
	
	HashMap<String, Object> mypagePlannerTabBar(int no);
	
	List<Object> mypagePlannerTabContent(int no);
}

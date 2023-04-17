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
	
	List<Object> userPlanner(String id, String user_nick);
	
	String userJjimList(String id);
	
	List<Object> mypageScheduleWishList(String id);
	
	HashMap<String, Object> mypagePlannerTabBar(int no);
	
	List<Object> mypagePlannerTabContent(int no);
	
	void mypageJjimDelete(Object id, String[] list);
	
	MainDbBean getlocInfo(int loc_pc);
	
	int mypagePlannerNext(String id, String nick, String modi, MypagePlannerBean bean);
	
	List<Object> mypagePlannerScheduleAdd(String[] loc_pc);
	
	void mypageScheduleDelete(int no);
	
	void mypagePlannerShareAllDelete(int no);
	
	void mypagePlannerDelete(int no);
	
	void mypagePlannerUpdateDate(int no, Object nick);
	
	void mypageScheduleInsert(Object id, MypageMainPlannerBean bean);
	
	MypagePlannerBean mypageDateInfo(int no);
	
	List<String> shareNickCheck(String user_nick, String nick, int no); // 공유할 닉네임 리스트 받아오기
	
	Boolean shareNickAddCheck(String nick, int no); // 선택한 사용자 닉네임 DB에 저장
	
	List<String> alreadyShareUserList(int no);
	
	void shareNickDelete(String nick, int no);
}

package com.bit.web.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bit.web.dao.HelloSeoulDao;
import com.bit.web.vo.JoinSeoulBean;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.MypageJjimBean;
import com.bit.web.vo.MypageMainPlannerBean;
import com.bit.web.vo.MypagePlannerBean;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService {
	@Resource(name = "helloSeoulDao")
	private HelloSeoulDao helloDao;
	
	@Resource
	private CommService commService;

	@Override
	public JoinSeoulBean loginPass(String id, String pw) {
		String dbPass = helloDao.getDbUserPW(id);
		if(dbPass!=null && dbPass.equals(pw)) {
			return helloDao.getDbUserInfo(id);
		} else {
			return null;			
		}
	}

	@Override
	public HashMap<String, Object> userInfo(String id) {
		// 개인정보 넘기기	
		HashMap<String, Object> userDBInfo = helloDao.getUserInfo(id);
		
		// DB 생일
		LocalDate birth = LocalDate.parse((String)userDBInfo.get("USER_BIRTH"), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		
		// 오늘 날짜
		LocalDate today = LocalDate.now();
		
		int user_pp = Integer.parseInt(String.valueOf(userDBInfo.get("USER_PP")));
		int user_first = Integer.parseInt(String.valueOf(userDBInfo.get("USER_FIRST")));
		
		
		
		// 정보 넘길거
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		userInfo.put("USER_NATION", helloDao.getCountryName(userDBInfo.get("COUNTRY_NO"))); // 국적
		
		// 나이계산
		if( (today.getMonthValue() - birth.getMonthValue()) > 0) { // 생일 지난 사람
			userInfo.put("USER_AGE", today.getYear() - birth.getYear());	
		} else { // 생일 안지남
			if(birth.getDayOfMonth() > today.getDayOfMonth()) { // 생일 안지난 사람
				userInfo.put("USER_AGE", today.getYear() - birth.getYear() - 1);						
			} else { // 생일 지남
				userInfo.put("USER_AGE", today.getYear() - birth.getYear());
			} 
		}
						
		// 관광목적
		switch (user_pp) {
		case 1:
			userInfo.put("USER_PP", "travel"); // 여행
			break;
		case 2:
			userInfo.put("USER_PP", "business trip"); // 출장
			break;
		case 3:
			userInfo.put("USER_PP", "study"); // 유학
			break;
		case 4:
			userInfo.put("USER_PP", "experience"); // 경험
			break;
		default : 
			userInfo.put("USER_PP", "etc");
			break;
		}
		
		// 관광 1순위
		switch (user_first) {
		case 1:
			userInfo.put("USER_FIRST", "food");
			break;
		case 2:
			userInfo.put("USER_FIRST", "tour");
			break;
		case 3:
			userInfo.put("USER_FIRST", "shopping");
			break;
		case 4:
			userInfo.put("USER_FIRST", "entertainment");
			break;
		default : 
			userInfo.put("USER_PP", "etc");
			break;
		}
		return userInfo;
	}

	@Override
	public List<Object> userPlanner(String id, String user_nick) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("id", id);
		map.put("nick", user_nick);
		return helloDao.getUserPlanner(map);
	}

	@Override
	public String userJjimList(String id) {
		List<Object> userJjimList = helloDao.getUserJjimList(id);
		
		String finalStr = "";
		String tab1 = "";
		String tab2 = "";
		String tab3 = "";
		String tab4 = "";
		
		for(Object i : userJjimList) {
			MypageJjimBean bean = (MypageJjimBean) i;	
			
			if(bean.getLoc_ctg1().equals("food")) {
				tab1 += "<tr class='table-light'><td><input type='checkbox' name='select_location' value=" + bean.getLoc_pc() + "></td>";
				tab1 += "<td><a href='#' id='local_name'>" + bean.getLoc_name() + "</a>";
				tab1 += "<br><span style='font-size: 12px'> " + bean.getLoc_sg() + " > " + bean.getLoc_ctg1()  + " > " + bean.getLoc_ctg2();
				tab1 += "</span></td></tr>";
			}
			else if (bean.getLoc_ctg1().equals("tour")){				
				tab2 += "<tr class='table-light'><td><input type='checkbox' name='select_location' value=" + bean.getLoc_pc() + "></td>";
				tab2 += "<td><a href='#' id='local_name'>" + bean.getLoc_name() + "</a>";
				tab2 += "<br><span style='font-size: 12px'> " + bean.getLoc_sg() + " > " + bean.getLoc_ctg1()  + " > " + bean.getLoc_ctg2();
				tab2 += "</span></td></tr>";
			}
			else if (bean.getLoc_ctg1().equals("shopping")){				
				tab3 += "<tr class='table-light'><td><input type='checkbox' name='select_location' value=" + bean.getLoc_pc() + "></td>";
				tab3 += "<td><a href='#' id='local_name'>" + bean.getLoc_name() + "</a>";
				tab3 += "<br><span style='font-size: 12px'> " + bean.getLoc_sg() + " > " + bean.getLoc_ctg1()  + " > " + bean.getLoc_ctg2();
				tab3 += "</span></td></tr>";
			}
			else { // 티켓인 경우	entertainment
				tab4 += "<tr class='table-light'><td><input type='checkbox' name='select_location' value=" + bean.getLoc_pc() + "></td>";
				tab4 += "<td><a href='#' id='local_name'>" + bean.getLoc_name() + "</a>";
				tab4 += "<br><span style='font-size: 12px'> " + bean.getLoc_sg() + " > " + bean.getLoc_ctg1()  + " > " + bean.getLoc_ctg2();
				tab4 += "</span></td></tr>";
			}
		}		

		finalStr += "<div class='tab-pane fade active show' id='food' role='tabpanel'><table class='table table-hover'><tbody>" + tab1 + "</tbody></table></div>";
		finalStr += "<div class='tab-pane fade' id='tour' role='tabpanel'><table class='table table-hover'><tbody>" + tab3 + "</tbody></table></div>";
		finalStr += "<div class='tab-pane fade' id='shopping' role='tabpanel'><table class='table table-hover'><tbody>" + tab2 + "</tbody></table></div>";
		finalStr += "<div class='tab-pane fade' id='entertainment' role='tabpanel'><table class='table table-hover'><tbody>" + tab4 + "</tbody></table></div>";
		
		return finalStr;
	}

	@Override
	public void mypageJjimDelete(Object id, String[] list) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", id);
		
		// 삭제할 찜리스트의 장소코드
		String str = "(";
		for(int i=0; i<list.length; i++) {
			str += list[i] + ",";
			System.out.println(list[i]);
		}
		str = str.replaceAll(",$", ""); // 마지막 문자열의 , 제거
		str += ")";		
		map.put("str", str);

		helloDao.userJjimListDelete(map);
	}

	@Override
	public MainDbBean getlocInfo(int loc_pc) {
		return helloDao.getJjimInfo(loc_pc);
	}

	@Override
	public List<Object> mypageScheduleWishList(String id) {
		return helloDao.getUserJjimList(id);
	}
	
	@Override
	public HashMap<String, Object> mypagePlannerTabBar(int no) {
		HashMap<String, Object> plannerInfo = helloDao.firstMainPlannerCreate(no);
		LocalDate start = LocalDate.parse(plannerInfo.get("PLANNER_START").toString().split(" ")[0], DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		LocalDate end = LocalDate.parse(plannerInfo.get("PLANNER_END").toString().split(" ")[0], DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		int diffDate = end.compareTo(start);
		plannerInfo.put("numDate", diffDate + 1);
		return plannerInfo;
	}

	@Override
	public List<Object> mypagePlannerTabContent(int no) {
		return helloDao.mainPlannerDataSelect(no);
	}

	@Override
	public int mypagePlannerNext(String id, String nick, String modi, MypagePlannerBean bean) {
		// 새로운 플래너 생성을 위한 일정 생성
		if(modi.equals("createPlanner")) {
			int no = helloDao.getPlannerNo();
			bean.setPlanner_no(no);
			bean.setUser_id(id);
			bean.setUpdate_user(nick);
			helloDao.plannerDataInsert(bean);
			return no;
		} else { // update
			bean.setUpdate_user(nick);
			helloDao.mypageDateUpdate(bean);
			return bean.getPlanner_no();
		}
	}

	@Override
	public List<Object> mypagePlannerScheduleAdd(String[] loc_pc) {
		String str = "(";
		for(int i=0; i<loc_pc.length; i++) {
			str += loc_pc[i] + ",";
		}
		str = str.replaceAll(",$", ""); // 마지막 문자열의 , 제거
		str += ")";
		return helloDao.selectMainDbData(str);
	}

	@Override
	public void mypageScheduleDelete(int no) {
		helloDao.plannerScheduleDelete(no);
	}
	
	@Override
	public void mypagePlannerDelete(int no) {
		helloDao.plannerAllDelete(no);
		// 커뮤니티 공유한 플래너 삭제
		if(helloDao.plannerShareCommunity(no).size() != 0) {
			for(int num : helloDao.plannerShareCommunity(no)) {
				commService.deleteBoard(num);
			}
		} 
	}
	
	@Override
	public void mypagePlannerUpdateDate(int no, Object nick) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("no", no);
		map.put("nick", nick);
		helloDao.plannerUpdateDate(map);
	}
	
	@Override
	public void mypageScheduleInsert(MypageMainPlannerBean bean) {
		helloDao.plannerScheduleInsert(bean);
	}

	@Override
	public MypagePlannerBean mypageDateInfo(int no) {
		return helloDao.mypageplannerInfo(no);
	}

	@Override
	public List<String> shareNickCheck(String user_nick, String nick, int no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_nick", user_nick);
		map.put("nick", nick);
		map.put("no", no);
		return helloDao.nickSearch(map);
	}

	@Override
	public Boolean shareNickAddCheck(String nick, int no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("nick", nick);
		map.put("no", no);

		if(helloDao.shareNickSelete(map) != null) { // 닉이 있을때 false 반환
			return false;
		} else {
			helloDao.shareNickInsert(map);
			return true;
		}
	}

	@Override
	public List<String> alreadyShareUserList(int no) {
		return helloDao.alreadyShareUser(no);
	}

	@Override
	public void shareNickDelete(String nick, int no) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("nick", nick);
		map.put("no", no);
		helloDao.shareNickDelete(map);
	}





	
	
	
	
}

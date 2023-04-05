package com.bit.web.service;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.bit.web.dao.HelloSeoulDao;
import com.bit.web.vo.MypageJjimBean;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService {
	@Resource(name = "helloSeoulDao")
	private HelloSeoulDao helloDao;

	@Override
	public String loginPass(String id, String pw) {
		String dbPass = helloDao.getDbUserPW(id);
		if(dbPass!=null && dbPass.equals(pw)) {
			return helloDao.getDbUserNick(id);
		} else {
			return null;			
		}
	}

	@Override
	public HashMap<String, Object> userInfo(String id) {
		// 개인정보 넘기기	
		HashMap<String, Object> userDBInfo = helloDao.getUserInfo(id);
		
		// DB 생일
		LocalDate birth = LocalDate.parse((String)userDBInfo.get("USER_BIRTH"), DateTimeFormatter.ofPattern("yyyy/MM/dd"));
		
		// 오늘 날짜
		LocalDate today = LocalDate.now();
		
		int user_pp = Integer.parseInt(String.valueOf(userDBInfo.get("USER_PP")));
		int user_first = Integer.parseInt(String.valueOf(userDBInfo.get("USER_FIRST")));
		
		// 정보 넘길거
		HashMap<String, Object> userInfo = new HashMap<String, Object>();	
		userInfo.put("USER_NATION", userDBInfo.get("USER_NATION")); // 국적
		
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
	public List<Object> userPlanner(String id) {
		return helloDao.getUserPlanner(id);
	}

	@Override
	public String userJjimList(String id) {
		List<Object> userJjimList = helloDao.getUserJjimList(id);
		
		String finalStr = "";
		String tab1 = "";
		String tab2 = "";
		String tab3 = "";
		String tab4 = "";
		String tab5 = "";
		
		for(Object i : userJjimList) {
			MypageJjimBean bean = (MypageJjimBean) i;	
			
			if(bean.getLoc_ctg1().equals("음식점")) {
				tab1 += "<tr class='table-light'><td><input type='checkbox' name='select_location' value=" + bean.getLoc_pc() + "></td>";
				tab1 += "<td><a href='#' id='local_name'>" + bean.getLoc_name() + "</a>";
				tab1 += "<br><span style='font-size: 8px'> " + bean.getLoc_sg() + " > " + bean.getLoc_ctg1()  + " > " + bean.getLoc_ctg2();
				tab1 += "</span></td></tr>";
			}
			else if (bean.getLoc_ctg1().equals("관광지")){				
				tab2 += "<tr class='table-light'><td><input type='checkbox' name='select_location' value=" + bean.getLoc_pc() + "></td>";
				tab2 += "<td><a href='#' id='local_name'>" + bean.getLoc_name() + "</a>";
				tab2 += "<br><span style='font-size: 8px'> " + bean.getLoc_sg() + " > " + bean.getLoc_ctg1()  + " > " + bean.getLoc_ctg2();
				tab2 += "</span></td></tr>";
			}
			else if (bean.getLoc_ctg1().equals("쇼핑")){				
				tab3 += "<tr class='table-light'><td><input type='checkbox' name='select_location' value=" + bean.getLoc_pc() + "></td>";
				tab3 += "<td><a href='#' id='local_name'>" + bean.getLoc_name() + "</a>";
				tab3 += "<br><span style='font-size: 8px'> " + bean.getLoc_sg() + " > " + bean.getLoc_ctg1()  + " > " + bean.getLoc_ctg2();
				tab3 += "</span></td></tr>";
			}
			else if (bean.getLoc_ctg1().equals("볼거리")){				
				tab4 += "<tr class='table-light'><td><input type='checkbox' name='select_location' value=" + bean.getLoc_pc() + "></td>";
				tab4 += "<td><a href='#' id='local_name'>" + bean.getLoc_name() + "</a>";
				tab4 += "<br><span style='font-size: 8px'> " + bean.getLoc_sg() + " > " + bean.getLoc_ctg1()  + " > " + bean.getLoc_ctg2();
				tab4 += "</span></td></tr>";
			}
			else { // 티켓인 경우	
				tab5 += "<tr class='table-light'><td><input type='checkbox' name='select_location' value=" + bean.getLoc_pc() + "></td>";
				tab5 += "<td><a href='#' id='local_name'>" + bean.getLoc_name() + "</a>";
				tab5 += "<br><span style='font-size: 5px'> " + bean.getLoc_sg() + " > " + bean.getLoc_ctg1()  + " > " + bean.getLoc_ctg2();
				tab5 += "</span></td></tr>";
			}
		}		

		finalStr += "<div class='tab-pane fade active show' id='food' role='tabpanel'><table class='table table-hover'><tbody>" + tab1 + "</tbody></table></div>";
		finalStr += "<div class='tab-pane fade' id='shopping' role='tabpanel'><table class='table table-hover'><tbody>" + tab3 + "</tbody></table></div>";
		finalStr += "<div class='tab-pane fade' id='hotspot' role='tabpanel'><table class='table table-hover'><tbody>" + tab2 + "</tbody></table></div>";
		finalStr += "<div class='tab-pane fade' id='things_to_see' role='tabpanel'><table class='table table-hover'><tbody>" + tab4 + "</tbody></table></div>";
		finalStr += "<div class='tab-pane fade' id='ticket' role='tabpanel'><table class='table table-hover'><tbody>" + tab5 + "</tbody></table></div>";
		
		return finalStr;
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
	
	
	
	
	
	
	
	
	
	
	
	
}

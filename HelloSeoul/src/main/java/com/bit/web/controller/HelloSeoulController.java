package com.bit.web.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.web.dao.HelloSeoulDao;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.MypageJjimBean;
import com.bit.web.vo.MypageMainPlannerBean;
import com.bit.web.vo.MypageMainPlannerList;

@Controller
public class HelloSeoulController {
	@Resource(name = "helloSeoulDao")
	private HelloSeoulDao helloDao;

	// login & session store
	@RequestMapping("siteCheck")
	public String loginProcess(HttpServletRequest request, String user_id, String password) {
		HashMap<String, String> userInfo = helloDao.getDbUser(user_id);
		
		String dbPass = userInfo.get("USER_PW");
		String nickName = userInfo.get("USER_NICK");
				
		if(dbPass!=null && dbPass.equals(password)) {
			// login success		
			request.getSession().setAttribute("user_id", user_id);
			request.getSession().setAttribute("user_nickName", nickName);
			request.getSession().setMaxInactiveInterval(60*60);
			return "redirect:/Final_Pro/index.jsp";
		} else {
			return "redirect:/Final_Pro/login.jsp";
		}
	}
	
	// logout
	@RequestMapping("HelloSeoulLogout")
	public ModelAndView BoardLogout(HttpServletRequest request) {
		request.getSession().setAttribute("user_id", null);
		request.getSession().setMaxInactiveInterval(0);		
		return new ModelAndView("Final_Pro/index");
	}
	
	// mypage main
	@RequestMapping("myPageLoad")
	public ModelAndView userInfoAll(HttpServletRequest request, Model model) {
		String user_id = (String)request.getSession().getAttribute("user_id");

		// 개인정보 넘기기		
		HashMap<String, Object> userDBInfo = helloDao.getUserInfo(user_id);
		
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
		
		model.addAttribute("userInfo", userInfo);
		
		// 생성된 플래너
		List<Object> userCreatedPlanner = helloDao.getUserPlanner(user_id);
		model.addAttribute("userCreatedPlanner", userCreatedPlanner);
		
		return new ModelAndView("Final_Pro/myPageMain");
	}
	
	// 찜 보기 화면
	@RequestMapping(value = "ajaxMypageJjim", method = {RequestMethod.GET, RequestMethod.POST} , produces = "application/text; charset=utf8")
	@ResponseBody
	public String mypageJjimListLoad(HttpServletRequest request){
		String user_id = (String) request.getSession().getAttribute("user_id");
		List<Object> userJjimList = helloDao.getUserJjimList(user_id);
		
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
	
	// 찜 리스트 자체 보내기
	@PostMapping(value = "ajaxWishList")
	@ResponseBody
	public List<Object> mypageWishListAll(HttpServletRequest request){
		return helloDao.getUserJjimList((String) request.getSession().getAttribute("user_id"));
	}
	
	// 찜 삭제
	@PostMapping(value="ajaxDeleteJjimList")
	public String mypageJjimListDelete(HttpServletRequest request, HttpServletResponse response, @RequestParam(value = "deleteJjimList[]")String[] locDataList) {
		HashMap<String, String> map = new HashMap<String, String>();
		
		String user_id = (String) request.getSession().getAttribute("user_id");
		map.put("user_id", user_id);
		
		// 삭제할 찜리스트의 장소코드
		String str = "(";
		for(int i=0; i<locDataList.length; i++) {
			str += locDataList[i] + ",";			
		}
		str = str.replaceAll(",$", ""); // 마지막 문자열의 , 제거
		str += ")";		
		map.put("str", str);

		helloDao.userJjimListDelete(map);
		
		return "redirect:/ajaxMypageJjim";
	}
		
	// 찜 화면에서 장소명 클릭시 상세정보 뿌리기
	@PostMapping(value = "ajaxMypageJjimInfo")
	@ResponseBody
	public MainDbBean mypageJjimInfoSelect(HttpServletRequest request, @RequestParam(value = "loc_code")int loc_code){
		return helloDao.getJjimInfo(loc_code);
	}
	
	// 플래너 일정 생성 / 수정
	@PostMapping(value = "createPlannerDate")
	public String plannerCreateController(HttpServletRequest request, @RequestParam(value = "modi")String modi) {
	
		// 새로운 플래너 생성을 위한 일정 생성
		if(modi.equals("createPlanner")) {
			HashMap<String, Object> toDbMap = new HashMap<String, Object>();

			int no = helloDao.getPlannerNo();
			toDbMap.put("no", no);
			toDbMap.put("user_id", (String) request.getSession().getAttribute("user_id"));
			toDbMap.put("title", request.getParameter("title"));
			toDbMap.put("tripStart", request.getParameter("tripStart"));
			toDbMap.put("tripEnd", request.getParameter("tripEnd"));
			toDbMap.put("memo", request.getParameter("memo"));
		
			helloDao.plannerDataInsert(toDbMap);
			
//			String direct = "redirect:/createMainPlanner?no=" + no + "&modi=newCreate";
//			return new ModelAndView(direct);
			return "redirect:/allPageLoad?no=" + no + "&modi=" + modi;
		}
//		return "redirect:/createMainPlanner?no=" + no + "&modi=" + modi;
		return "redirect:/allPageLoad?modi=" + modi;
//		return new ModelAndView("Final_Pro/myPagePlannerCreate");
	}
		
	// 메인 플래너 생성 페이지 로드
	@PostMapping(value = "ajaxMypagePlannerTabBar")
	@ResponseBody
	public HashMap<String, Object> ajaxPlannerTabBarSelect(@RequestParam(value = "no") int no) {
		HashMap<String, Object> plannerInfo = helloDao.firstMainPlannerCreate(no);
		
		LocalDate start = LocalDate.parse(plannerInfo.get("PLANNER_START").toString().split(" ")[0], DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		LocalDate end = LocalDate.parse(plannerInfo.get("PLANNER_END").toString().split(" ")[0], DateTimeFormatter.ofPattern("yyyy-MM-dd"));
		int diffDate = end.compareTo(start);
		plannerInfo.put("numDate", diffDate + 1);
		
		return plannerInfo;
	}
	
	
	// 생성한 플래너의 일정
	@PostMapping(value = "ajaxMypagePlannerTabContent")
	@ResponseBody
	public List<Object> ajaxPlannerTabContentSelect(@RequestParam(value = "no") int no){
		return helloDao.mainPlannerDataSelect(no);
	}
	
	// 메인 플래너 생성
	@PostMapping(value = "ajaxAddPlannerSchedule")
	@ResponseBody
	public List<Object> ajaxPlannerScheduleAdd(HttpServletRequest request, @RequestParam(value = "codeList[]") String[] loc_code) {
		String str = "(";
		for(int i=0; i<loc_code.length; i++) {
			str += loc_code[i] + ",";
		}
		str = str.replaceAll(",$", ""); // 마지막 문자열의 , 제거
		str += ")";
		
		return helloDao.selectMainDbData(str);
	}
	
	// 작성한 플래너 insert / update
	@PostMapping(value = "mainPlannerData")
	@ResponseBody
	public String formMainPlannerAdd(HttpServletRequest request, @RequestParam(value = "modi") String modi, @ModelAttribute(value="MypageMainPlannerList") MypageMainPlannerList list) {
		String user_id = (String) request.getSession().getAttribute("user_id");
		
		if(list.getMainPlannerList() != null) {
			for(int i=0; i<list.getMainPlannerList().size(); i++) {
				list.getMainPlannerList().get(i).setUser_id(user_id);
				helloDao.plannerScheduleInsert(list.getMainPlannerList().get(i));
			} // for문
		}
		
		return "success";
	}

	// 플래너 메인 생성 페이지 이동
	@RequestMapping(value = "allPageLoad")
	public ModelAndView mainPlannerPageLoad(HttpServletRequest request, @RequestParam(value = "no") int no, @RequestParam(value = "modi") String modi) {
		if(modi.equals("createPlanner")) { // 새로운 플래너를 생성
			return new ModelAndView("Final_Pro/myPagePlannerCreate");
		}
		else if(modi.equals("updatePlanner")) { // 플래너 수정
			return new ModelAndView("Final_Pro/myPagePlannerCreate");			
		} else { // show 로드
			return new ModelAndView("Final_Pro/myPageShow");
		}
	}
		
}
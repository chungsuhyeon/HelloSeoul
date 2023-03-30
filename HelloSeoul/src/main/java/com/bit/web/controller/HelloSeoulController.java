package com.bit.web.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.web.dao.HelloSeoulDao;
import com.bit.web.service.MypageService;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.MypageJjimBean;
import com.bit.web.vo.MypageMainPlannerBean;

@Controller
public class HelloSeoulController {
	@Resource(name = "helloSeoulDao")
	private HelloSeoulDao helloDao;
	
	@Resource
	private MypageService contactService;

	// login & session store
	@RequestMapping("siteCheck")
	public String loginProcess(HttpServletRequest request, String user_id, String password) {
		String nickName = contactService.loginPass(user_id, password);
						
		if(nickName != null) {
			// login success
			request.getSession().setAttribute("user_id", user_id);
			request.getSession().setAttribute("user_nickName", nickName);
			request.getSession().setMaxInactiveInterval(60*60);
			return "Final_Pro/index";
		} else {
			return "Final_Pro/login";
		}
	}
	
	// logout
	@RequestMapping("HelloSeoulLogout")
	public String BoardLogout(HttpServletRequest request) {
		request.getSession().setAttribute("user_id", null);
		request.getSession().setMaxInactiveInterval(0);	
		return "Final_Pro/index";
	}
	
	// mypage main
	@RequestMapping("myPageLoad")
	public ModelAndView userInfoAll(HttpServletRequest request) {
		String user_id = (String)request.getSession().getAttribute("user_id");

		ModelAndView mav = new ModelAndView();
		
		mav.addObject("userInfo", contactService.userInfo(user_id));
		mav.addObject("userCreatedPlanner", contactService.userPlanner(user_id));
		mav.setViewName("Final_Pro/myPageMain");
		
		return mav;
	}
	
	// 찜 보기 화면
	@RequestMapping(value = "ajaxMypageJjim", method = {RequestMethod.GET, RequestMethod.POST} , produces = "application/text; charset=utf8")
	@ResponseBody
	public String mypageJjimListLoad(HttpServletRequest request){
		return contactService.userJjimList((String) request.getSession().getAttribute("user_id"));
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
		
	// 찜 리스트 자체 보내기 = 플래너 일정 생성하는 곳의 찜 리스트
	@PostMapping(value = "ajaxWishList")
	@ResponseBody
	public List<Object> mypageWishListAll(HttpServletRequest request){
		return contactService.mypageScheduleWishList((String) request.getSession().getAttribute("user_id"));
	}
	
	// 메인 플래너 생성 페이지 로드
	@PostMapping(value = "ajaxMypagePlannerTabBar")
	@ResponseBody
	public HashMap<String, Object> ajaxPlannerTabBarSelect(@RequestParam(value = "no") int no) {		
		return contactService.mypagePlannerTabBar(no);
	}
	
	// 생성한 플래너의 일정
	@PostMapping(value = "ajaxMypagePlannerTabContent")
	@ResponseBody
	public List<Object> ajaxPlannerTabContentSelect(@RequestParam(value = "no") int no){
		return contactService.mypagePlannerTabContent(no);
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
	
	@PostMapping(value = "deletePlannerSchedule")
	@ResponseBody
	public String deletePlannerSchedule( @RequestParam(value = "no") int no) {
		helloDao.plannerScheduleDelete(no);
		return "success";
	}
	
	
	// 작성한 플래너 insert / update
	@PostMapping(value = "mainPlannerData")
	@ResponseBody
	public String formMainPlannerAdd(HttpServletRequest request, MypageMainPlannerBean bean) {	
		bean.setUser_id((String) request.getSession().getAttribute("user_id"));
		helloDao.plannerScheduleInsert(bean);
		return "success";
	}

	// 플래너 메인 생성 페이지 이동
	@RequestMapping(value = "allPageLoad")
	public ModelAndView mainPlannerPageLoad(HttpServletRequest request, @RequestParam(value = "no") int no, @RequestParam(value = "modi") String modi) {
		if(modi.equals("createPlanner")) { // 새로운 플래너를 생성
			return new ModelAndView("Final_Pro/myPagePlannerCreate");
		}
		else if(modi.equals("updatePlanner")) { // 플래너 일정 수정
			return new ModelAndView("Final_Pro/myPagePlannerModify");			
		} else { // show 로드
			return new ModelAndView("Final_Pro/myPageShow");
		}
	}
		
}
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
import com.bit.web.vo.MypagePlannerBean;

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
	public String mypageJjimListDelete(HttpServletRequest request, @RequestParam(value = "deleteJjimList[]")String[] locDataList) {
		contactService.mypageJjimDelete(request.getSession().getAttribute("user_id"), locDataList);
		return "redirect:/ajaxMypageJjim";
	}
		
	// 찜 화면에서 장소명 클릭시 상세정보 뿌리기
	@PostMapping(value = "ajaxMypageJjimInfo")
	@ResponseBody
	public MainDbBean mypageJjimInfoSelect(HttpServletRequest request, @RequestParam(value = "loc_code")int loc_code){
		return contactService.getlocInfo(loc_code);
	}
	
	// 플래너 일정 생성 / 수정
	@PostMapping(value = "PlannerDate")
	public String plannerCreateController(HttpServletRequest request, @RequestParam(value = "modi")String modi, MypagePlannerBean bean) {
		ModelAndView mav = new ModelAndView();
		// 새로운 플래너 생성을 위한 일정 생성
		if(modi.equals("createPlanner")) {
			return "redirect:/Final_Pro/myPagePlannerCreate.jsp?planner_no=" + contactService.mypagePlannerNext(request.getSession().getAttribute("user_id"), modi, bean);
		} else { // modi = updatePlanner(플래너 일정 수정)
			contactService.mypagePlannerNext("user_id", modi, bean);			
			return "redirect:/Final_Pro/myPagePlannerModify.jsp?planner_no="+bean.getPlanner_no();
		}
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
		return contactService.mypagePlannerScheduleAdd(loc_code);
	}
	
	@PostMapping(value = "deletePlannerSchedule")
	@ResponseBody
	public String deletePlannerSchedule(@RequestParam(value = "no") int no) {
		contactService.mypageScheduleDelete(no);
		return "success";
	}
	
	@RequestMapping(value = "mypagePlannerDelete")
	public String mypagePlannerDataAllDelete(@RequestParam(value = "no") int no) {
		contactService.mypageScheduleDelete(no);
		contactService.mypagePlannerDelete(no);
		return "redirect:/myPageLoad";
	}
	
	// 작성한 플래너 insert
	@PostMapping(value = "mainPlannerData")
	@ResponseBody
	public String formMainPlannerAdd(HttpServletRequest request, MypageMainPlannerBean bean) {	
		contactService.mypageScheduleInsert(request.getSession().getAttribute("user_id"), bean);
		return "success";
	}
	
	@RequestMapping(value = "myPageDateReset")
	@ResponseBody
	public ModelAndView mypageDateResetPage(@RequestParam(value = "no") int no) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("plannerDateInfo", contactService.mypageDateInfo(no));
		mav.setViewName("Final_Pro/myPageModify");
		return mav;
	}

		
}
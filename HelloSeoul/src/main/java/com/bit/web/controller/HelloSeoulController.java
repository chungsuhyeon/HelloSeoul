package com.bit.web.controller;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.bit.web.service.CtgService;
import com.bit.web.service.MypageService;
import com.bit.web.vo.JoinSeoulBean;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.MultiPageBean;
import com.bit.web.vo.MypageMainPlannerBean;
import com.bit.web.vo.MypagePlannerBean;

@Controller
public class HelloSeoulController {
	@Resource
	private MypageService contactService;
	
	@Resource
	private CtgService ctg;

	// login & session store
	@RequestMapping("siteCheck")
	public String loginProcess(HttpServletRequest request, String user_id, String password) {
		JoinSeoulBean userInfo = contactService.loginPass(user_id, password);
						
		if(userInfo != null) {
			// login success
			request.getSession().setAttribute("user_id", user_id);
			request.getSession().setAttribute("user_nickName", userInfo.getUser_nick());
			request.getSession().setAttribute("user_first", userInfo.getUser_first());
			request.getSession().setMaxInactiveInterval(60*60);
			return "Final_Pro/index";
		}
		else if(user_id.equals("Admin")) {
			return "Final_Pro/AdminPage";
		}
		
		else {
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
		String user_nick = (String)request.getSession().getAttribute("user_nickName");
		ModelAndView mav = new ModelAndView();
		//add
		MultiPageBean bean = ctg.makingTotals2(5, 3, user_id);
		request.getSession().setAttribute("myPaging", bean);
		//add
		mav.addObject("userInfo", contactService.userInfo(user_id));
		mav.addObject("userCreatedPlanner", ctg.userPlanner(user_id, user_nick,bean.getPageStart(), bean.getPageEnd()));
		mav.setViewName("Final_Pro/myPageMain");
		
		return mav;
	}
	
	// 찜보기 화면
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
	public MainDbBean mypageJjimInfoSelect(HttpServletRequest request, int loc_code){
		return contactService.getlocInfo(loc_code);
	}
	
	// 플래너 일정 생성 / 수정
	@PostMapping(value = "PlannerDate")
	public String plannerCreateController(HttpServletRequest request, @RequestParam(value = "modi")String modi, MypagePlannerBean bean) {
		String id = (String)request.getSession().getAttribute("user_id");
		String nick = (String)request.getSession().getAttribute("user_nickName");
		
		ModelAndView mav = new ModelAndView();
		// 새로운 플래너 생성을 위한 일정 생성
		if(modi.equals("createPlanner")) {
			return "redirect:/Final_Pro/myPagePlannerCreate.jsp?planner_no=" + contactService.mypagePlannerNext(id, nick, modi, bean);
		} else { // modi = updatePlanner(플래너 일정 수정)
			contactService.mypagePlannerNext(id, nick, modi, bean);			
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
	public HashMap<String, Object> ajaxPlannerTabBarSelect(int no) {
		return contactService.mypagePlannerTabBar(no);
	}
	
	// 생성한 플래너의 일정
	@PostMapping(value = "ajaxMypagePlannerTabContent")
	@ResponseBody
	public List<Object> ajaxPlannerTabContentSelect(int no){
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
		contactService.mypageScheduleDelete(no); // 일정 테이블에서 일정 제거
		contactService.mypagePlannerDelete(no); // 해당 플래너 삭제
		return "redirect:/myPageLoad";
	}
	
	// 작성한 플래너 insert
	@PostMapping(value = "mainPlannerData")
	@ResponseBody
	public String formMainPlannerAdd(HttpServletRequest request, MypageMainPlannerBean bean) {
		contactService.mypagePlannerUpdateDate(bean.getPlanner_no(), request.getSession().getAttribute("user_nickName"));
		contactService.mypageScheduleInsert(bean);
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
	
	// 특정 문자열을 포함하는 전체 닉네임 리스트
	@PostMapping(value = "ajaxNickCheck")
	@ResponseBody
	public List<String> shareNickCheck(HttpServletRequest request, String nick, int no){
		return contactService.shareNickCheck((String) request.getSession().getAttribute("user_nickName"), nick, no);
	}
	
	// 플래너 공유에 사용자 추가
	@PostMapping(value = "ajaxShareNickAdd")
	@ResponseBody
	public boolean shareNickAddData(String shareNick, int no) {
		return contactService.shareNickAddCheck(shareNick, no);
	}
	
	// 이미 플래너를 공유받고 있는 사용자 리스트
	@PostMapping(value = "ajaxAlreadyShareUser")
	@ResponseBody
	public List<String> alreadyShareUserList(int no){
		return contactService.alreadyShareUserList(no);
	}
	
	// planner 공유하고 있는 사용자 제거
	@PostMapping(value = "ajaxShareNickDelete")
	@ResponseBody
	public String alreadyShareUserDelete(String shareNick, int no){
		contactService.shareNickDelete(shareNick, no);
		return "success";
	}

		
}
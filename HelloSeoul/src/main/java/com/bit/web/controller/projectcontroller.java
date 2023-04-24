package com.bit.web.controller;


import java.io.File;	
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;

import org.codehaus.jackson.map.ObjectMapper;
import org.codehaus.jackson.type.TypeReference;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit.web.dao.ProjectDao;
import com.bit.web.dao.TicketDao;
import com.bit.web.service.CommService;
import com.bit.web.vo.ComBoard;
import com.bit.web.vo.MypageMainPlannerBean;
import com.bit.web.vo.MypagePlannerBean;
import com.bit.web.vo.PageBean;	
import com.bit.web.vo.ReplyBoard;
import com.bit.web.vo.ReportBoard;
import com.bit.web.vo.SeatBoard;
import com.bit.web.vo.gbboard;
import com.mongodb.util.JSON;


@Controller
public class projectcontroller {
	@Resource
	ProjectDao dao;
	@Resource
	TicketDao tkdao;
	@Autowired
	private PaginAction pageAction;
	@Resource
	private CommService commService;
	
	@GetMapping(value="boardSelect")
	public String boardSelect(ComBoard board,Model model,HttpServletRequest request) {
//		System.out.println(planner_no);
		commService.selectBoard(board, model, request);
		return "Final_Pro/ComList";
	}
	@RequestMapping(value="infoSelect")
	public String infoSelect(int no,Model model) {
		commService.hitAction(no);	
		model.addAttribute("info", dao.selectInfoBoard(no));
		model.addAttribute("reply",dao.selectReply(no));

		return "Final_Pro/ComInfo";
	}
	@RequestMapping(value="deleteCom")
	public String deleteCom(int no,Model model,@RequestParam(value="user_id")String id) {
	
		if(
			commService.checkId(no, id)) {
			commService.deleteBoard(no);
			return "redirect:/boardSelect";
		}else{
			return "redirect:/infoSelect?no="+no;
		}
			
	}
	@RequestMapping(value="modifyAction")
	public String modifyAction(int no,Model model,@RequestParam(value="user_id")String id,int planner_no) {
		if(commService.checkId(no, id)) {
//			System.out.println(planner_no);
		model.addAttribute("Pltt",commService.SelectPlannerTitle(planner_no));
		model.addAttribute("info",dao.selectInfoBoard(no));
		return "Final_Pro/Commodify";
		}else{
			
			return "redirect:/infoSelect?no="+no;
		}
		
	}
	@RequestMapping(value="boardUpdate")
	public String boardUpdate(int no,ComBoard board,Model model,@RequestParam(value="file",required = false,defaultValue = "noimg.jsp")MultipartFile file) {
		board.setCom_no(no);
		System.out.println(board);
		commService.updateBoard(board,file);
		
		return "redirect:/boardSelect";
	}
	@RequestMapping(value="replyInsert")
	@ResponseBody
	public List<Object> replyInsert(String reply,ReplyBoard reboard,int no,String id) {
		commService.replyInsert(reply, reboard, no, id);
		commService.commBoardReplyUpdate(no);
		return commService.selectReply(no);
	}
	@RequestMapping(value="deleteReplyMain")
	public String eleteReplyMain(int no,Model model,int boardno,String user_id) {
		if(commService.checkReplyId(no, user_id)) {
		commService.commBoardReplyMinusUpdate(boardno);
		commService.deleteReply(no);	
		}else {
			System.out.println("cant");
		}
		return "redirect:/infoSelect?no="+boardno;
	}
	@RequestMapping(value="goodAction")
	@ResponseBody
	public List<Object> goodAction(int com_no,String user_id,gbboard board,HashMap<String, Object>map) {
		commService.goodAction(com_no, user_id, board, map);
		
		return commService.selectGBboard(com_no);
	}
	@RequestMapping(value="badAction")
	@ResponseBody
	public List<Object> badAction(int com_no,String user_id,gbboard board,HashMap<String, Object>map) {
		commService.badAction(com_no, user_id, board, map);
		return commService.selectGBboard(com_no);
	}
	@RequestMapping(value="boardInsert")
	public String boardInsert(ComBoard board,@RequestParam(value="file",required = false,defaultValue = "noimg.jsp")MultipartFile file) {
		commService.boardInsert(board, file);
		return "redirect:/boardSelect";
	}
	@RequestMapping(value="PlannerShare")
	public String PlannerShare(int planner_no,Model model) {
		model.addAttribute("Pltt",commService.SelectPlannerTitle(planner_no));
		
		return "Final_Pro/ComWrite";
	}
	@RequestMapping(value="SharePlanner")
	public void SharePlanner(HttpServletRequest request,int planner_no,Model model,MypagePlannerBean bean,String user_id) {
		String user_nick = (String)request.getSession().getAttribute("user_nickName");
		commService.jjimPlanner(bean, planner_no, user_id, user_nick);	
	}

	@RequestMapping(value="reportAction")
	public String reportAction(@RequestParam(value="rr")List<Integer>rr,int com_no,String user_id,ReportBoard bean) {
		commService.insertReport(rr, com_no, user_id, bean);
		return "redirect:/infoSelect?no="+com_no;
	}
	
}
	
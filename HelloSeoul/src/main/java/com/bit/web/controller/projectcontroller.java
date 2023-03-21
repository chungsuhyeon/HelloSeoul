package com.bit.web.controller;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bit.web.dao.ProjectDao;
import com.bit.web.vo.ComBoard;
import com.bit.web.vo.ReplyBoard;
import com.bit.web.vo.gbboard;
import com.mongodb.util.JSON;


@Controller
public class projectcontroller {
	@Resource
	ProjectDao dao;
	@PostMapping(value="boardInsert")
	public String boardInsert(ComBoard board) {
		board.setCom_no(dao.selectBoradNo());	
		dao.boardInsert(board);
		return "redirect:/boardSelect";
	}
	@GetMapping(value="boardSelect")
	public String boardSelect(ComBoard board,Model model) {
		model.addAttribute("board",dao.selectBoard());
		return "making/workbench";
	}
	@RequestMapping(value="infoSelect")
	public String infoSelect(int no,Model model) {
		dao.hitAction(no);
		model.addAttribute("info", dao.selectInfoBoard(no));
		model.addAttribute("reply",dao.selectReply(no));
		return "Final_Pro/ComInfo";
	}
	@RequestMapping(value="deleteCom")
	public String deleteCom(int no,Model model,@RequestParam(value="user_id")String id) {
	
		if(dao.selectBoardId(no).equals(dao.selectId(id))) {
			dao.deleteReply(no);
			dao.deleteGBboard(no);
			dao.deleteBoard(no);
		}else{
			return "redirect:/infoSelect?no="+no;
		}
		model.addAttribute("board",dao.selectBoard());	
		return "redirect:/boardSelect";
	}
	@RequestMapping(value="modifyAction")
	public String modifyAction(int no,Model model,@RequestParam(value="user_id")String id) {
		if(dao.selectBoardId(no).equals(dao.selectId(id))) {
		
		model.addAttribute("info",dao.selectInfoBoard(no));
		return "Final_Pro/Commodify";
		}else{
			
			return "redirect:/infoSelect?no="+no;
		}
		
	}
	@RequestMapping(value="boardUpdate")
	public String boardUpdate(int no,ComBoard board,Model model) {
		board.setCom_no(no);
		dao.updateBoard(board);
		model.addAttribute("board",dao.selectBoard());
		return "Final_Pro/ComList";
	}
	@RequestMapping(value="replyInsert")
	@ResponseBody
	public List<Object> replyInsert(String reply,ReplyBoard reboard,int no,String id) {
		reboard.setRep_cont(reply);
		reboard.setCom_no(no);
		reboard.setRep_no(dao.replyBoardNo());
		reboard.setUser_id(id);
		reboard.setUser_nick(dao.selectNick(id));
		dao.replyInsert(reboard);
		dao.replyUpdate(no);
		return dao.selectReply(no);
	}
	@RequestMapping(value="deleteReplyMain")
	public String eleteReplyMain(int no,Model model,int boardno,String user_id) {
		if(dao.selectReplyid(no).equals(dao.selectId(user_id))) {
		dao.updateMinusReply(boardno);
		dao.deleteReplymain(no);	
		}else {
			System.out.println("cant");
		}
		return "redirect:/infoSelect?no="+boardno;
	}
	@RequestMapping(value="goodAction")
	@ResponseBody
	public List<Object> goodAction(int com_no,String user_id,gbboard board,HashMap<String, Object>map) {
		map.put("user_id", user_id);
		map.put("com_no", com_no);
		if((dao.goodbadSelectGood(map))==null) {	
			board.setUser_id(user_id);
			board.setCom_no(com_no);
			board.setGood(1);
			dao.goodAction(board);
			dao.goodBoard(com_no);
		}else if(dao.goodbadSelectbad(map)==1) {
			dao.updategoodGBboard(map);
			dao.badBoardMi(com_no);
			dao.goodBoard(com_no);
		}
		else {
			dao.goodbadDelete(map);
			dao.goodBoardMi(com_no);
		}
		return dao.selectGBboard(com_no);
	}
	@RequestMapping(value="badAction")
	@ResponseBody
	public List<Object> badAction(int com_no,String user_id,gbboard board,HashMap<String, Object>map) {
		map.put("user_id", user_id);
		map.put("com_no", com_no);
		
		if((dao.goodbadSelectbad(map))==null) {	
			board.setUser_id(user_id);
			board.setCom_no(com_no);
			board.setBad(1);
			dao.badAction(board);
			dao.badBoard(com_no);
		}else if(dao.goodbadSelectGood(map)==1){
			dao.updatebadGBboard(map);
			dao.goodBoardMi(com_no);
			dao.badBoard(com_no);
		}
		else {
			dao.goodbadDelete(map);
			dao.badBoardMi(com_no);
		}
		return dao.selectGBboard(com_no);
	}
}
	
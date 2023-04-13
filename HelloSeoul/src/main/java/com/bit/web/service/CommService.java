package com.bit.web.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.bit.web.vo.ComBoard;
import com.bit.web.vo.MypagePlannerBean;
import com.bit.web.vo.ReplyBoard;
import com.bit.web.vo.ReportBoard;
import com.bit.web.vo.gbboard;

public interface CommService {
	Integer hitAction(int no);
	
	boolean checkId(int no,String id);
	
	void deleteBoard(int no);
	
	List<Object> updateBoard(ComBoard board,MultipartFile file);
	
	void replyInsert(String reply,ReplyBoard reboard,int no,String id);
	
	void commBoardReplyUpdate(int no);
	
	List<Object> selectReply(int no);
	
	void commBoardReplyMinusUpdate(int no);
	
	void deleteReply(int no);
	
	boolean checkReplyId(int no,String user_id);
	
	void goodAction(int com_no,String user_id,gbboard board,HashMap<String, Object>map);
	
	void badAction(int com_no,String user_id,gbboard board,HashMap<String, Object>map);
	
	List<Object> selectGBboard(int com_no);
	
	void boardInsert(ComBoard board,MultipartFile file);
	
//	List<Object> selectBoard(Map<String, Object>map);
//	List<Object> selectBoardtop3();
	void selectBoard(ComBoard board,Model model,HttpServletRequest request);
	String SelectPlannerTitle(int planner_no);
	
	
	void createSharePlanner(MypagePlannerBean bean,int planner_no,String user_id);
	
	List<Object> selectSharePlanner(int no);
	void insertReport(List<Integer>rr,int com_no,String user_id,ReportBoard bean);
}

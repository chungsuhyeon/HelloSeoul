package com.bit.web.service;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.print.DocFlavor.STRING;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.bit.web.controller.PaginAction;
import com.bit.web.dao.HelloSeoulDao;
import com.bit.web.dao.ProjectDao;
import com.bit.web.vo.ComBoard;
import com.bit.web.vo.MypagePlannerBean;
import com.bit.web.vo.PageBean;
import com.bit.web.vo.ReplyBoard;
import com.bit.web.vo.ReportBoard;
import com.bit.web.vo.gbboard;
import com.mongodb.spark.sql.fieldTypes.api.java.Timestamp;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class CommServiceImpl implements CommService{
	@Autowired
	ProjectDao commdao;
	@Autowired
	HelloSeoulDao HSdao;
	@Autowired
	private PaginAction pageAction;
	@Override
	public Integer hitAction(int no) {
		// TODO Auto-generated method stub
		return commdao.hitAction(no);
	}
	@Override
	public boolean checkId(int no, String id) {
		// TODO Auto-generated method stub
		if(commdao.selectBoardId(no).equals(commdao.selectId(id))) {
			
			return true;
		}else {
			return false;
		}
	}
	@Override
	public void deleteBoard(int no) {
		commdao.deleteReply(no);
		commdao.deleteGBboard(no);
		commdao.reportDelete(no);
		commdao.deleteBoard(no);
		// TODO Auto-generated method stub
		
	}
	@Override
	public List<Object> updateBoard(ComBoard board,MultipartFile file) {
		// TODO Auto-generated method stub
				String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
				long size = file.getSize(); //파일 사이즈
				System.out.println(file);
				System.out.println("파일명 : "  + fileRealName);
				System.out.println("용량크기(byte) : " + size);
				//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
				String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
				String uploadFolder = "E:\\workspring\\helloseoulproject\\HelloSeoul\\HelloSeoul\\src\\main\\webapp\\resources\\test";
				
				
				System.out.println(uploadFolder);
				
				/*
				  파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
				  업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
				  타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
				  고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
				 */
				
				UUID uuid = UUID.randomUUID();
				System.out.println(uuid.toString());
				String[] uuids = uuid.toString().split("-");
				String uniqueName = uuids[0];
				System.out.println("생성된 고유문자열" + uniqueName);
				System.out.println("확장자명" + fileExtension);
				
				String filename=uniqueName+fileExtension;
				board.setCom_filename(filename);
				
				// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
				
				File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
				try {
					file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
				} catch (IllegalStateException e) {
					e.printStackTrace();
				} catch (IOException e) {
					e.printStackTrace();
				}
		// TODO Auto-generated method stub
		return commdao.updateBoard(board);
	}
	@Override
	public void replyInsert(String reply, ReplyBoard reboard, int no, String id) {
		// TODO Auto-generated method stub
		reboard.setRep_cont(reply);
		reboard.setCom_no(no);
		reboard.setRep_no(commdao.replyBoardNo());
		reboard.setUser_id(id);
		reboard.setUser_nick(commdao.selectNick(id));
		commdao.replyInsert(reboard);
	}
	@Override
	public void commBoardReplyUpdate(int no) {
		// TODO Auto-generated method stub
		commdao.replyUpdate(no);
	}
	@Override
	public List<Object> selectReply(int no) {
		// TODO Auto-generated method stub
		return commdao.selectReply(no);
	}
	@Override
	public void commBoardReplyMinusUpdate(int no) {
		commdao.updateMinusReply(no);
		// TODO Auto-generated method stub
		
	}
	@Override
	public void deleteReply(int no) {
		commdao.deleteReplymain(no);
		// TODO Auto-generated method stub
		
	}
	@Override
	public boolean checkReplyId(int no, String user_id) {
		// TODO Auto-generated method stub
		if(commdao.selectReplyid(no).equals(commdao.selectId(user_id))) {
			return true;
		}else {
			return false;
		}
	}
	@Override
	public void goodAction(int com_no, String user_id, gbboard board, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		map.put("user_id", user_id);
		map.put("com_no", com_no);
		if((commdao.goodbadSelectGood(map))==null) {	
			board.setUser_id(user_id);
			board.setCom_no(com_no);
			board.setGood(1);
			commdao.goodAction(board);
			commdao.goodBoard(com_no);
		}else if(commdao.goodbadSelectbad(map)==1) {
			commdao.updategoodGBboard(map);
			commdao.badBoardMi(com_no);
			commdao.goodBoard(com_no);
		}
		else {
			commdao.goodbadDelete(map);
			commdao.goodBoardMi(com_no);
		}
	}
	@Override
	public void badAction(int com_no, String user_id, gbboard board, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		map.put("user_id", user_id);
		map.put("com_no", com_no);
		
		if((commdao.goodbadSelectbad(map))==null) {	
			board.setUser_id(user_id);
			board.setCom_no(com_no);
			board.setBad(1);
			commdao.badAction(board);
			commdao.badBoard(com_no);
		}else if(commdao.goodbadSelectGood(map)==1){
			commdao.updatebadGBboard(map);
			commdao.goodBoardMi(com_no);
			commdao.badBoard(com_no);
		}
		else {
			commdao.goodbadDelete(map);
			commdao.badBoardMi(com_no);
		}
	}
	@Override
	public List<Object> selectGBboard(int com_no) {
		// TODO Auto-generated method stub
		
		return commdao.selectGBboard(com_no);
	}
	@Override
	public void boardInsert(ComBoard board, MultipartFile file) {
		// TODO Auto-generated method stub
		String fileRealName = file.getOriginalFilename(); //파일명을 얻어낼 수 있는 메서드!
		long size = file.getSize(); //파일 사이즈
		System.out.println(file);
		System.out.println("파일명 : "  + fileRealName);
		System.out.println("용량크기(byte) : " + size);
		//서버에 저장할 파일이름 fileextension으로 .jsp이런식의  확장자 명을 구함
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "E:\\workspring\\helloseoulproject\\HelloSeoul\\HelloSeoul\\src\\main\\webapp\\resources\\test";

		
		/*
		  파일 업로드시 파일명이 동일한 파일이 이미 존재할 수도 있고 사용자가 
		  업로드 하는 파일명이 언어 이외의 언어로 되어있을 수 있습니다. 
		  타인어를 지원하지 않는 환경에서는 정산 동작이 되지 않습니다.(리눅스가 대표적인 예시)
		  고유한 랜던 문자를 통해 db와 서버에 저장할 파일명을 새롭게 만들어 준다.
		 */
		
		UUID uuid = UUID.randomUUID();
		System.out.println(uuid.toString());
		String[] uuids = uuid.toString().split("-");
		String uniqueName = uuids[0];
		System.out.println("생성된 고유문자열" + uniqueName);
		System.out.println("확장자명" + fileExtension);
		
		String filename=uniqueName+fileExtension;
		board.setCom_filename(filename);
		
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 적용 전
		
		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 적용 후
		try {
			file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		board.setCom_no(commdao.selectBoradNo());	
		commdao.boardInsert(board);
	}
	@Override
	public void selectBoard(ComBoard board, Model model, HttpServletRequest request) {
		// TODO Auto-generated method stub
		PageBean pageBean=pageAction.paging(request);
		model.addAttribute("pageBean",pageBean);
		HashMap<String, Object>map=new HashMap<String, Object>();
		map.put("start", pageBean.getStart());
		map.put("end",pageBean.getEnd());
	
		
		model.addAttribute("top3",commdao.selecttop3());
		model.addAttribute("board",commdao.selectBoard(map));
	}
	@Override
	public String SelectPlannerTitle(int plno) {
		// TODO Auto-generated method stub
		return commdao.SelectPlannerTitle(plno);
	}
	
	@Override
	public void createSharePlanner(MypagePlannerBean bean, int plno, String user_id) {
		// TODO Auto-generated method stub
		HashMap<String, Object>map=commdao.SharePlanner(plno);
		Object startTime=map.get("PLANNER_START");
		String start=new SimpleDateFormat("yyyy/MM/dd").format(startTime);
		Object endTime=map.get("PLANNER_END");
		String end=new SimpleDateFormat("yyyy/MM/dd").format(endTime);
		bean.setPlanner_start(start);
		bean.setPlanner_end(end);
		bean.setUser_id(user_id);
		bean.setPlanner_title((String)(map.get("PLANNER_TITLE")));
		bean.setPlanner_info((String)(map.get("PLANNER_INFO")));
		bean.setPlanner_no(HSdao.getPlannerNo());
//		System.out.println(bean);
		HSdao.plannerDataInsert(bean);
	}
	@Override
	public List<Object> selectSharePlanner(int no) {
		// TODO Auto-generated method stub
		return commdao.selectSharePlanner(no);
	}
	@Override
	public void insertReport(List<Integer> rr, int com_no, String user_id,ReportBoard bean) {
	
		// TODO Auto-generated method stub
		for (Integer integer : rr) {
			bean.setCom_no(com_no);
			bean.setReport_reason(integer);
			bean.setUser_id(user_id);
			commdao.insertReport(bean);
		}		
		commdao.reportUpdate(com_no);
	}
	

	
	
	

}

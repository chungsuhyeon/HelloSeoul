package com.bit.web.service;

import java.io.File;
import java.io.IOException;
import java.lang.reflect.Array;
import java.sql.Date;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.bit.web.controller.PaginAction;
import com.bit.web.dao.HelloSeoulDao;
import com.bit.web.dao.ProjectDao;
import com.bit.web.vo.ComBoard;
import com.bit.web.vo.MypageMainPlannerBean;
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
	public List<Object> updateBoard(ComBoard board,@RequestParam(value="file",required = false) MultipartFile file) {
		// TODO Auto-generated method stub
				String fileRealName = file.getOriginalFilename(); //占쏙옙占싹몌옙占쏙옙 占쏙옙爭� 占쏙옙 占쌍댐옙 占쌨쇽옙占쏙옙!
				long size = file.getSize(); //占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
//				System.out.println(file);
//				System.out.println("占쏙옙占싹몌옙 : "  + fileRealName);
//				System.out.println("占쎈량크占쏙옙(byte) : " + size);
				//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싱몌옙 fileextension占쏙옙占쏙옙 .jsp占싱뤄옙占쏙옙占쏙옙  확占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
				if(fileRealName!="") {
					System.out.println("占쏙옙占쏙옙占쏙옙占쏙옙");
					String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
					String uploadFolder = "D:\\Final\\HelloSeoul\\HelloSeoul\\src\\main\\webapp\\resources\\test";
			
					
					/*
					  占쏙옙占쏙옙 占쏙옙占싸듸옙占� 占쏙옙占싹몌옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占싱뱄옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쌍곤옙 占쏙옙占쏙옙微占� 
					  占쏙옙占싸듸옙 占싹댐옙 占쏙옙占싹몌옙占쏙옙 占쏙옙占� 占싱울옙占쏙옙 占쏙옙占쏙옙 占실억옙占쏙옙占쏙옙 占쏙옙 占쌍쏙옙占싹댐옙. 
					  타占싸어를 占쏙옙占쏙옙占쏙옙占쏙옙 占십댐옙 환占썸에占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占십쏙옙占싹댐옙.(占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙표占쏙옙占쏙옙 占쏙옙占쏙옙)
					  占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쌘몌옙 占쏙옙占쏙옙 db占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占싹몌옙占쏙옙 占쏙옙占쌈곤옙 占쏙옙占쏙옙占� 占쌔댐옙.
					 */
					
					UUID uuid = UUID.randomUUID();
					System.out.println(uuid.toString());
					String[] uuids = uuid.toString().split("-");
					String uniqueName = uuids[0];
//					System.out.println("占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쌘울옙" + uniqueName);
//					System.out.println("확占쏙옙占쌘몌옙" + fileExtension);
//				
					String filename=uniqueName+fileExtension;
					board.setCom_filename(filename);
					
//					File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 占쏙옙占쏙옙 占쏙옙
					
					File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 占쏙옙占쏙옙 占쏙옙
					try {
						file.transferTo(saveFile); // 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙氷占쏙옙占�(filewriter 占쌜억옙占쏙옙 占쌌쏙옙占쏙옙 占싼방에 처占쏙옙占쏙옙占쌔댐옙.)
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}else {
					board.setCom_filename("noimg.jpg");
					System.out.println("占쏙옙占싹억옙占쏙옙");
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
	public void boardInsert(ComBoard board, @RequestParam(value="file",required = false) MultipartFile file) {
		// TODO Auto-generated method stub
		
     	String fileRealName = file.getOriginalFilename(); //占쏙옙占싹몌옙占쏙옙 占쏙옙爭� 占쏙옙 占쌍댐옙 占쌨쇽옙占쏙옙!
		long size = file.getSize(); //占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙
//		System.out.println(file);
//		System.out.println("占쏙옙占싹몌옙 : "  + fileRealName);
//		System.out.println("占쎈량크占쏙옙(byte) : " + size);
		//占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占싱몌옙 fileextension占쏙옙占쏙옙 .jsp占싱뤄옙占쏙옙占쏙옙  확占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙
		if(fileRealName!="") {
			System.out.println("占쏙옙占쏙옙占쏙옙占쏙옙");
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			String uploadFolder = "D:\\Final\\HelloSeoul\\HelloSeoul\\src\\main\\webapp\\resources\\test";
	
			
			/*
			  占쏙옙占쏙옙 占쏙옙占싸듸옙占� 占쏙옙占싹몌옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占싱뱄옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쌍곤옙 占쏙옙占쏙옙微占� 
			  占쏙옙占싸듸옙 占싹댐옙 占쏙옙占싹몌옙占쏙옙 占쏙옙占� 占싱울옙占쏙옙 占쏙옙占쏙옙 占실억옙占쏙옙占쏙옙 占쏙옙 占쌍쏙옙占싹댐옙. 
			  타占싸어를 占쏙옙占쏙옙占쏙옙占쏙옙 占십댐옙 환占썸에占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占십쏙옙占싹댐옙.(占쏙옙占쏙옙占쏙옙占쏙옙 占쏙옙표占쏙옙占쏙옙 占쏙옙占쏙옙)
			  占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쌘몌옙 占쏙옙占쏙옙 db占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙 占쏙옙占싹몌옙占쏙옙 占쏙옙占쌈곤옙 占쏙옙占쏙옙占� 占쌔댐옙.
			 */
			
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			System.out.println("占쏙옙占쏙옙占쏙옙 占쏙옙占쏙옙占쏙옙占쌘울옙" + uniqueName);
			System.out.println("확占쏙옙占쌘몌옙" + fileExtension);
		
			String filename=uniqueName+fileExtension;
			board.setCom_filename(filename);
			
//			File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid 占쏙옙占쏙옙 占쏙옙
			
			File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // 占쏙옙占쏙옙 占쏙옙
			try {
				file.transferTo(saveFile); // 占쏙옙占쏙옙 占쏙옙占쏙옙 占쏙옙占쏙옙氷占쏙옙占�(filewriter 占쌜억옙占쏙옙 占쌌쏙옙占쏙옙 占싼방에 처占쏙옙占쏙옙占쌔댐옙.)
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			board.setCom_filename("noimg.jpg");
			System.out.println("占쏙옙占싹억옙占쏙옙");
		}
		board.setCom_no(commdao.selectBoradNo());	
		System.out.println(board);
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
	public String SelectPlannerTitle(int planner_no) {
		// TODO Auto-generated method stub
		return commdao.SelectPlannerTitle(planner_no);
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
	@Override
	public void jjimPlanner(MypagePlannerBean bean, int planner_no, String user_id, String user_nick) {
		// TODO Auto-generated method stub
		
		bean=commdao.SharePlanner(planner_no);
		String nick=bean.getUpdate_user();
		bean.setPlanner_title(bean.getPlanner_title()+"("+nick+"님의 플래너");
		bean.setPlanner_no(HSdao.getPlannerNo());
		bean.setUser_id(user_id);
		bean.setUpdate_user(user_nick);
		bean.setUse_yn("y");
		String start=bean.getPlanner_start().split(" ")[0];
		String end=bean.getPlanner_end().split(" ")[0];
		bean.setPlanner_start(start);
		bean.setPlanner_end(end);
		HSdao.plannerDataInsert(bean);
		for(MypageMainPlannerBean seat:commdao.selectSharePlanner(planner_no)) {
			seat.setUser_id(user_id);
			seat.setPlanner_no(bean.getPlanner_no());
			seat.setUse_yn("y");
			HSdao.plannerScheduleInsert(seat);
		}
		
	}
	
	
	
	
	

}

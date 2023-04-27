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
				String fileRealName = file.getOriginalFilename(); //���ϸ��� �� �� �ִ� �޼���!
				long size = file.getSize(); //���� ������
//				System.out.println(file);
//				System.out.println("���ϸ� : "  + fileRealName);
//				System.out.println("�뷮ũ��(byte) : " + size);
				//������ ������ �����̸� fileextension���� .jsp�̷�����  Ȯ���� ���� ����
				if(fileRealName!="") {
					System.out.println("��������");
					String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
					String uploadFolder = "D:\\Final\\HelloSeoul\\HelloSeoul\\src\\main\\webapp\\resources\\test";
			
					
					/*
					  ���� ���ε�� ���ϸ��� ������ ������ �̹� ������ ���� �ְ� ����ڰ� 
					  ���ε� �ϴ� ���ϸ��� ��� �̿��� ���� �Ǿ����� �� �ֽ��ϴ�. 
					  Ÿ�ξ �������� �ʴ� ȯ�濡���� ���� ������ ���� �ʽ��ϴ�.(�������� ��ǥ���� ����)
					  ������ ���� ���ڸ� ���� db�� ������ ������ ���ϸ��� ���Ӱ� ����� �ش�.
					 */
					
					UUID uuid = UUID.randomUUID();
					System.out.println(uuid.toString());
					String[] uuids = uuid.toString().split("-");
					String uniqueName = uuids[0];
//					System.out.println("������ �������ڿ�" + uniqueName);
//					System.out.println("Ȯ���ڸ�" + fileExtension);
//				
					String filename=uniqueName+fileExtension;
					board.setCom_filename(filename);
					
//					File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid ���� ��
					
					File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // ���� ��
					try {
						file.transferTo(saveFile); // ���� ���� ����޼���(filewriter �۾��� �ս��� �ѹ濡 ó�����ش�.)
					} catch (IllegalStateException e) {
						e.printStackTrace();
					} catch (IOException e) {
						e.printStackTrace();
					}
				}else {
					board.setCom_filename("noimg.jpg");
					System.out.println("���Ͼ���");
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
		
     	String fileRealName = file.getOriginalFilename(); //���ϸ��� �� �� �ִ� �޼���!
		long size = file.getSize(); //���� ������
//		System.out.println(file);
//		System.out.println("���ϸ� : "  + fileRealName);
//		System.out.println("�뷮ũ��(byte) : " + size);
		//������ ������ �����̸� fileextension���� .jsp�̷�����  Ȯ���� ���� ����
		if(fileRealName!="") {
			System.out.println("��������");
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			String uploadFolder = "D:\\Final\\HelloSeoul\\HelloSeoul\\src\\main\\webapp\\resources\\test";
	
			
			/*
			  ���� ���ε�� ���ϸ��� ������ ������ �̹� ������ ���� �ְ� ����ڰ� 
			  ���ε� �ϴ� ���ϸ��� ��� �̿��� ���� �Ǿ����� �� �ֽ��ϴ�. 
			  Ÿ�ξ �������� �ʴ� ȯ�濡���� ���� ������ ���� �ʽ��ϴ�.(�������� ��ǥ���� ����)
			  ������ ���� ���ڸ� ���� db�� ������ ������ ���ϸ��� ���Ӱ� ����� �ش�.
			 */
			
			UUID uuid = UUID.randomUUID();
			System.out.println(uuid.toString());
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			System.out.println("������ �������ڿ�" + uniqueName);
			System.out.println("Ȯ���ڸ�" + fileExtension);
		
			String filename=uniqueName+fileExtension;
			board.setCom_filename(filename);
			
//			File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid ���� ��
			
			File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // ���� ��
			try {
				file.transferTo(saveFile); // ���� ���� ����޼���(filewriter �۾��� �ս��� �ѹ濡 ó�����ش�.)
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}else {
			board.setCom_filename("noimg.jpg");
			System.out.println("���Ͼ���");
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
		bean.setPlanner_title(bean.getPlanner_title()+"("+nick+"님의 플래너)");
		bean.setPlanner_no(HSdao.getPlannerNo());
		bean.setUser_id(user_id);
		bean.setUpdate_user(user_nick);
		bean.setUse_yn("y");
		String start=bean.getPlanner_start().split(" ")[0];
		String end=bean.getPlanner_end().split(" ")[0];
		bean.setPlanner_start(start);
		bean.setPlanner_end(end);
		System.out.println(bean);
		HSdao.plannerDataInsert(bean);
		System.out.println(commdao.selectSharePlanner(planner_no));
		for(MypageMainPlannerBean seat:commdao.selectSharePlanner(planner_no)) {
			seat.setUser_id(user_id);
			seat.setPlanner_no(bean.getPlanner_no());
			seat.setUse_yn("y");
			HSdao.plannerScheduleInsert(seat);
			System.out.println(seat);
		}
		
	}
	
	
	
	
	

}

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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bit.web.dao.ProjectDao;
import com.bit.web.dao.TicketDao;
import com.bit.web.vo.ComBoard;
import com.bit.web.vo.ReplyBoard;
import com.bit.web.vo.SeatBoard;
import com.bit.web.vo.gbboard;
import com.mongodb.util.JSON;


@Controller
public class projectcontroller {
	@Resource
	ProjectDao dao;
	@Resource
	TicketDao tkdao;
//	@PostMapping(value="boardInsert")
//	public String boardInsert(ComBoard board) {
//		board.setCom_no(dao.selectBoradNo());	
//		dao.boardInsert(board);
//		return "redirect:/boardSelect";
//	}
	@GetMapping(value="boardSelect")
	public String boardSelect(ComBoard board,Model model) {
		System.out.println(dao.selecttop3());
		model.addAttribute("top3",dao.selecttop3());
		model.addAttribute("board",dao.selectBoard());
		return "Final_Pro/ComList";
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
	
	@RequestMapping(value="ticketing")
	public String ticketing(SeatBoard board,@RequestParam int no,@RequestParam String user_id ,@RequestParam(value="seatVal") List<String>seatVal,Model model,String rundate) {
		System.out.println(seatVal);
		System.out.println(no);
		System.out.println(user_id);
		System.out.println(rundate);
		for(String seat:seatVal) {
			board.setNo(no);
			board.setUser_id(user_id);
			board.setSeat(seat);
			board.setRundate(rundate);
			dao.insertSeatTable(board);
			System.out.println(board	);
		}
//		List<Object>seatVal2=new ArrayList<Object>(dao.selectSeatTable());
//		model.addAttribute("seat",seatVal2);
//		System.out.println(seatVal2);
		
//		System.out.println(dao.selectSeatTable(no));
	      
		return "/making/tiketok";
		
	}
	@RequestMapping(value = "booking")
	public String bookingSeat(int no,Model model,String date,String rundate) {
		System.out.println(date);
		System.out.println(rundate);
		String realdate=date+" "+rundate;
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("rundate", realdate);
		map.put("no", no);
		List<Object>seatVal2=new ArrayList<Object>(dao.selectSeatTable(map));
		System.out.println(seatVal2);
		model.addAttribute("seat",seatVal2);
		model.addAttribute("bookinginfo",tkdao.selectBookingInfo(no));
		
		model.addAttribute("date",realdate);
		return "making/seat";
	}
	@RequestMapping (value = "contentImg")
	public String ImgCheck(int no,Model model) {
//		System.out.println("contentImg");
//		System.out.println(imgsrc);
		model.addAttribute("ticketinfo", tkdao.selectTicketInfo(no));
		System.out.println(model);
		return "making/dhTicketDetail";
	}

	@RequestMapping(value="boardInsert")
	public String boardInsert(ComBoard board,@RequestParam(value="file")MultipartFile file) {
		String fileRealName = file.getOriginalFilename(); //���ϸ��� �� �� �ִ� �޼���!
		long size = file.getSize(); //���� ������
		System.out.println(file);
		System.out.println("���ϸ� : "  + fileRealName);
		System.out.println("�뷮ũ��(byte) : " + size);
		//������ ������ �����̸� fileextension���� .jsp�̷�����  Ȯ���� ���� ����
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "E:\\workspring\\finalFinalFinalproject\\HelloSeoul\\HelloSeoul\\src\\main\\webapp\\resources\\test\\";
		
		
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
		
		String filename=uniqueName+"."+fileExtension;
		board.setCom_filename(filename);
		
		// File saveFile = new File(uploadFolder+"\\"+fileRealName); uuid ���� ��
		
		File saveFile = new File(uploadFolder+"\\"+uniqueName + fileExtension);  // ���� ��
		try {
			file.transferTo(saveFile); // ���� ���� ����޼���(filewriter �۾��� �ս��� �ѹ濡 ó�����ش�.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		board.setCom_no(dao.selectBoradNo());	
		dao.boardInsert(board);
		return "redirect:/boardSelect";
	}
	
}
	
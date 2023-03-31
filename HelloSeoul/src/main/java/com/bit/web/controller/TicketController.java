package com.bit.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.bit.web.dao.ProjectDao;
import com.bit.web.dao.TicketDao;
import com.bit.web.vo.MusicalBean;
import com.bit.web.vo.SeatBoard;

@Controller
public class TicketController {
	
	@Autowired
	private TicketDao dao;
	private MusicalBean bean;
	@Autowired
	private ProjectDao commdao;

//	@RequestMapping (value = "contentImg")
//	public String ImgCheck(int no,Model model) {
//		System.out.println("contentImg");
//		System.out.println(imgsrc);
//		model.addAttribute("ticketinfo", dao.selectTicketInfo(no));
//		System.out.println(model);
//		return "Final_Pro/TicketDetail";
//	}
	@RequestMapping (value = "contentImg")
	public String ImgCheck(int no,Model model) {
		model.addAttribute("ticketinfo", dao.selectTicketInfo(no));
		return "making/dhTicketDetail";
	}
	@RequestMapping (value = "musicalList")
	public String musicallist(Model model) {
//		System.out.println("test");
		HashMap<String, Object>map= new HashMap<String, Object>();
		model.addAttribute("musicallist", dao.selectMusicalList(map));
		model.addAttribute("musicallist2", dao.selectMusicalList2(map));
		model.addAttribute("musicallist3", dao.selectMusicalList3(map));
		model.addAttribute("musicallist4", dao.selectMusicalList4(map));
		model.addAttribute("musicallist5", dao.selectMusicalList5(map));
		return "Final_Pro/Musicalmain";
	}
	
	@RequestMapping (value = "movieList")
	public String movielist(Model model) {
//		System.out.println("test");
		HashMap<String, Object>map= new HashMap<String, Object>();
		model.addAttribute("movielist", dao.selectMusicalList(map));
		model.addAttribute("movielist2", dao.selectMusicalList2(map));
		model.addAttribute("movielist3", dao.selectMusicalList3(map));
		model.addAttribute("movielist4", dao.selectMusicalList4(map));
		model.addAttribute("movielist5", dao.selectMusicalList5(map));
		return "Final_Pro/Moviemain";
	}
	
	@RequestMapping (value = "theaterList")
	public String theaterlist(Model model) {
//		System.out.println("test");
		HashMap<String, Object>map= new HashMap<String, Object>();
		model.addAttribute("theaterlist", dao.selectMusicalList(map));
		model.addAttribute("theaterlist2", dao.selectMusicalList2(map));
		model.addAttribute("theaterlist3", dao.selectMusicalList3(map));
		model.addAttribute("theaterlist4", dao.selectMusicalList4(map));
		model.addAttribute("theaterlist5", dao.selectMusicalList5(map));
		return "Final_Pro/Theatermain";
	}
	
//	@RequestMapping(value = "booking")
//	public String bookingSeat(int no,Model model) {
//		HashMap<String, Object>map=new HashMap<String, Object>();
//		model.addAttribute("bookinginfo", dao.selectBookingInfo(no));
//		return "making/seat";
//	}
	@RequestMapping(value = "booking")
	public String bookingSeat(int no,Model model,String date,String rundate) {
		System.out.println(date);
		System.out.println(rundate);
		String realdate=date+" "+rundate;
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("rundate", realdate);
		map.put("no", no);
		List<Object>seatVal2=new ArrayList<Object>(commdao.selectSeatTable(map));
		System.out.println(seatVal2);
		model.addAttribute("seat",seatVal2);
		model.addAttribute("bookinginfo",dao.selectBookingInfo(no));
		
		model.addAttribute("date",realdate);
		return "making/seat";
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
			commdao.insertSeatTable(board);
			System.out.println(board	);
		} 
		return "/making/tiketok";
		
	}
}

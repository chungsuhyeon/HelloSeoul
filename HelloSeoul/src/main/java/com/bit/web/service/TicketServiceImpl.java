package com.bit.web.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.bit.web.dao.ProjectDao;
import com.bit.web.dao.TicketDao;
import com.bit.web.vo.SeatBoard;

import lombok.RequiredArgsConstructor;
@Service
@RequiredArgsConstructor
public class TicketServiceImpl implements TicketService{
	
	@Autowired
	TicketDao dao;
	@Autowired
	ProjectDao commdao;
	@Override
	public void contentImg(int no, Model model) {
		// TODO Auto-generated method stub
		model.addAttribute("ticketinfo", dao.selectTicketInfo(no));
		
	}
	@Override
	public void musicalList(Model model, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		model.addAttribute("musicallist", dao.selectMusicalList(map));
		model.addAttribute("musicallist2", dao.selectMusicalList2(map));
		model.addAttribute("musicallist3", dao.selectMusicalList3(map));
		model.addAttribute("musicallist4", dao.selectMusicalList4(map));
		model.addAttribute("musicallist5", dao.selectMusicalList5(map));
	}
	@Override
	public void movieList(Model model, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		model.addAttribute("movielist", dao.selectMusicalList(map));
		model.addAttribute("movielist2", dao.selectMusicalList2(map));
		model.addAttribute("movielist3", dao.selectMusicalList3(map));
		model.addAttribute("movielist4", dao.selectMusicalList4(map));
		model.addAttribute("movielist5", dao.selectMusicalList5(map));
	}
	@Override
	public void theaterList(Model model, HashMap<String, Object> map) {
		// TODO Auto-generated method stub
		model.addAttribute("theaterlist", dao.selectMusicalList(map));
		model.addAttribute("theaterlist2", dao.selectMusicalList2(map));
		model.addAttribute("theaterlist3", dao.selectMusicalList3(map));
		model.addAttribute("theaterlist4", dao.selectMusicalList4(map));
		model.addAttribute("theaterlist5", dao.selectMusicalList5(map));
	}
	@Override
	public void booking(int no, Model model, String date, String rundate) {
		// TODO Auto-generated method stub
		String realdate=date+" "+rundate;
		HashMap<String, Object>map= new HashMap<String, Object>();
		map.put("rundate", realdate);
		map.put("no", no);
		List<Object>seatVal2=new ArrayList<Object>(commdao.selectSeatTable(map));
		System.out.println(seatVal2);
		model.addAttribute("seat",seatVal2);
		model.addAttribute("bookinginfo",dao.selectBookingInfo(no));
		
		model.addAttribute("date",realdate);
	}
	@Override
	public void ticketing(SeatBoard board, int no, String user_id, List<String> seatVal, Model model, String rundate) {
		// TODO Auto-generated method stub
		for(String seat:seatVal) {
			board.setNo(no);
			board.setUser_id(user_id);
			board.setSeat(seat);
			board.setRundate(rundate);
			commdao.insertSeatTable(board);
			System.out.println(board	);
		} 
	}

}

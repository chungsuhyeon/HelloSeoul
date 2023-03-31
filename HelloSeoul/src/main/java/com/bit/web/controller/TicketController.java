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
import com.bit.web.service.TicketService;
import com.bit.web.vo.MusicalBean;
import com.bit.web.vo.SeatBoard;

@Controller
public class TicketController {
	
	@Autowired
	private TicketDao dao;
	private MusicalBean bean;
	@Autowired
	private ProjectDao commdao;
	@Autowired
	private TicketService TkService;
	@RequestMapping (value = "contentImg")
	public String ImgCheck(int no,Model model) {
		TkService.contentImg(no, model);
		return "making/dhTicketDetail";
	}
	@RequestMapping (value = "musicalList")
	public String musicallist(Model model) {
		HashMap<String, Object>map= new HashMap<String, Object>();
		TkService.musicalList(model, map);
		return "Final_Pro/Musicalmain";
	}
	
	@RequestMapping (value = "movieList")
	public String movielist(Model model) {
		HashMap<String, Object>map= new HashMap<String, Object>();
		TkService.movieList(model, map);
		return "Final_Pro/Moviemain";
	}
	
	@RequestMapping (value = "theaterList")
	public String theaterlist(Model model) {
		HashMap<String, Object>map= new HashMap<String, Object>();
		TkService.theaterList(model, map);
		return "Final_Pro/Theatermain";
	}
	
	@RequestMapping(value = "booking")
	public String bookingSeat(int no,Model model,String date,String rundate) {;
		TkService.booking(no, model, date, rundate);
		return "making/seat";
	}
	@RequestMapping(value="ticketing")
	public String ticketing(SeatBoard board,@RequestParam int no,@RequestParam String user_id ,@RequestParam(value="seatVal") List<String>seatVal,Model model,String rundate) {
		TkService.ticketing(board, no, user_id, seatVal, model, rundate);
		return "/making/tiketok";
		
	}
}

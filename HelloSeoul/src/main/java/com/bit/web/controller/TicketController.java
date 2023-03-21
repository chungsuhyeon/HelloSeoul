package com.bit.web.controller;

import java.util.HashMap;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.support.DaoSupport;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.bit.web.dao.TicketDao;
import com.bit.web.vo.MusicalBean;

@Controller
public class TicketController {
	
	@Autowired
	private TicketDao dao;
	private MusicalBean bean;

	@RequestMapping (value = "contentImg")
	public String ImgCheck(int no,Model model) {
//		System.out.println("contentImg");
//		System.out.println(imgsrc);
		model.addAttribute("ticketinfo", dao.selectTicketInfo(no));
		System.out.println(model);
		return "Final_Pro/TicketDetail";
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
	
}

package com.bit.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.bit.web.dao.CtgDao;
import com.bit.web.service.CtgService;
import com.bit.web.service.CtgServiceImpl;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class Ctgcontroller {
	
	
	@Resource
	private CtgDao dao;
	private final CtgService ctg;
	
	
	@GetMapping(value = "gotoctg")
	public String goToCtgPage(Model model) {
		System.out.println(ctg.readyForSg());
		model.addAttribute("locsg",dao.readyForLocation());
		model.addAttribute("maindb",dao.readyForCategory());
		return "Final_Pro/ctgPage";
	}
	
	@GetMapping(value = "gotoHotspotinfo")
	public String gotoHotspotInfo(int pc, Model model) {
		model.addAttribute("info",dao.hotspotinfo(pc));
		return "Final_Pro/HotspotInfo";
	}
	
	@GetMapping(value = "gotohotspot")
	public String gotoHotspot(Model model) {
		model.addAttribute("hotspot", dao.readyForHotspot());
		return "Final_Pro/HotspotMain";
	}
	

}


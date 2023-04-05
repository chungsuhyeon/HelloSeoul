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
	private final CtgService ctg;
	
	
	@GetMapping(value = "gotoctg")
	public String goToCtgPage(Model model,HttpServletRequest resq) {
		model.addAttribute("locsg",ctg.readyForSg());
		model.addAttribute("maindb",ctg.readyForCtg());
		System.out.println(resq.getSession().getAttribute("user_id"));
		model.addAttribute("user_id",resq.getSession().getAttribute("user_id"));
		return "Final_Pro/ctgPage";
	}
	
	@GetMapping(value = "gotohotspot")
	public String gotoHotspot(Model model) {
		model.addAttribute("hotspot", ctg.readyForHot());
		return "Final_Pro/HotspotMain";
	}
	
	@GetMapping(value = "gotoHotspotinfo")
	public String gotoHotspotInfo(int pc, Model model) {
		model.addAttribute("info",ctg.hotspotinfo(pc));
		return "Final_Pro/HotspotInfo";
	}
	
	

}
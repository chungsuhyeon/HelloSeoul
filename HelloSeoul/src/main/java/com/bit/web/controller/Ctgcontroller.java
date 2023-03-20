package com.bit.web.controller;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.bit.web.dao.CtgDao;

@Controller
public class Ctgcontroller {
	
	@Resource
	private CtgDao dao;
	
	@GetMapping(value = "gotoctg")
	public String goToCtgPage(String ctg, Model model) {
		model.addAttribute("locsg",dao.readyForLocation());
		model.addAttribute("locinfo",dao.readyForCategory(ctg));
		return "Final_Pro/ctgPage";
	}

}
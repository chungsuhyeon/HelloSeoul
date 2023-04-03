package com.bit.web.controller;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bit.web.service.CtgService;

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
	
	@GetMapping(value="test.do")
	public String testing() {
		ModelAndView mav = new ModelAndView();
		
		String url = "http://127.0.0.1:5000/tospring";
		String sb = "";
		try {
			HttpURLConnection conn = (HttpURLConnection) new URL(url).openConnection();
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream(), "utf-8"));
			String line = null;
			
			while ((line = br.readLine()) != null) {
				sb = sb + line + "\n";
			}
			System.out.println("========br======" + sb.toString());
			if (sb.toString().contains("ok")) {
				System.out.println("test");
				
			}
			br.close();

			System.out.println("" + sb.toString());
		} catch (MalformedURLException e) {
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "redirect:/Final_Pro/ctgPage.jsp?testing="+sb.toString();
	}
	
	

}
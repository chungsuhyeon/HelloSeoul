package com.bit.web.controller;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.eclipse.jdt.internal.compiler.batch.Main;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.bit.web.alpha.AlphaService;
import com.bit.web.alpha.PagingAlgo;
import com.bit.web.dao.CtgDao;
import com.bit.web.service.CtgService;
import com.bit.web.vo.CurPageBlockBean;
import com.bit.web.vo.JoinSeoulBean;
import com.bit.web.vo.LocGunGuBean;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.MultiPageBean;
import com.bit.web.vo.MypageJjimBean;

import oracle.jdbc.proxy.annotation.Post;
import scala.collection.generic.BitOperations.Int;
import scala.util.parsing.json.JSONObject;
import twitter4j.internal.org.json.JSONException;

@RestController
public class sunrestcontroller {
	
	@Resource
	private CtgService ctg;
	
	@Resource
	private PagingAlgo pg;
	
	@PostMapping(value = "showLocInfo")	
	public MainDbBean showDb(String name) {
		return ctg.showLocinfo(name);
	}
	
	@PostMapping(value = "searchList")
	public List<MainDbBean> searchList(String loc_sg, String detailctg, String query) {
		return ctg.searchLoc(loc_sg, detailctg, query);
	}
	
	@PostMapping(value="insertJjim")
	public void insertJjim(@RequestParam(value="jjimpoint[]") List<Integer> jjimpoint, HttpServletRequest resq) {
		String user_id = (String) resq.getSession().getAttribute("user_id");
		ctg.insertJjim(jjimpoint, user_id);
	}
	
	@PostMapping(value = "searchHot")
	public List<MainDbBean> searchHotspot(String query) {
		return ctg.searchHot(query);
	}
	
	@PostMapping(value = "hotspotrecommend")
	public List<MainDbBean> hotspotrecom(String sg){
		System.out.println(sg);
		return ctg.hotspotrecom(sg);
	}
	
	@PostMapping(value = "userrecom")
	public String userrecom(String userid) {
		System.out.println(userid);
		if(userid!="") {
			//dao.selecttagimg rownum3
		}
		return userid;
	}
	
	@PostMapping(value="pagingAction")
	public List<HashMap<String, Object>> showHotList(int page, String ctg1){
		System.out.println(page+":"+ctg1);
		return ctg.hotspotshow(page,ctg1);
	}
	
	@PostMapping(value="collectUser")
	public List<JoinSeoulBean> adminCallUser(){
		
		return ctg.collectUsers();
	}
	
	@PostMapping(value="collectBoard")
	public List<JoinSeoulBean> adminCallBoard(){
		
		return null;
	}
	
	@PostMapping(value="collectPlanner")
	public List<JoinSeoulBean> adminCallPlanner(){
		
		return null;
	}
	
	@PostMapping(value="collectMainDb")
	public List<JoinSeoulBean> adminCallMaindb(){
		
		return null;
	}
	@PostMapping(value="jsonParsing")
	public Object testingJson(@RequestParam(value = "file") MultipartFile formData) throws IOException{
		String fileRealName = formData.getOriginalFilename();
		String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
		String uploadFolder = "\\\\192.168.0.16\\searchImg";
		
		UUID uuid = UUID.randomUUID();
		String[] uuids = uuid.toString().split("-");
		String uniqueName = uuids[0];
		String filename=uniqueName+fileExtension;
		File saveFile = new File(uploadFolder+"\\"+filename);  // 적용 후
		try {
			formData.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		//pthon connect
		URL url = new URL("http://192.168.0.16/hello/"+filename);
		String line;
		StringBuilder sb = new StringBuilder();
		HttpURLConnection conn = (HttpURLConnection) url.openConnection();
		conn.setRequestMethod("GET");
		conn.setRequestProperty("Content-type", "application/json; charset=UTF-8");
		
		BufferedReader rd;
		if(conn.getResponseCode() >= 200 && conn.getResponseCode() <= 300) {
		    rd = new BufferedReader(new InputStreamReader(conn.getInputStream(), "UTF-8"));
		} else {
		    rd = new BufferedReader(new InputStreamReader(conn.getErrorStream(), "UTF-8"));
		}
		while ((line = rd.readLine()) != null) {
		    sb.append(line);
		}
		rd.close();
		conn.disconnect();
		String text = sb.toString();
		return text;
		
	}
	
	@PostMapping(value ="RecommandFood")
	public List<HashMap<String, Object>> recFood(String foodName) {
		return ctg.recommandFood(foodName);
	}
	
	@PostMapping(value = "oneJjim")
	public String oneJjims(int pc, HttpServletRequest resq) {
		String id = (String)(resq.getSession().getAttribute("user_id"));
		ctg.insertOneJjim(pc, id);
		System.out.println("!");
		return "success";
	}
	
	@PostMapping(value="coin")
	public String todayCoin(String day) throws IOException{
		return ctg.jsonParsingCoin(day);
	}
	
	@PostMapping(value="report")
	public List<HashMap<String, Object>> reporting(){
		return ctg.reportComm();
	}
	
	@PostMapping(value="showPage")
	public List<MainDbBean> showPaging(int start, int end) {
		return ctg.showDBs(start, end); 
	}
	
	@PostMapping(value = "commg")
	public void adminCommunity() {
		
	}



}

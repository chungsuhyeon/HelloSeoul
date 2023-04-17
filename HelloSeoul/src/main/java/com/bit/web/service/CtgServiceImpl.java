package com.bit.web.service;

import java.io.BufferedReader;
import java.io.File;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URI;
import java.net.URL;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bit.web.dao.CtgDao;
import com.bit.web.vo.JoinSeoulBean;
import com.bit.web.vo.LocGunGuBean;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.MypageJjimBean;
import com.bit.web.vo.PageBean;


@Service
public class CtgServiceImpl implements CtgService{
	
	@Autowired
	private CtgDao dao;
	
	
	//controller service begin
	@Override
	public List<LocGunGuBean> readyForSg() {
		// TODO Auto-generated method stub
		return dao.readyForLocation(); 
		
	}
	
	@Override
	public List<HashMap<Object, String>> readyForCtg() {
		// TODO Auto-generated method stub
		return dao.readyForCategory();
	}

	@Override
	public List<MainDbBean> readyForHot() {
		// TODO Auto-generated method stub
		return dao.readyForHotspot();
	}

	@Override
	public MainDbBean hotspotinfo(int loc_pc) {
		// TODO Auto-generated method stub
		return dao.hotspotinfo(loc_pc);
	}
	//controller service end

	
	//rest controller service begin
	@Override
	public List<MainDbBean> showLocinfo() {
		// TODO Auto-generated method stub
		//System.out.println(dao.showDb());
		return dao.showDb();
	}

	@Override
	public List<MainDbBean> searchLoc(String loc_sg, String detailctg, String query) {
		// TODO Auto-generated method stub
		HashMap<Object, Object> map = new HashMap<Object, Object>();
		map.put("loc_sg", loc_sg);
		map.put("loc_ctg2", detailctg);
		map.put("query", query);		
		return dao.searchLoc(map);
	}

	@Override
	public void insertJjim(List<Integer> jjimpoint, String user_id) {
		// TODO Auto-generated method stub
		List<Integer> listjjim =  dao.checkJjimList(user_id);
		
		for(int i: jjimpoint) {
			if(listjjim.contains(i)) {
				continue;
			}
			else {
				MainDbBean dbbean = dao.searchInsertJjim(i);
				MypageJjimBean jbean = new MypageJjimBean();
				jbean.setUser_id(user_id);
				jbean.setLoc_pc(dbbean.getLoc_pc());
				jbean.setLoc_name(dbbean.getLoc_name());
				jbean.setLoc_ctg1(dbbean.getLoc_ctg1());
				jbean.setLoc_ctg2(dbbean.getLoc_ctg2());
				jbean.setLoc_sg(dbbean.getLoc_sg());
				System.out.println(jbean);
				dao.insertjjim(jbean);				
			}
		}
	}

	@Override
	public List<MainDbBean> searchHot(String query) {
		// TODO Auto-generated method stub
		return dao.searchHot(query);
	}

	@Override
	public List<MainDbBean> hotspotrecom(String sg) {
		// TODO Auto-generated method stub
		return dao.hotspotrecom(sg);
	}

	@Override
	public List<HashMap<String, Object>> hotspotshow(int page, String ctg1) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("ctg1", ctg1);
		map.put("start", (page-1)*8);
		map.put("end", page*8);
		dao.hotspotPage(map);
		return null;
	}

	@Override
	public List<JoinSeoulBean> collectUsers() {
		// TODO Auto-generated method stub
		return dao.collectUserByAdmin();
	}

	@Override
	public List<HashMap<String, Object>> recommandFood(String foodname) {
		// TODO Auto-generated method stub
		return dao.recommanFood(foodname);
	}

	@Override
	public void insertOneJjim(int pc, String id) {
		// TODO Auto-generated method stub
		MainDbBean bean = new MainDbBean();
		bean = dao.searchInsertJjim(pc);
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("user_id", id);
		map.put("loc_pc", bean.getLoc_pc());
		map.put("loc_name", bean.getLoc_name());
		map.put("loc_ctg1", bean.getLoc_ctg1());
		map.put("loc_ctg2", bean.getLoc_ctg2());
		map.put("loc_sg", bean.getLoc_sg());
		dao.upOneJjim(map);
		
		
	}

	@Override
	public String jsonParsingCoin() throws IOException{
		// TODO Auto-generated method stub		
		//pthon connect
		URL url = new URL("https://www.koreaexim.go.kr/site/program/financial/exchangeJSON?authkey=2ac7TGIMKndIFA9424lQVDkcFAZVXAO7&searchdate=20230410&data=AP01");
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
	
	
	
	
	
	
	
	
	


}
	//rest controller service end
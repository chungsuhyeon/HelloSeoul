package com.bit.web.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.bit.web.vo.JoinSeoulBean;
import com.bit.web.vo.LocGunGuBean;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.MypageJjimBean;

@Repository
public class CtgDao extends SqlSessionDaoSupport{
	
	@Inject
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionRactory) {
		super.setSqlSessionFactory(sqlSessionRactory);
	}
	//show gungu
	public List<LocGunGuBean> readyForLocation(){
		return this.getSqlSession().selectList("readyForLocation");
	}
	//show ctgtable
	public List<HashMap<Object, String>> readyForCategory(){
		return this.getSqlSession().selectList("readyForCategory");
	}
	//hotspot showdb 
	public List<MainDbBean> readyForHotspot(){
		return this.getSqlSession().selectList("readyForHotspot");
	}
	//hotspot info
	public MainDbBean hotspotinfo(int loc_pc) {
		return this.getSqlSession().selectOne("hotspotinfo", loc_pc);
	}
	//show loc info + map
	public List<MainDbBean> showDb() {
		return this.getSqlSession().selectList("showDb");
	}
	
	public List<MainDbBean> searchLoc(HashMap<Object, Object> map){
		return this.getSqlSession().selectList("searchLoc",map);
	}
	
	public MainDbBean searchInsertJjim(int loc_pc) {
		return this.getSqlSession().selectOne("searchInsertJjim",loc_pc);
	}
	
	public List<Integer> checkJjimList(String user_id){
		return this.getSqlSession().selectList("checkJjimList",user_id);
	}
	
	public void insertjjim(MypageJjimBean bean) {
		this.getSqlSession().insert("insertjjim", bean);
	}
	
	public List<MainDbBean> searchHot(String query){
		return this.getSqlSession().selectList("searchHot",query);
	}
	public List<HashMap<String, Object>> hotspotPage(HashMap<String, Object> page){
		return this.getSqlSession().selectList("hotspotPage", page);
	}
	
	
	public List<MainDbBean> hotspotrecom(String loc_sg){
		return this.getSqlSession().selectList("hotspotrecom", loc_sg);
	}
	
	public int totalpage() {
		return this.getSqlSession().selectOne("totalpage");
	}
	
	public List<JoinSeoulBean> collectUserByAdmin(){
		return this.getSqlSession().selectList("collectUserByAdmin");
	}
	
	public List<HashMap<String, Object>> recommanFood(String foodname){
		return this.getSqlSession().selectList("recommanFood",foodname);
	}
	
	public void upOneJjim(HashMap<String, Object> map) {
		this.getSqlSession().insert("upOneJjim",map);
	}
	
	public List<HashMap<String, Object>> reportBoard(){
		return this.getSqlSession().selectList("reportBoard");
	}
	
	public int countDB() {
		return this.getSqlSession().selectOne("countDB");
	}
	
	public List<MainDbBean> pagingDB(HashMap< String, Object> map) {
		return this.getSqlSession().selectList("pagingDB", map);
	}
	
	public int countPlanner(String user_id) {
		return this.getSqlSession().selectOne("countPlanner", user_id);
	}
	
	public List<Object> getUserPlanner1(HashMap<String, Object> map){
		return this.getSqlSession().selectList("getUserPlanner1", map);
	}
}

package com.bit.web.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.bit.web.vo.LocGunGuBean;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.MypageJjimBean;

@Repository
public class CtgDao extends SqlSessionDaoSupport{
	
	@Inject
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionRactory) {
		super.setSqlSessionFactory(sqlSessionRactory);
	}
	
	public List<MainDbBean> showDb() {
		return this.getSqlSession().selectList("showDb");
	}
	
	public List<MainDbBean> searchFood(HashMap<Object, Object> map){
		return this.getSqlSession().selectList("searchFood",map);
	}
	
	
	
	//gungu
	public List<LocGunGuBean> readyForLocation(){
		return this.getSqlSession().selectList("readyForLocation");
	}
	//show table
	public List<HashMap<Object, String>> readyForCategory(){
		return this.getSqlSession().selectList("readyForCategory");
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
}

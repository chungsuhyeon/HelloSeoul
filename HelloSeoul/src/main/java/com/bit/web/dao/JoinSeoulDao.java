package com.bit.web.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.bit.web.vo.JoinSeoulBean;

@Repository
public class JoinSeoulDao extends SqlSessionDaoSupport {
	
	@Inject
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public String ajaxGetId(String id) {
		//System.out.println(id);
		//System.out.println(this.getSqlSession().selectOne("ajaxGetId",id));
		return this.getSqlSession().selectOne("ajaxGetId",id);
	}
	
	public void insertMember(JoinSeoulBean bean) {
		this.getSqlSession().insert("insertMember",bean);
	}	
	
	public String getJoinnation(String user_nation) {
		return this.getSqlSession().selectOne("getJoinnation",user_nation);
	 }
	
	public List<Object> selectcontinent(String id){
//		System.out.println(id);
		return this.getSqlSession().selectList("selectcontinent", id);
		
	
	}
	
	public String getcontinent(String user_contient) {
		System.out.println(user_contient);
		return "";   
	}
		
}	
		
		
		
		
		
		
	
	
	
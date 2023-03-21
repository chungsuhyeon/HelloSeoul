package com.bit.web.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.bit.web.vo.MusicalBean;

@Repository
public class TicketDao extends SqlSessionDaoSupport{
	
	@Inject
	public void setSqlSessioinFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}
	
	public List<MusicalBean> selectMusicalList(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectMusicalList", map);
	}
	
	public List<MusicalBean> selectMusicalList2(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectMusicalList2", map);
	}
	
	public List<MusicalBean> selectMusicalList3(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectMusicalList3", map);
	}
	
	public List<MusicalBean> selectMusicalList4(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectMusicalList4", map);
	}
	
	public List<MusicalBean> selectMusicalList5(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectMusicalList5", map);
	}
	
	
	public List<MusicalBean> selectMovieList(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectMovieList", map);
	}
	
	public List<MusicalBean> selectMovieList2(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectMovieList2", map);
	}
	
	public List<MusicalBean> selectMovieList3(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectMovieList3", map);
	}
	
	public List<MusicalBean> selectMovieList4(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectMovieList4", map);
	}
	
	public List<MusicalBean> selectMovieList5(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectMovieList5", map);
	}
	
	
	public List<MusicalBean> selectTheaterList(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectTheaterList", map);
	}
	
	public List<MusicalBean> selectTheaterList2(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectTheaterList2", map);
	}
	
	public List<MusicalBean> selectTheaterList3(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectTheaterList3", map);
	}
	
	public List<MusicalBean> selectTheaterList4(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectTheaterList4", map);
	}
	
	public List<MusicalBean> selectTheaterList5(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectTheaterList5", map);
	}
	
	
	public Object selectTicketInfo(int no) {
		return this.getSqlSession().selectOne("selectTicketInfo", no);
	}
	
	public Integer selectSeqNumber() {
		return this.getSqlSession().selectOne("selectSeqNumber");
	}
	
	public Object selectBookingInfo(int no){
		return this.getSqlSession().selectOne("selectBookingInfo", no);
	}

}

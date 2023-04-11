package com.bit.web.dao;

import java.util.HashMap;
import java.util.List;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.stereotype.Repository;

import com.bit.web.vo.JoinSeoulBean;
import com.bit.web.vo.MainDbBean;
import com.bit.web.vo.MypageMainPlannerBean;
import com.bit.web.vo.MypagePlannerBean;

@Repository(value = "helloSeoulDao")
public class HelloSeoulDao extends SqlSessionDaoSupport{
	@Inject
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionRactory) {
		super.setSqlSessionFactory(sqlSessionRactory);
	}
	
	// 회원정보 (로그인)
	public String getDbUserPW(String id) {
		return this.getSqlSession().selectOne("getDbUserPW", id);
	}
	
	public JoinSeoulBean getDbUserInfo(String id) {
		return this.getSqlSession().selectOne("getDbUserInfo", id);
	}
	
	// 회원정보 (마이페이지 메인에 회원정보 출력하기 위함)
	public HashMap<String, Object> getUserInfo(String id){
		return this.getSqlSession().selectOne("getUserInfo", id);		
	}
	
	// 회원이 생성했던 플래너 load
	public List<Object> getUserPlanner(String id){
		return this.getSqlSession().selectList("getUserPlanner", id);
	}
	
	// 회원의 찜 리스트 검색
	public List<Object> getUserJjimList(String id){
		return this.getSqlSession().selectList("getUserJjimList", id);
	}
	
	// 회원의 찜 리스트 삭제
	public void userJjimListDelete(HashMap<String, Object> map) {
		this.getSqlSession().delete("userJjimListDelete", map);
	}
	
	// 찜 리스트에서 장소코드로 상세정보 조회
	public MainDbBean getJjimInfo(int code){
		return this.getSqlSession().selectOne("getJjimInfo", code);
	}
	
	// 플래너 생성을 위한 플래너 번호
	public int getPlannerNo() {
		return this.getSqlSession().selectOne("getPlannerNo");
	}
	
	// planner table에 데이터 insert
	public void plannerDataInsert(MypagePlannerBean map) {
		this.getSqlSession().insert("plannerDataInsert", map);
	}
	
	// 플래너 생성 후 메인 플래너 페이지에 넘길 정보
	public HashMap<String, Object> firstMainPlannerCreate(int no){
		return this.getSqlSession().selectOne("firstMainPlannerCreate", no);
	}
	
	public List<Object> mainPlannerDataSelect(int no){
		return this.getSqlSession().selectList("mainPlannerDataSelect", no);
	}
	
	// 일정에 추가하기 위한 MapDb 정보 가져오기
	public List<Object> selectMainDbData(String codeList) {
		return this.getSqlSession().selectList("selectMainDbData", codeList);
	}
	
	// 생성한 일정 insert
	public void plannerScheduleInsert(MypageMainPlannerBean bean) {
		this.getSqlSession().insert("plannerScheduleInsert", bean);
	}
	
	public void plannerScheduleDelete(int no) {
		this.getSqlSession().delete("plannerScheduleDelete", no);
	}
	
	public void plannerAllDelete(int no) {
		this.getSqlSession().delete("plannerAllDelete", no);
	}
	
	public MypagePlannerBean mypageplannerInfo(int no) {
		return this.getSqlSession().selectOne("mypageplannerInfo", no);
	}
	
	public void mypageDateUpdate(MypagePlannerBean bean) {
		this.getSqlSession().update("mypageDateUpdate", bean);
	}
	
	// 닉네임 검색
	public List<String> nickSearch(String nick) {
		return this.getSqlSession().selectList("nickSearch", nick);
	}
	
}

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
	
	public String getCountryName(int no) {
		return this.getSqlSession().selectOne("getCountryName", no);
	}
	
	// 회원정보 (마이페이지 메인에 회원정보 출력하기 위함)
	public HashMap<String, Object> getUserInfo(String id){
		return this.getSqlSession().selectOne("getUserInfo", id);		
	}
	
	// 회원이 생성했던 플래너 load
	public List<Object> getUserPlanner(HashMap<String, Object> map){
		return this.getSqlSession().selectList("getUserPlanner", map);
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
	
	public void plannerUpdateDate(HashMap<String, Object> map) {
		this.getSqlSession().update("plannerUpdateDate", map);
	}
	
	// 생성한 일정 insert
	public void plannerScheduleInsert(MypageMainPlannerBean bean) {
		this.getSqlSession().insert("plannerScheduleInsert", bean);
	}
	
	public void plannerScheduleDelete(HashMap<String, Object> map) {
		this.getSqlSession().update("plannerScheduleDelete", map);
	}
	
	
	public void plannerAllDelete(HashMap<String, Object> map) {
		this.getSqlSession().update("plannerAllDelete", map);
	}
	
//	public List<Integer> plannerShareCommunity(int no) {
//		return this.getSqlSession().selectList("plannerShareCommunity", no);
//	}
	
	public MypagePlannerBean mypageplannerInfo(int no) {
		return this.getSqlSession().selectOne("mypageplannerInfo", no);
	}
	
	public void mypageDateUpdate(MypagePlannerBean bean) {
		this.getSqlSession().update("mypageDateUpdate", bean);
	}
	
	// 전체 사용자 닉네임 검색
	public List<String> nickSearch(HashMap<String, Object> map) {
		return this.getSqlSession().selectList("nickSearch", map);
	}
	
	// share table에 닉네임이 존재하는지 검색
	public String shareNickSelete(HashMap<String, Object> map) {
		return this.getSqlSession().selectOne("shareNickSelete", map);
	}
	
	// share table에 닉네임 추가
	public void shareNickInsert(HashMap<String, Object> map) {
		this.getSqlSession().insert("shareNickInsert", map);
	}
	
	// 이미 플래너 공유중인 사용자 리스트
	public List<String> alreadyShareUser(int no){
		return this.getSqlSession().selectList("alreadyShareUser", no);
	}
	
	// 플래너 공유 취소(선택 사용자 삭제)
	public void shareNickDelete(HashMap<String, Object> map) {
		this.getSqlSession().delete("shareNickDelete", map);
	}
	
	// 플래너 수정때 저장버튼 누르면 데이터 삭제 후 재삽입
	public void mainplannercontentDelete(int no) {
		this.getSqlSession().delete("mainplannercontentDelete", no);
	}
	
}

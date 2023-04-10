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
	
//email 중복체크
		public String ajaxGetId(String id) {
			//System.out.println(id);
			//System.out.println(this.getSqlSession().selectOne("ajaxGetId",id));
			return this.getSqlSession().selectOne("ajaxGetId",id);
		}
		
//Nick name 중복체크
		public String getNick(String nickname) {
			//System.out.println(nickname);
			//System.out.println(this.getSqlSession().selectOne("getNick",nickname));
			return this.getSqlSession().selectOne("getNick",nickname);
		}

// 대륙선택하면 국가명 보여줌	
		public List<Object> selectcontinent(String id){
			//System.out.println(id);
			return this.getSqlSession().selectList("selectcontinent", id);	
	}
// 국가번호정보를 디비에 국가명으로 저장되게 		
		public String getJoinnation(String user_nation) {
			return this.getSqlSession().selectOne("getJoinnation",user_nation);
		 }
			
// 회원가입 정보 디비입력	
		public void joinMemberInsert(JoinSeoulBean bean) {
			//System.out.println(bean);
			this.getSqlSession().insert("joinMemberInsert",bean);
		}
		
// 비밀번호 찾기-> 새로운 비번으로 업데이트 
		public void joinPwUpdate(HashMap<String, String>map) {
			//System.out.println("Da"+map);
			this.getSqlSession().update("joinPwUpdate",map);
		}
			
}			
	
	
	
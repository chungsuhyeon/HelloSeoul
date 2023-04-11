package com.bit.web.dao;


import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.support.SqlSessionDaoSupport;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bit.web.vo.ComBoard;
import com.bit.web.vo.ReplyBoard;
import com.bit.web.vo.SeatBoard;
import com.bit.web.vo.gbboard;
import com.mongodb.util.Hash;

@Repository
public class ProjectDao extends SqlSessionDaoSupport{
	@Autowired
	public void setSqlSessionFactory(SqlSessionFactory sqlSessionFactory) {
		super.setSqlSessionFactory(sqlSessionFactory);
	}	
	public void boardInsert(ComBoard board) {
		this.getSqlSession().insert("boardInsert",board);
	}
	public Integer selectBoradNo() {
		return this.getSqlSession().selectOne("selectBoradNo");
	}

	public List<Object> selectBoard(HashMap<String, Object>map){
		return this.getSqlSession().selectList("selectBoard",map);
	}
	public List<Object> selectInfoBoard(int no){
		return this.getSqlSession().selectList("selectInfoBoard",no);
	}
	public Integer hitAction(int no) {
		return this.getSqlSession().selectOne("hitAction",no);
	}
	public void replyInsert(ReplyBoard reboard){
		this.getSqlSession().insert("replyInsert",reboard);
	}
	public Integer replyBoardNo() {
		return this.getSqlSession().selectOne("replyBoardNo");
	}
	public String deleteBoard(int no) {
		return this.getSqlSession().selectOne("deleteBoard",no);
	}
	public String modifyAction(int no) {
		return this.getSqlSession().selectOne("modifyAction",no);
	}
	public List<Object> updateBoard(ComBoard board) {
		return this.getSqlSession().selectList("updateBoard",board);
	}
	public String selectId(String id) {
		return this.getSqlSession().selectOne("selectId",id);
	}
	public String selectBoardId(int no) {
		return this.getSqlSession().selectOne("selectBoardId",no);
	}
	public String selectNick(String id) {
		return this.getSqlSession().selectOne("selectNick",id);
	}
	public List<Object> selectReply(int no) {
		return this.getSqlSession().selectList("selectReply",no);
	}
	public String deleteReply(int no) {
		return this.getSqlSession().selectOne("deleteReply",no);
	}
	public String replyUpdate(int no) {
		return this.getSqlSession().selectOne("replyUpdate",no);
	}
	public String deleteReplymain(int no) {
		return this.getSqlSession().selectOne("deleteReplymain",no);
	}
	public String updateMinusReply(int no) {
		return this.getSqlSession().selectOne("updateMinusReply",no);
	}
	public String selectReplyid(int no) {
		return this.getSqlSession().selectOne("selectReplyid",no);
	}
	public String goodAction(gbboard board) {
		return this.getSqlSession().selectOne("goodAction",board);
	}
	public String goodBoard(int com_no) {
		return this.getSqlSession().selectOne("goodBoard",com_no);
	}
	public String goodBoardMi(int com_no) {
		return this.getSqlSession().selectOne("goodBoardMi",com_no);
	}
	public Integer selectGood(int com_no) {
		return this.getSqlSession().selectOne("selectGood",com_no);
	}
	public Integer goodbadSelectGood(HashMap<String, Object>map) {
		return this.getSqlSession().selectOne("goodbadSelectGood",map);
	}
	public String goodbadDelete(HashMap<String, Object>map) {
		return this.getSqlSession().selectOne("goodbadDelete",map);
	}
	public Integer goodbadSelectbad(HashMap<String, Object>map) {
		return this.getSqlSession().selectOne("goodbadSelectbad",map);
	}
	public String badAction(gbboard board) {
		return this.getSqlSession().selectOne("badAction",board);
	}
	public String badBoard(int com_no) {
		return this.getSqlSession().selectOne("badBoard",com_no);
	}
	public String badBoardMi(int com_no) {
		return this.getSqlSession().selectOne("badBoardMi",com_no);
	}
	public Integer selectbad(int com_no) {
		return this.getSqlSession().selectOne("selectbad",com_no);
	}
	public String updatebadGBboard(HashMap<String, Object>map) {
		return this.getSqlSession().selectOne("updatebadGBboard",map);
	}
	public String updategoodGBboard(HashMap<String, Object>map) {
		return this.getSqlSession().selectOne("updategoodGBboard",map);
	}
	public String deleteGBboard(int no) {
		return this.getSqlSession().selectOne("deleteGBboard",no);
	}
	public List<Object>  selectGBboard(int com_no) {
		return this.getSqlSession().selectList("selectGBboard", com_no);
	}
	
	public String insertSeatTable(SeatBoard board) {
		return this.getSqlSession().selectOne("insertSeatTable",board);
	}
	public	List<Object> selectSeatTable(HashMap<String, Object>map) {
		return this.getSqlSession().selectList("selectSeatTable",map);
	}
	public List<Object> selecttop3(){
		return this.getSqlSession().selectList("selecttop3");
	}
	public Integer getTotalRow() {
		return this.getSqlSession().selectOne("getTotalRow");
	}
	public String SelectPlannerTitle(int plno) {
		return this.getSqlSession().selectOne("SelectPlannerTitle",plno);
	}
	public HashMap<String, Object> SharePlanner(int plno) {
		return this.getSqlSession().selectOne("SharePlanner",plno);
	}
	public List<Object>selectSharePlanner(int no){
		return this.getSqlSession().selectList("selectSharePlanner",no);
	}
}










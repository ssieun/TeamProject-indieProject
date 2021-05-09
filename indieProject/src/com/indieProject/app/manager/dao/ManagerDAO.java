package com.indieProject.app.manager.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.indieProject.app.manager.vo.PopcornExchangeDataVO;
import com.indieProject.app.member.vo.DeleteMovieVO;
import com.indieProject.mybatis.config.SqlMapConfig;

public class ManagerDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public ManagerDAO() {
		session = sessionf.openSession(true);
	}
	
	//전체 미처리 환전신청 가져오기
	public List<PopcornExchangeDataVO> getNoneExchangeData(){
		return session.selectList("Manager.getNoneExchangeData");
	}
	//행별로 값 가져오기
	public List<PopcornExchangeDataVO> getExchangeData(int startRow, int endRow){
		HashMap<String, Integer> map = new HashMap<String, Integer>();
		map.put("startRow", startRow);
		map.put("endRow", endRow);
		return session.selectList("Manager.getExchangeData", map);
	}
	
	//입금상태 변경
	public boolean setExchangeYes(String exchangeNum) {
		return session.update("Manager.setExchangeYes", exchangeNum) == 1;
	}
	//전체 입금완료 데이터 개수 가져오기
	public int getExchangeCnt(){
		return session.selectOne("Manager.getExchangeCnt");
	}
	//미처리 영화삭제 리스트 받아오기
	public List<DeleteMovieVO> getNoneDeleteMovie(){
		return session.selectList("Manager.getNoneDeleteMovie");
	}
	//영화 삭제
	public boolean deleteMovie(int amaNum) {
		return session.delete("Manager.deleteMovie", amaNum) == 1;
	}
	
	//이메일 받아오기
	public String getMemberEmail(String memberId) {
		return session.selectOne("Manager.getMemberEmail", memberId);
	}
	//영화 삭제처리 상태 YES로 바꾸기
	public boolean setDeleteMovieYes(int amaNum){
		return session.update("Manager.setDeleteMovieYes", amaNum) == 1;
	}
	//영화 삭제신청 미승인
	public boolean deleteMovieNo(int amaNum) {
		return session.delete("Manager.deleteMovieNo", amaNum) == 1;
	}
	//매니저 확인
	public boolean managerCheck(String memberId) {
		return (Integer)session.selectOne("Manager.managerCheck", memberId) == 1;
	}
}

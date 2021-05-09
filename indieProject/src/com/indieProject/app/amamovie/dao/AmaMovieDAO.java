package com.indieProject.app.amamovie.dao;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.indieProject.app.amamovie.vo.AmaMovieActorVO;
import com.indieProject.app.amamovie.vo.AmaMovieAndPosterVO;
import com.indieProject.app.amamovie.vo.AmaMovieMakerVO;
import com.indieProject.app.amamovie.vo.AmaMoviePosterVO;
import com.indieProject.app.amamovie.vo.AmaMovieReviewVO;
import com.indieProject.app.amamovie.vo.AmaMovieStillCutVO;
import com.indieProject.app.amamovie.vo.AmaMovieVO;
import com.indieProject.app.amamovie.vo.PopcornVO;
import com.indieProject.app.board.vo.BoardReplyVO;
import com.indieProject.mybatis.config.SqlMapConfig;
import com.oreilly.servlet.MultipartRequest;

public class AmaMovieDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public AmaMovieDAO() {
		session = sessionf.openSession(true);
	}
	//영화 정보 입력
	public boolean insertMovie(AmaMovieVO a_vo) {
		System.out.println(a_vo.getMemberId());
		return session.insert("AmaMovie.insertMovie", a_vo) == 1;
	}
	//영화 입력 후 번호 가져오기
	public int getMovieNum(AmaMovieVO a_vo) {
		return session.selectOne("AmaMovie.getMovieNum", a_vo);
	}
	//제작진 입력
	public boolean insertMaker(AmaMovieMakerVO [] a_m_vo_ar) {
		boolean check = true;
		for (int i = 0; i < a_m_vo_ar.length; i++) {
			if(session.insert("AmaMovie.insertMaker", a_m_vo_ar[i]) != 1) {
				check = false;
			}
		}
		return check;
	}
	//출연진 입력
	public boolean insertActor(AmaMovieActorVO [] a_a_vo_ar) {
		boolean check = true;
		for (int i = 0; i < a_a_vo_ar.length; i++) {
			if(session.insert("AmaMovie.insertActor", a_a_vo_ar[i]) != 1) {
				check = false;
			}
		}
		return check;
	}
	//포스터/스틸컷 정보 입력
	public boolean insertPoster(int movieNum, MultipartRequest multi) {
		boolean check = true;
		AmaMoviePosterVO poster = new AmaMoviePosterVO();
		
		Enumeration<String> datas = multi.getFileNames();
		
		while(datas.hasMoreElements()) {
			String data = datas.nextElement();
			String systemName = null;
			if(data.equals("posterImgMain")) {
				systemName = "main_" + multi.getFilesystemName(data);
			}else if(data.substring(0, 9).equals("posterImg")) {
				systemName = multi.getFilesystemName(data);
			}
			if(systemName == null) {
				continue;
			}
			poster.setAmaNum(movieNum);
			poster.setFileName(systemName);
			if(session.insert("AmaMovie.insertPoster", poster) != 1) {
				check = false;
			}
		}
		
		return check;
	}
	//스틸컷 정보 입력
	public boolean insertStillCut(int movieNum, MultipartRequest multi) {
		boolean check = true;
		AmaMovieStillCutVO stillCut = new AmaMovieStillCutVO();
		
		Enumeration<String> datas = multi.getFileNames();
		
		while(datas.hasMoreElements()) {
			String data = datas.nextElement();
			String systemName = null;
			if(data.substring(0, 8).equals("stillCut")) {
				systemName = multi.getFilesystemName(data);
			}
			if(systemName == null) {
				continue;
			}
			stillCut.setAmaNum(movieNum);
			stillCut.setFileName(systemName);
			if(session.insert("AmaMovie.insertStillCut", stillCut) != 1) {
				check = false;
			}
		}
		
		return check;
	}
	
	// 영화 정보 가져오기
	public AmaMovieVO getAmaData(int amaNum) {
		return session.selectOne("AmaMovie.getAmaData", amaNum);
	}
	
	// 영화 포스터 가져오기
	public List<AmaMoviePosterVO> getAmaPoster(int amaNum) {
		return session.selectList("AmaMovie.getAmaPoster", amaNum);
	}
	
	// 영화 스틸컷 가져오기
	public List<AmaMovieStillCutVO> getAmaStillcut(int amaNum) {
		return session.selectList("AmaMovie.getAmaStillcut", amaNum);
	}
	
	// 영화 제작진 가져오기
	public List<AmaMovieMakerVO> getAmaMaker(int amaNum) {
		return session.selectList("AmaMovie.getAmaMaker", amaNum);
	}
	
	// 영화 출연 가져오기
	public List<AmaMovieActorVO> getAmaActor(int amaNum) {
		return session.selectList("AmaMovie.getAmaActor", amaNum);
	}
	
	// 영화 감상평 최근 5개 가져오기
	public List<AmaMovieReviewVO> getAmaReviewRe5(int amaNum){
		return session.selectList("AmaMovie.getAmaReviewRe5", amaNum);
	}
	
	// 영화 감상평 가져오기
	public List<AmaMovieReviewVO> getAmaReview(int amaNum, int startRow, int endRow){
		HashMap<String, Integer> amaReview = new HashMap<>();
		amaReview.put("amaNum", amaNum);
		amaReview.put("startRow", startRow);
		amaReview.put("endRow", endRow);
		return session.selectList("AmaMovie.getAmaReview", amaReview);
	}
	// 영화 감상평 총 개수 가져오기
	public int getAmaReviewNum(int amaNum) {
		return (Integer) session.selectOne("AmaMovie.getAmaReviewNum", amaNum);
	}
	
	// 영화 평균 별점 가져오기
	public double getStarAvg(int amaNum) {
		return session.selectOne("AmaMovie.getStarAvg", amaNum);
	}
	
	// 팝콘 후원자들 가져오기
	public List<PopcornVO> getPopcornSender(int amaNum){
		return session.selectList("AmaMovie.getPopcornSender", amaNum);
	}
	// 영화 감상평 아이디 중복 확인
	public boolean checkReviewId(int amaNum, String memberId) {
		HashMap<String, Object> review = new HashMap<>();
		review.put("amaNum", amaNum);
		review.put("memberId", memberId);
		return (Integer) session.selectOne("AmaMovie.checkReviewId", review) == 1;
	}
	// 영화 감상평 등록
	public boolean insertAmaReview(AmaMovieReviewVO mr_vo) {
		return session.insert("AmaMovie.insertAmaReview", mr_vo) == 1;
	}
	
	// 영화 감상평 삭제
	public boolean deleteAmaReview(int amaNum, String memberId) {
		HashMap<String, Object> review = new HashMap<>();
		review.put("amaNum", amaNum);
		review.put("memberId", memberId);
		return session.delete("AmaMovie.deleteAmaReview", review) == 1;
	}
	
	//현재 존재하는 아마추어 영화 장르 가져오기
	public List<String> getGenre(){
		return session.selectList("AmaMovie.getGenre");
	}
	//장르별 아마추어 영화와 메인포스터 가져오기
	public List<AmaMovieAndPosterVO> getAmaMovieAndPosterList(String genre){
		return session.selectList("AmaMovie.getAmaMovieAndPosterList", genre);
	}
	//영화 수정
	public boolean modifyMovie(AmaMovieVO a_vo){
		return session.update("AmaMovie.modifyMovie", a_vo) == 1;
	}
	//제작진 삭제
	public boolean deleteMaker(int amaNum) {
		return session.delete("AmaMovie.deleteMaker", amaNum) != 0;
	}
	//출연진 삭제
	public boolean deleteActor(int amaNum) {
		return session.delete("AmaMovie.deleteActor", amaNum) != 0;
	}
	//메인화면용 영화, 포스터 최신 20개 가져오기
	public List<AmaMovieAndPosterVO> getMainAmaMovieAndPosterList() {
		return session.selectList("AmaMovie.getMainAmaMovieAndPosterList");
	}
	
	// 팝콘 후원
	public boolean sendPopcorn(PopcornVO p_vo) {
		return session.insert("AmaMovie.sendPopcorn", p_vo) == 1;
	}
	// 후원 후 번호 가져오기
	public int getSendNum() {
		return session.selectOne("AmaMovie.getSendNum");
	}
	
	public boolean updatePopcornContent(String content, int sendNum) {
		HashMap<String, Object> popcorn = new HashMap<>();
		popcorn.put("content", content);
		popcorn.put("sendNum", sendNum);
		return session.update("AmaMovie.updatePopcornContent", popcorn) == 1;
	}

	//영화 한글제목으로 검색 리스트 
	public List<AmaMovieVO>amaMovieKorList(String amaTitleKor ){
		return session.selectList("AmaMovie.amaMovieKorList",amaTitleKor);
	}
	//영화 영어제목으로 검색 리스트 
	public List<AmaMovieVO>amaMovieEngList(String amaTitleEng){
		System.out.println("들어오니");
		return session.selectList("AmaMovie.amaMovieEngList",amaTitleEng);
	}
	
}

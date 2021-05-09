package com.indieProject.app.board.dao;

import java.util.Collections;
import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;

import javax.mail.Session;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.indieProject.app.board.vo.BoardImageVO;
import com.indieProject.app.board.vo.BoardReplyVO;
import com.indieProject.app.board.vo.BoardVO;
import com.indieProject.mybatis.config.SqlMapConfig;
import com.oreilly.servlet.MultipartRequest;

public class BoardDAO {
	SqlSessionFactory sessionf = SqlMapConfig.getSqlMapInstance();
	SqlSession session;
	
	public BoardDAO() {
		session = sessionf.openSession(true);
	}
	
	// 게시글 상세보기
	// 게시글
	public BoardVO getBoard(int boardNum) {
		return session.selectOne("Board.getBoard", boardNum);
	}
	
	// 게시글 이미지
	public List<BoardImageVO> getBoardImages(int boardNum) {
		return session.selectList("Board.getBoardImages", boardNum);
	}
	
	// 게시글 댓글
	public List<BoardReplyVO> getBoardReplies(int boardNum) {
		return session.selectList("Board.getBoardReplies", boardNum);
	}
	
	// 게시글 등록
	public boolean insertBoard(BoardVO b_vo) {
		return session.insert("Board.insertBoard", b_vo) == 1;
	}
	
	// 게시글 이미지 저장
	public boolean insertBoardImages(int boardNum, MultipartRequest multi) {
		boolean check = true;
		BoardImageVO bi_vo = new BoardImageVO();
		
		Enumeration<String> images = multi.getFileNames();
		while(images.hasMoreElements()) {
			String data = images.nextElement();
			String systemName = multi.getFilesystemName(data);
			System.out.println("순서 바뀐겨?"+systemName);
			if(systemName == null) {continue;}
			
			bi_vo.setBoardNum(boardNum);
			bi_vo.setImageName(systemName);
			if(session.insert("Board.insertBoardImages", bi_vo) != 1) {
				check = false;
				break;
			}
		}
		return check;
	}
	// 등록하는 게시글 번호 가져오기
	public int getBoardNum() {
		return session.selectOne("Board.getBoardNum");
	}
	
	// 게시글 댓글 등록
	public boolean insertBoardReply(BoardReplyVO br_vo) {
		return session.insert("Board.insertBoardReply", br_vo) == 1;
	}
	
	// 게시글 댓글 수정
	public boolean updateBoardReply(BoardReplyVO br_vo) {
		return session.update("Board.updateBoardReply", br_vo) == 1;
	}
	
	// 게시글 댓글 삭제
	public boolean deleteBoardReply(int replyNum) {
		return session.delete("Board.deleteBoardReply", replyNum) == 1;
	}
	
	//게시글 수정
	public void updateBoard(BoardVO b_vo) {
		session.update("Board.updateBoard", b_vo);
	}
	//게시글 내용만 수정
	public void updateBoardContent(BoardVO b_vo) {
		session.update("Board.updateBoardContent", b_vo);
	}
	//게시글 삭제 
	public void deleteBoard(int boardNum) {
	 session.delete("Board.deleteBoard",boardNum);
	}
	
	//댓글 삭제 
	public void deleteReply(int boardNum) {
		session.delete("Board.deleteReply",boardNum);
	}
	
	//게시글 전체 개수
	public int getBoardListNum() {
		return session.selectOne("Board.getBoardListNum");
	}
	
	// 게시글 목록 가져오기
	public List<BoardVO> getBoardList(int startRow, int endRow) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("startRow", ""+startRow);
		map.put("endRow", ""+endRow);
		return session.selectList("Board.getBoardList", map);
	}
	// 게시글 목록 가져오기 검색어 포함
	public List<BoardVO> getSearchedBoardList(int startRow, int endRow, String keyword) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("startRow", ""+startRow);
		map.put("endRow", ""+endRow);
		map.put("keyword", ""+keyword);
		return session.selectList("Board.getSearchedBoardList", map);
	}
}
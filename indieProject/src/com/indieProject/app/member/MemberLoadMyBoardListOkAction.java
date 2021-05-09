package com.indieProject.app.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.vo.AmaMovieVO;
import com.indieProject.app.board.vo.BoardReplyVO;
import com.indieProject.app.board.vo.BoardVO;
import com.indieProject.app.member.dao.MemberDAO;

public class MemberLoadMyBoardListOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MemberDAO m_dao = new MemberDAO();
		PrintWriter out = resp.getWriter();
		HttpSession session = req.getSession();
		
		String memberId = (String) session.getAttribute("session_id");
		int startRow = Integer.parseInt(req.getParameter("startRow"));
		int endRow = Integer.parseInt(req.getParameter("endRow"));
				
		List<BoardVO> boardList= m_dao.myBoardListAll(memberId, startRow, endRow);
		JSONArray arBoardList = new JSONArray();
		
		for(BoardVO b_vo : boardList) {
			JSONObject board = new JSONObject();
			
			board.put("boardNum", b_vo.getBoardNum());
			board.put("boardImage", b_vo.getBoardImage());
			board.put("boardContent", b_vo.getBoardContent());
			
			arBoardList.add(board);
		}
		System.out.println(arBoardList.toJSONString());
		out.println(arBoardList.toJSONString());
		out.close();
		
		return null;
	}

}

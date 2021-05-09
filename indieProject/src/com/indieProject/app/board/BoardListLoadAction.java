package com.indieProject.app.board;

import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.board.dao.BoardDAO;
import com.indieProject.app.board.vo.BoardVO;

public class BoardListLoadAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		BoardDAO b_dao = new BoardDAO();
		PrintWriter out = resp.getWriter();

		int startRow = Integer.parseInt(req.getParameter("startRow"));
		int endRow = Integer.parseInt(req.getParameter("endRow"));
		String keyword = req.getParameter("keyword");
		System.out.println("검색어 없을 때: "+keyword);
				
		List<BoardVO> boardList= new ArrayList<BoardVO>();
		
		if(keyword == null || keyword == "") {
			boardList = b_dao.getBoardList(startRow, endRow);
		}else {
			boardList = b_dao.getSearchedBoardList(startRow, endRow, keyword);
		}
		
		JSONArray arBoardList = new JSONArray();
		
		for(BoardVO b_vo : boardList) {
			JSONObject board = new JSONObject();
			
			board.put("boardNum", b_vo.getBoardNum());
			board.put("boardImage", b_vo.getBoardImage());
			board.put("boardContent", b_vo.getBoardContent());
			
			arBoardList.add(board);
		}
		out.println(arBoardList.toJSONString());
		out.close();
		
		return null;
	}

}

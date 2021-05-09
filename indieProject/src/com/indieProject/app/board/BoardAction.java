package com.indieProject.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.board.dao.BoardDAO;

public class BoardAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		BoardDAO b_dao = new BoardDAO();
		
		int boardSize = 3;
		int totalCnt = b_dao.getBoardListNum();
		int endNum = totalCnt > boardSize ? boardSize : totalCnt;
		int totalPageCnt = ((totalCnt - 1) / boardSize) + 1;
		
		req.setAttribute("BoardList", b_dao.getBoardList(1, endNum));
		req.setAttribute("boardSize", boardSize);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("totalPageCnt", totalPageCnt);
		
		forward.setPath("/app/board/board.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}

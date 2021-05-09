package com.indieProject.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.board.dao.BoardDAO;
import com.indieProject.app.board.vo.BoardVO;

public class BoardViewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		int boardNum = Integer.parseInt(req.getParameter("boardNum"));
		
		BoardDAO b_dao = new BoardDAO();

		req.setAttribute("board", b_dao.getBoard(boardNum));
		req.setAttribute("boardImages", b_dao.getBoardImages(boardNum));
		
		forward.setRedirect(false);
		forward.setPath("/app/board/boardView.jsp");
		
		
		return forward;
	}

}

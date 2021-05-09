package com.indieProject.app.board;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.board.dao.BoardDAO;

public class BoardModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		//사용자가 누른 게시물의 번호를 받아서 수정 페이지에 넘겨주기 
		req.setCharacterEncoding("UTF-8");
		
		BoardDAO b_dao=new BoardDAO();
		ActionForward forward=new ActionForward();
		
		int boardNum=Integer.parseInt(req.getParameter("boardNum"));
		
		//게시글 번호로 게시글 가져오기
		req.setAttribute("b_vo", b_dao.getBoard(boardNum));
		req.setAttribute("boardImages", b_dao.getBoardImages(boardNum));
		
		forward.setRedirect(false);
		forward.setPath("/app/board/boardModify.jsp");
		
		return forward;
	}

}

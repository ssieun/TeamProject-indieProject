package com.indieProject.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.board.dao.BoardDAO;

public class BoardReplyDeleteOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		BoardDAO br_dao = new BoardDAO();
		PrintWriter out = resp.getWriter();
		
		if(br_dao.deleteBoardReply(Integer.parseInt(req.getParameter("replyNum")))) {
			out.println("댓글 삭제를 완료했습니다.");
		}else {
			out.println("댓글 삭제에 실패했습니다. 다시 시도해 주십시오.");
		}
		return null;
	}

}

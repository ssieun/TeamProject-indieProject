package com.indieProject.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.board.dao.BoardDAO;
import com.indieProject.app.board.vo.BoardReplyVO;

public class BoardReplyUpdateOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		BoardDAO br_dao = new BoardDAO();
		BoardReplyVO br_vo = new BoardReplyVO();
		PrintWriter out = resp.getWriter();

		br_vo.setReplyNum(Integer.parseInt(req.getParameter("replyNum")));
		br_vo.setReplyContent(req.getParameter("replyContent"));
		
		if(br_dao.updateBoardReply(br_vo)) {
			out.println("댓글 수정을 완료했습니다.");
		}else {
			out.println("댓글 수정에 실패했습니다. 다시 시도해 주십시오.");
		}
		
		return null;
	}

}

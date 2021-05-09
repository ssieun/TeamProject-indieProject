package com.indieProject.app.board;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.board.dao.BoardDAO;
import com.indieProject.app.board.vo.BoardReplyVO;

public class BoardReplyOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		BoardDAO br_dao = new BoardDAO();
		BoardReplyVO br_vo = new BoardReplyVO();
		PrintWriter out = resp.getWriter();
		
		int boardNum = Integer.parseInt(req.getParameter("boardNum"));
		String replyContent = req.getParameter("replyContent");
		String memberId = (String) session.getAttribute("session_id");
		
		br_vo.setBoardNum(boardNum);
		br_vo.setReplyContent(replyContent);
		br_vo.setMemberId(memberId);
		
		if(br_dao.insertBoardReply(br_vo)) {
			out.print("댓글이 등록되었습니다.");
		}else {
			out.print("댓글 등록에 실패했습니다. 다시 시도해 주십시오.");
		}
		out.close();
		
		return null;
	}

}

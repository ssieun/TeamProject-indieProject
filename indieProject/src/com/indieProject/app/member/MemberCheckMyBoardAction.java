package com.indieProject.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;

public class MemberCheckMyBoardAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MemberDAO m_dao = new MemberDAO();
		ActionForward forward = new ActionForward();
		
		HttpSession session = req.getSession();
		String memberId = (String) session.getAttribute("session_id");
		
		int boardSize = 3;
		int totalCnt = m_dao.myBoardNum(memberId);
		int endNum = totalCnt > boardSize ? boardSize : totalCnt;
		int totalPageCnt = ((totalCnt - 1) / boardSize) + 1;
		System.out.println("endNum"+endNum);
//		System.out.println(m_dao.myBoardListAll(memberId, 1, endNum).get(0).getBoardNum());
		// 내 게시글
		req.setAttribute("myBoardList", m_dao.myBoardListAll(memberId, 1, endNum));
		req.setAttribute("boardSize", boardSize);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("totalPageCnt", totalPageCnt);
		
		forward.setPath("/app/member/myPageBoard.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}

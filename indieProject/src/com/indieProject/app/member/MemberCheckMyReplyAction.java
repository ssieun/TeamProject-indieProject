package com.indieProject.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;

public class MemberCheckMyReplyAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session=req.getSession();
		String memberId=(String)session.getAttribute("session_id");
		
		MemberDAO m_dao=new MemberDAO();
		String temp=req.getParameter("page");

		int page = temp==null ? 1: Integer.parseInt(temp);
		
		int pageSize=10;
		
		int endRow=page*pageSize;
		int startRow=endRow-(pageSize-1);
		
		int startPage=((page-1)/pageSize)*pageSize +1;
		int endPage=startPage+(pageSize-1);
		int totalCnt=m_dao.myReplyNum(memberId);
		
		int realEndPage=(totalCnt-1)/pageSize+1;
		
		endPage=endPage>realEndPage ? realEndPage : endPage;
	
		
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("nowPage", page);
		req.setAttribute("realEndPage", realEndPage);
		req.setAttribute("replyList", m_dao.getBoardReply(startRow, endRow, memberId));
	
		forward.setRedirect(false);
		forward.setPath("/app/member/myPageReply.jsp");
		
		return forward;
	}

}

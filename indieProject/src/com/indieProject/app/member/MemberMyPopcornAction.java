package com.indieProject.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;

public class MemberMyPopcornAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		MemberDAO m_dao = new MemberDAO();
		HttpSession session = req.getSession();

		String memberId = (String)session.getAttribute("session_id");
		System.out.println("session: "+memberId);
		
		// 로그인 되어있는 객체
		req.setAttribute("myName", m_dao.getMemberName(memberId));
		req.setAttribute("myPopcornNum",  m_dao.myPopcornNum(memberId));
		req.setAttribute("myReceivedPopcornNum",  m_dao.myReceivedPopcornNum(memberId));

		forward.setRedirect(false);

		forward.setPath("/app/member/popcornPage.jsp");
		
		return forward;
	}

}

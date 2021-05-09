package com.indieProject.app.amamovie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;

public class PopcornSendAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		MemberDAO m_dao = new MemberDAO();
		
		String memberId = (String) session.getAttribute("session_id");
		String amaTitle = req.getParameter("amaTitle");
		int amaNum = Integer.parseInt(req.getParameter("amaNum"));
		int popcorn = m_dao.myPopcornNum(memberId);
		
		req.setAttribute("amaTitle", amaTitle);
		req.setAttribute("amaNum", amaNum);
		req.setAttribute("myPopcorn", popcorn);
		
		forward.setRedirect(false);
		forward.setPath("/app/amaMovie/sendPopcorn.jsp");
		
		return forward;
	}

}

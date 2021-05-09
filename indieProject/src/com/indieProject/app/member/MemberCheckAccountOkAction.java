package com.indieProject.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;

public class MemberCheckAccountOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MemberDAO m_dao = new MemberDAO();
		
		PrintWriter out = resp.getWriter();
		String memberId = (String)req.getSession().getAttribute("session_id");

		if(m_dao.checkAccount(memberId)) {
			out.print("ok");
		}else {
			out.print("not-ok");
		}
		out.close();
		
		return null;
	}
}

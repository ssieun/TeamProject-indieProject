package com.indieProject.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;

public class MemberMyPopcornChargeAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MemberDAO m_dao = new MemberDAO();
		HttpSession session = req.getSession();

		String memberId = (String)session.getAttribute("session_id");
		String popcornStr = req.getParameter("popcorn");
		System.out.println(popcornStr+" popcornStr");
		int popcorn = Integer.parseInt(popcornStr);
		System.out.println(popcorn +" popcorn");
		int pastPopcorn = m_dao.myPopcornNum(memberId);
		System.out.println(pastPopcorn + " pastPopcorn");
		popcorn += pastPopcorn;
		m_dao.popcornCharge(popcorn,memberId);

		
		PrintWriter out = resp.getWriter();
		out.println("success");
		
		return null;
	}

}

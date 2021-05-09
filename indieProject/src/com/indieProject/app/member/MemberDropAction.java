package com.indieProject.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;

public class MemberDropAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		System.out.println("회원 탈퇴");
		MemberDAO m_dao = new MemberDAO();
		HttpSession session = req.getSession();
		PrintWriter out = resp.getWriter();
		
		String memberId = (String) session.getAttribute("session_id");
		
		if(m_dao.drop(memberId)) {
			session.invalidate();
			out.println("회원 탈퇴를 완료했습니다.");
		}else {
			out.println("회원 탈퇴에 실패했습니다. 다시 시도해 주십시오.");
		}
		return null;
	}

}

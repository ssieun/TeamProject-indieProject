package com.indieProject.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;
import com.indieProject.app.member.vo.MemberAccountVO;

public class MemberAccountRegisterOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MemberAccountVO account_vo = new MemberAccountVO();
		PrintWriter out = resp.getWriter();
		MemberDAO m_dao = new MemberDAO();
		
		String memberId = (String)req.getSession().getAttribute("session_id");
		account_vo.setMemberId(memberId);
		account_vo.setMemberName(req.getParameter("memberName"));
		account_vo.setMemberBank(req.getParameter("memberBank"));
		account_vo.setAccountNum(req.getParameter("accountNum"));
		
		if(m_dao.addAccount(account_vo)) {
			out.print("ok");
		}else {
			out.print("not-ok");
		}
		out.close();
		
		return null;
	}
}

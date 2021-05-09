package com.indieProject.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONObject;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;
import com.indieProject.app.member.vo.MemberVO;

public class MemberCheckPwOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html; charset=utf-8");
		
		HttpSession session = req.getSession();

		MemberVO m_vo = null;
		MemberDAO m_dao = new MemberDAO();
		PrintWriter out = resp.getWriter();
		
		String memberId = (String)session.getAttribute("session_id");
		String memberPw = req.getParameter("memberPw");
		m_vo = m_dao.checkPwGetData(memberId, memberPw);
		if(m_vo == null) {
			out.print("no");
		}else {
			JSONObject jsonMember = new JSONObject();
			jsonMember.put("memberId", m_vo.getMemberId());
			jsonMember.put("memberEmail", m_vo.getMemberEmail());
			System.out.println(jsonMember);
			out.println(jsonMember.toJSONString());
		}
		out.close();
		
		return null;
	}
}

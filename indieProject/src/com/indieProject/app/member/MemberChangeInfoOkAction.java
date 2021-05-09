package com.indieProject.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;

public class MemberChangeInfoOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		System.out.println("들어옴");
		MemberDAO m_dao = new MemberDAO();
		ActionForward forward = null;
		
		String memberId = (String)req.getSession().getAttribute("session_id");
		String memberPw = req.getParameter("memberPw"); 
		String memberEmail = req.getParameter("memberEmail"); 
		
		//이메일 변경만 있을 때
		if(memberPw == "") {
			if(m_dao.changeEmail(memberId, memberEmail)) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/member/memberMyPage.me");
				System.out.println("이메일 변경 성공");
			}else {
				System.out.println("이메일 변경 실패");
			}
		}else {//이메일이 변경되었는지 여부 확인이 어렵기 때문에 이메일과 비밀번호 변경
			if(m_dao.changePwEmail(memberId, m_dao.encrypt(memberPw), memberEmail)) {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/member/memberMyPage.me");
				System.out.println("이메일, 비밀번호 변경 성공");
			}else {
				System.out.println("이메일, 비밀번호 변경 실패");
			}
		}
		
		return forward;
	}
}

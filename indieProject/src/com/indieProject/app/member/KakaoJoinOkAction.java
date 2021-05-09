package com.indieProject.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;
import com.indieProject.app.member.vo.MemberVO;

public class KakaoJoinOkAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		ActionForward forward=null;
		MemberDAO m_dao=new MemberDAO();
		MemberVO m_vo =new MemberVO();
		HttpSession session = req.getSession();

		
		m_vo.setMemberId(req.getParameter("id"));
		m_vo.setMemberPw("1234");
		System.out.println(req.getParameter("name") + " last name");
		m_vo.setMemberName(req.getParameter("name"));
		m_vo.setMemberEmail(req.getParameter("memberEmail"));
		m_vo.setPopcornNum(0);
		m_vo.setMyPopcorn(0);
		
		if(m_dao.join(m_vo)) {
			//회원가입 성공
			System.out.println("회원가입 완료");
			session.setAttribute("session_id", req.getParameter("kakaoId"));
			forward=new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/member/SignUpOk.me");
		}
		else {
			//회원가입 실패
			PrintWriter out=resp.getWriter();
			System.out.println("회원가입 실패");
			resp.setContentType("text/html;charset=utf-8");
			out.println("<script>alert('서버가 불안정 합니다 다시 시도해주세요');</script>");
			out.close();
		}
		return forward;
	}

}

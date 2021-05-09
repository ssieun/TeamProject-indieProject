package com.indieProject.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;
import com.indieProject.app.member.vo.MemberVO;

public class MemberLoginOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		HttpSession session = req.getSession();
		ActionForward forward = new ActionForward();
		
		MemberDAO m_dao = new MemberDAO();

		String id = req.getParameter("memberId");
		String pw = req.getParameter("memberPw");
		System.out.println(id+"before");
		System.out.println(pw+"before");
		String kakaoId = req.getParameter("kakaoId");
		String kakaoName = req.getParameter("kakaoName");
		
		PrintWriter out = resp.getWriter();

		if(kakaoId == null) {
			System.out.println("카카오 실패");

			if(m_dao.login(id, pw)) {
				//로그인 성공 시

				System.out.println(id+"after");
				System.out.println(pw+"after");	
				session.setAttribute("session_id", id);
				System.out.println(session.getAttribute("session_id"));

				out.println("primaryLoginSuccess");
				out.close();
			}else {
				//로그인 실패
				
				out.println("primaryLoginFail");
//				System.out.println(id+"else");
//				System.out.println(pw+"else");
//				System.out.println("로그인 실패");
//				forward.setRedirect(false);
//				//로그인 실패 시 경고창을 출력해주기 위해서 login 파라미터를 같이 전송해준다.
//				forward.setPath("/member/MemberLogin.me?login=false");
//				return forward;
				out.close();
			}
			return null;

		
		}
		else {


			if(m_dao.checkId(kakaoId)) {
				out.println("success");
				session.setAttribute("session_id", kakaoId);
				System.out.println(session.getAttribute("session_id"));
				out.close();
				return null;

			}else {
				System.out.println(kakaoId + " kid");
				System.out.println(kakaoName + " kname");
				out.println(kakaoId+","+kakaoName);
				out.close();
				return null;
			}
		}
	}

}

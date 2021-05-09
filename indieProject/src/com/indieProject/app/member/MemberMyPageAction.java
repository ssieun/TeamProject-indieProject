package com.indieProject.app.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;
import com.indieProject.app.member.vo.MemberVO;

public class MemberMyPageAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		HttpSession session = req.getSession();
		
		String memberId = (String)session.getAttribute("session_id");

		System.out.println("session: "+memberId);
		MemberDAO m_dao = new MemberDAO();
		
		// 로그인 되어있는 객체
		req.setAttribute("myName", m_dao.getMemberName(memberId));
		
		//내가 올린 영화 개수
		req.setAttribute("myMovieNum", m_dao.myMovieNum(memberId));
		//내가 작성한 감상평 개수
		req.setAttribute("myReviewNum", m_dao.myReviewNum(memberId));
		//내가 작성한 게시글 개수
		req.setAttribute("myBoardNum", m_dao.myBoardNum(memberId));
		//내가 작성한 댓글 개수
		req.setAttribute("myReplyNum", m_dao.myReplyNum(memberId));
		//보유 팝콘 개수
		req.setAttribute("myPopcornNum", m_dao.myPopcornNum(memberId));
		//받은 팝콘 개수
		req.setAttribute("myReceivedPopcornNum", m_dao.myReceivedPopcornNum(memberId));
		//내가 올린 영화 최근 5개
		req.setAttribute("myMovieList", m_dao.myMovieList(memberId));
		//내가 올린 게시글 최근 5개
		req.setAttribute("myBoardList", m_dao.myBoardList(memberId));
		//내가 올린 댓글 최근 5개
		req.setAttribute("myBoardReplyList", m_dao.myBoardReplyList(memberId));
		//내가 올린 감상평 최근 5개
		req.setAttribute("myReviewList", m_dao.myReviewList(memberId));
		// 영화 제목
		req.setAttribute("movieTitles", m_dao.getMovieTitle());
		
		forward.setRedirect(false);
		forward.setPath("/app/member/myPage.jsp");
		
		return forward;
	}
}

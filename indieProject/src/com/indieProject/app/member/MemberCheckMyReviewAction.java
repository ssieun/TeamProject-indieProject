package com.indieProject.app.member;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;

public class MemberCheckMyReviewAction implements Action {
//댓글 갯수, 댓글vo정보 뿌려주기
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session=req.getSession();
		String memberId=(String)session.getAttribute("session_id");
		
		MemberDAO m_dao=new MemberDAO();

		String temp=req.getParameter("page");
		System.out.println(temp);
		int page=temp==null ? 1 : Integer.parseInt(temp);
		
		//페이지 사이즈
		int pageSize=10;

		//끝나는 열
		int endRow=page*pageSize;
		//시작하는 열
		int startRow=endRow-(pageSize-1);
		//시작페이징
		int startPage=((page-1)/pageSize)*pageSize+1;
		//끝나는 페이징
		int endPage=startPage+(pageSize-1);
		//전체갯수 
		//내껏만 가져와야 하는데 안된다...
		int totalCnt=m_dao.myReviewNum(memberId);
		
		int realEndPage=(totalCnt-1)/pageSize+1;
	
		endPage= endPage >realEndPage ? realEndPage : endPage;
	
		
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("startPage", startPage);
		req.setAttribute("endPage", endPage);
		req.setAttribute("nowPage",page);
		req.setAttribute("realEndPage",realEndPage);
		req.setAttribute("myReviewListAll", m_dao.getReview(startRow, endRow,memberId));
		req.setAttribute("movieTitle", m_dao.getMovieTitle());
		
		System.out.println(page);
		forward.setRedirect(false);
		forward.setPath("/app/member/myPageReview.jsp");
		
		return forward;
	}

}

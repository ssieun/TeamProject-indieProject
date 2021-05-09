package com.indieProject.app.amamovie;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.dao.AmaMovieDAO;
import com.indieProject.app.amamovie.vo.AmaMovieReviewVO;
import com.indieProject.app.board.dao.BoardDAO;
import com.indieProject.app.board.vo.BoardReplyVO;

public class AmaMovieReviewOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		AmaMovieDAO a_dao = new AmaMovieDAO();
		AmaMovieReviewVO mr_vo = new AmaMovieReviewVO();
		PrintWriter out = resp.getWriter();
		
		int amaNum = Integer.parseInt(req.getParameter("amaNum"));
		int star = Integer.parseInt(req.getParameter("star"));
		String review = req.getParameter("review");
		String memberId = (String) session.getAttribute("session_id");
		
		if(!a_dao.checkReviewId(amaNum, memberId)) {			
			mr_vo.setAmaNum(amaNum);
			mr_vo.setStars(star);
			mr_vo.setReplyContent(review);
			mr_vo.setMemberId(memberId);
			
			if(a_dao.insertAmaReview(mr_vo)) {
				out.print("감상평이 등록되었습니다.");
			}else {
				out.print("감상평 등록에 실패했습니다. 다시 시도해 주십시오.");
			}
		}else {
			out.print("이미 감상평이 등록된 아이디입니다. 기존 감상평을 삭제 후 다시 시도해 주십시오.");
		}
		
		
		out.close();
		
		return null;
	}

}

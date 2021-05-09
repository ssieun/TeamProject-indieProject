package com.indieProject.app.amamovie;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.dao.AmaMovieDAO;

public class AmaMovieReviewDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		HttpSession session = req.getSession();
		AmaMovieDAO a_dao = new AmaMovieDAO();
		PrintWriter out = resp.getWriter();
		
		String memberId = (String) session.getAttribute("session_id");
		int amaNum = Integer.parseInt(req.getParameter("amaNum"));
		
		if(a_dao.deleteAmaReview(amaNum, memberId)) {
			out.print("감상평이 삭제되었습니다.");
		}else {
			out.print("감상평 삭제에 실패했습니다. 다시 시도해 주십시오.");
		}
		
		return null;
	}

}

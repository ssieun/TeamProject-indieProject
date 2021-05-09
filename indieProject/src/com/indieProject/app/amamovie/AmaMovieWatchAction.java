package com.indieProject.app.amamovie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.dao.AmaMovieDAO;
import com.indieProject.app.amamovie.vo.AmaMovieReviewVO;
import com.indieProject.app.amamovie.vo.AmaMovieVO;

public class AmaMovieWatchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		AmaMovieDAO a_dao = new AmaMovieDAO();

		int amaNum = Integer.parseInt(req.getParameter("amaNum"));
		AmaMovieVO a_vo = a_dao.getAmaData(amaNum);
		
		// 유투브 영상 주소 변환
		String link = "https://www.youtube.com/embed";
		String temp = a_vo.getLink();
		String movie = temp.substring(temp.lastIndexOf("/"));
		link += movie;

		req.setAttribute("ama_vo", a_vo);
		req.setAttribute("movieLink", link);
		
		forward.setRedirect(false);
		forward.setPath("/app/amaMovie/watchMovie.jsp");
		
		return forward;
	}

}

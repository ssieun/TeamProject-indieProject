package com.indieProject.app.amamovie;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.dao.AmaMovieDAO;
import com.indieProject.app.amamovie.vo.AmaMoviePosterVO;

public class AmaMovieDetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		AmaMovieDAO a_dao = new AmaMovieDAO();
		
		int amaNum = Integer.parseInt(req.getParameter("amaNum"));
		
		List<AmaMoviePosterVO> posters = a_dao.getAmaPoster(amaNum);
		List<String> posterRest = new ArrayList<>();
		String mainPoster = null;
		for (int i=0; i<posters.size(); i++) {
			String temp = posters.get(i).getFileName();
			if(temp.contains("main_")) {
				mainPoster = temp.substring(5);
			}else {
				posterRest.add(temp);
				continue;
			}
		}
		
		req.setAttribute("ama_vo", a_dao.getAmaData(amaNum));
		req.setAttribute("mainPoster", mainPoster);
		req.setAttribute("posters", posterRest);
		req.setAttribute("stillcuts", a_dao.getAmaStillcut(amaNum));
		req.setAttribute("makers", a_dao.getAmaMaker(amaNum));
		req.setAttribute("actors", a_dao.getAmaActor(amaNum));
		req.setAttribute("popcornSenders", a_dao.getPopcornSender(amaNum));
		req.setAttribute("reviews", a_dao.getAmaReviewRe5(amaNum));
		
		forward.setRedirect(false);
		forward.setPath("/app/amaMovie/amaMovieDetail.jsp");
		
		return forward;
	}
	
}

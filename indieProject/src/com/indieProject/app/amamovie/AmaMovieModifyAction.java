package com.indieProject.app.amamovie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.dao.AmaMovieDAO;
import com.indieProject.app.amamovie.vo.AmaMovieActorVO;
import com.indieProject.app.amamovie.vo.AmaMovieMakerVO;
import com.indieProject.app.amamovie.vo.AmaMoviePosterVO;
import com.indieProject.app.amamovie.vo.AmaMovieStillCutVO;
import com.indieProject.app.amamovie.vo.AmaMovieVO;

public class AmaMovieModifyAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		
		AmaMovieDAO a_dao = new AmaMovieDAO();
		
		String memberId = (String) req.getSession().getAttribute("session_id");
		int choiceAmaNum = Integer.parseInt(req.getParameter("amaNum"));
		
		AmaMovieVO movieData = a_dao.getAmaData(choiceAmaNum);
		
		if(movieData.getMemberId().equals(memberId)) {
			List<AmaMoviePosterVO> posterList = a_dao.getAmaPoster(choiceAmaNum);
			List<AmaMovieStillCutVO> stillCutList = a_dao.getAmaStillcut(choiceAmaNum);
			List<AmaMovieMakerVO> makerList = a_dao.getAmaMaker(choiceAmaNum);
			List<AmaMovieActorVO> actorList = a_dao.getAmaActor(choiceAmaNum);
			
			req.setAttribute("movieData", movieData);
			req.setAttribute("posterList", posterList);
			req.setAttribute("stillCutList", stillCutList);
			req.setAttribute("makerList", makerList);
			req.setAttribute("actorList", actorList);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/amaMovie/movieModify.jsp");
		}else {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/index.jsp");
		}
		return forward;
	}
}

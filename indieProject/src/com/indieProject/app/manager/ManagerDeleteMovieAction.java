package com.indieProject.app.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.manager.dao.ManagerDAO;
import com.indieProject.app.member.vo.DeleteMovieVO;

public class ManagerDeleteMovieAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		
		ManagerDAO ma_dao = new ManagerDAO();
		String memberId = (String)req.getSession().getAttribute("session_id");
		
		if(ma_dao.managerCheck(memberId)) {
			List<DeleteMovieVO> noneDeleteMovieList = ma_dao.getNoneDeleteMovie();
			
			req.setAttribute("noneDeleteMovieList", noneDeleteMovieList);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/indieManager/managerDeleteMovie.jsp");
			
		}
		return forward;
	}
}

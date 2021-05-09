package com.indieProject.app.amamovie;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.dao.AmaMovieDAO;

public class PopcornSendEndAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		AmaMovieDAO a_dao = new AmaMovieDAO();
		PrintWriter out = resp.getWriter();
		
		int sendNum = Integer.parseInt(req.getParameter("sendNum"));
		String content = req.getParameter("content");
		
		
		if(a_dao.updatePopcornContent(content, sendNum)) {
			out.println("후원자 한마디가 등록되었습니다.");
		}else {
			out.println("작성에 실패했습니다.");
		}
		out.close();
		
		return null;
	}

}

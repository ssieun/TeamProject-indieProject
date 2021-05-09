package com.indieProject.app.promovie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.ActionForward;

public class ProMovieFrontController extends HttpServlet{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		
		String command = requestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		if(command.equals("/proMovie/ProMovie.pro")) {
			try {
				forward = new ProMovieAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/proMovie/LoadMovieDetailAction.pro")) {
			try {
				forward = new LoadMovieDetailAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/proMovie/MainProMovieLoadAction.pro")) {
			try {
				forward = new MainProMovieLoadAction().execute(req, resp);
			} catch (Exception e) {;}
		}
		System.out.println(command);
		
		if(forward != null) {
			if(forward.isRedirect()) {
				resp.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
		
	}
}

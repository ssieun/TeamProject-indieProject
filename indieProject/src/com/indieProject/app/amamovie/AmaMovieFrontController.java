package com.indieProject.app.amamovie;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.ActionForward;
import com.indieProject.app.member.MemberCheckIdOkAction;

public class AmaMovieFrontController extends HttpServlet {
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
		System.out.println(command);
		ActionForward forward = null;
		if(command.equals("/amaMovie/AmaMovie.ama")) {
			try {
				forward = new AmaMovieAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/amaMovie/movieWrite.ama")) {
			try {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/amaMovie/movieWrite.jsp");
			} catch (Exception e) {;}
		}else if(command.equals("/amaMovie/MovieWriteOkAction.ama")) {
			try {
				forward = new AmaMovieWriteOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/amaMovie/AmaMovieDetail.ama")) {
			try {
				forward = new AmaMovieDetailAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/amaMovie/AmaMovieWatch.ama")) {
			try {
				forward = new AmaMovieWatchAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/amaMovie/AmaMovieReview.ama")) {
			try {
				forward = new AmaMovieReviewAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/amaMovie/AmaMovieReviewOk.ama")) {
			try {
				forward = new AmaMovieReviewOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/amaMovie/AmaMovieReviewDelete.ama")) {
			try {
				forward = new AmaMovieReviewDeleteAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/amaMovie/AmaMovieModify.ama")) {
			try {
				forward = new AmaMovieModifyAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/amaMovie/PopcornSend.ama")) {
			try {
				forward = new PopcornSendAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/amaMovie/PopcornSendOk.ama")) {
			try {
				forward = new PopcornSendOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/amaMovie/PopcornSendEnd.ama")) {
			try {
				forward = new PopcornSendEndAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/amaMovie/AmaMovieModifyOk.ama")) {
			try {
				forward = new AmaMovieModifyOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/amaMovie/MainAmaMovieLoadOk.ama")) {
			try {
				forward = new MainAmaMovieLoadOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/amaMovie/AmaMovieSearchListOk.ama")) {
			System.out.println("영화검색");
			try {
				forward=new AmaMovieSearchListOk().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}
		

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

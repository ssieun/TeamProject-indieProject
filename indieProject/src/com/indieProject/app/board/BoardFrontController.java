package com.indieProject.app.board;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.AmaMovieAction;

public class BoardFrontController extends HttpServlet{
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
		if(command.equals("/board/Board.bo")) {
			try {
				forward = new BoardAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/board/LoadBoardList.bo")) {
			try {
				forward = new BoardListLoadAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardWrite.bo")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/board/boardWrite.jsp");
		}else if(command.equals("/board/BoardWriteOk.bo")) {
			try {
				forward = new BoardWriteOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardView.bo")) {
			try {
				forward = new BoardViewAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardReply.bo")) {
			try {
				forward = new BoardReplyOkAction().execute(req, resp);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardReplyList.bo")) {
			try {
				forward = new BoardReplyListAction().execute(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardReplyUpdate.bo")) {
			try {
				forward = new BoardReplyUpdateOkAction().execute(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardReplyDelete.bo")) {
			try {
				forward = new BoardReplyDeleteOkAction().execute(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardModify.bo")) {
			//게시글 수정버튼 눌렀을 시 
			try {
				forward= new BoardModifyAction().execute(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardModifyOk.bo")) {
			//게시글 수정 완료버튼
			try {
				System.out.println("들어옴");
				forward=new BoardModifyActionOk().execute(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardDelete.bo")) {
			try {
				forward=new BoardDeleteAction().execute(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/board/BoardImageListOK.bo")) {
			try {
				System.out.println("프론트 컨트롤러에는 들어오니");
				forward=new BoardImageListOk().execute(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
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

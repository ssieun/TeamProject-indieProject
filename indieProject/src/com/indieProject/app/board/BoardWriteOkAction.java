package com.indieProject.app.board;

import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.board.dao.BoardDAO;
import com.indieProject.app.board.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardWriteOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		BoardDAO b_dao = new BoardDAO();
		BoardVO b_vo = new BoardVO();
		
		String saveFolder =req.getSession().getServletContext().getRealPath("/")+"../../../../../../indieProject/WebContent/images/board";;
		int fileSize = 5 * 1024 * 1204; // 5MB
		
		MultipartRequest multi = null;
		multi = new MultipartRequest(req, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		b_vo.setMemberId((String)req.getSession().getAttribute("session_id"));
		b_vo.setBoardContent(multi.getParameter("boardContent"));
		
		b_vo.setBoardImage(multi.getFilesystemName("boardImage1"));
		System.out.println(b_vo.getBoardContent());
		System.out.println(b_vo.getBoardImage());
		
		if(b_dao.insertBoard(b_vo)) {
			if(b_dao.insertBoardImages(b_dao.getBoardNum(), multi)) {				
				forward = new ActionForward();
				forward.setRedirect(true);
				forward.setPath(req.getContextPath()+"/board/Board.bo");
			}
		}
		
		
		return forward;
	}

}

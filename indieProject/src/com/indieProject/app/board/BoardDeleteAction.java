package com.indieProject.app.board;

import java.io.File;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.board.dao.BoardDAO;
import com.indieProject.app.board.dao.FilesDAO;
import com.indieProject.app.board.vo.BoardImageVO;
import com.indieProject.app.board.vo.BoardReplyVO;

public class BoardDeleteAction implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
	
		PrintWriter out=resp.getWriter();
		BoardDAO b_dao=new BoardDAO();
		FilesDAO f_dao=new FilesDAO();
		String saveFolder =req.getSession().getServletContext().getRealPath("/")+"../../../../../../indieProject/WebContent/images/board";;
		boolean check = false;
		
		int boardNum=Integer.parseInt(req.getParameter("boardNum"));
		//게시글에 있는 댓글 가져오기
		List<BoardReplyVO> result=b_dao.getBoardReplies(boardNum);
		System.out.println(boardNum);
		//이미지 파일 경로에서 먼저 지워주기
		for(BoardImageVO image: b_dao.getBoardImages(boardNum)) {
			File f=new File(saveFolder,image.getImageName());
			if(f.exists()) {
				f.delete();
				check = true;
			}
		}
		
		f_dao.deleteImages(boardNum);
		System.out.println("이미지 삭제");
		if(! result.isEmpty()) {
			System.out.println("댓글 삭제");
			//댓글이 하나라도 있으면 
		b_dao.deleteReply(boardNum);			
		}
		System.out.println("게시판 삭제");
		b_dao.deleteBoard(boardNum);
		
		if(check) {
			out.print("ok");
			out.close();
		}
		return null;
	}
	
	
	

}

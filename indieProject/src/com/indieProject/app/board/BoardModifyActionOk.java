package com.indieProject.app.board;

import java.io.File;

import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.board.dao.BoardDAO;
import com.indieProject.app.board.dao.FilesDAO;
import com.indieProject.app.board.vo.BoardImageVO;
import com.indieProject.app.board.vo.BoardVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class BoardModifyActionOk implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
			
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
		
			ActionForward forward=new ActionForward();
			BoardDAO b_dao=new BoardDAO();
			FilesDAO f_dao=new FilesDAO();
			MultipartRequest multi=null;
			String saveFolder =req.getSession().getServletContext().getRealPath("/")+"../../../../../../indieProject/WebContent/images/board";
			int fileSize = 5 * 1024 * 1204; // 5MB
			
			try {
				BoardVO b_vo=new BoardVO();
				multi = new MultipartRequest(req, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());

				
				String photoChanged = multi.getParameter("photoChanged");
				
				int boardNum=Integer.parseInt(multi.getParameter("boardNum"));
				
				if(photoChanged.equals("changed")) {
					
					//게시글 번호와
					//수정완료 버튼을 눌렀을 때 기존에 있던 파일을 지우고
					//다시 수정한 파일 그대로 저장하기
					System.out.println("그럼 여기로 들어오는 거잖아?");
					for(BoardImageVO file: b_dao.getBoardImages(boardNum)) {
						File f=new File(saveFolder,file.getImageName());
						if(f.exists()) {
							f.delete();
						}
						
					}
					
					//디비에 삭제 
					f_dao.deleteImages(boardNum);
					//다시 추가해주기
					b_dao.insertBoardImages(boardNum, multi);
					
					b_vo.setBoardNum(boardNum);
					b_vo.setBoardContent(multi.getParameter("boardContent"));
					b_vo.setBoardImage(multi.getFilesystemName("boardImage1"));
					b_dao.updateBoard(b_vo);
					
				}else {
					b_vo.setBoardNum(boardNum);
					b_vo.setBoardContent(multi.getParameter("boardContent"));
					b_dao.updateBoardContent(b_vo);
				}
				
				
				forward.setRedirect(true);
				forward.setPath(req.getContextPath()+"/member/memberMyBoard.me");


			} catch (Exception e) {
				PrintWriter out=resp.getWriter();
				resp.setContentType("text/html;charset=UTF-8");
				out.print("<script>");
				out.println("alert('게시글 수정 실패. 다시 시도해주세요.');");
				out.println("history.back();");
				out.print("</script>");
				e.printStackTrace();
				return null;
			}
			return forward;

	}

}
package com.indieProject.app.board;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.board.dao.BoardDAO;
import com.indieProject.app.board.vo.BoardImageVO;

public class BoardImageListOk implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {

				System.out.println("컨트롤러 들어옴");
			req.setCharacterEncoding("UTF-8");
			resp.setCharacterEncoding("UTF-8");
		
			int boardNum=Integer.parseInt(req.getParameter("boardNum"));
			
			PrintWriter out=resp.getWriter();
			BoardDAO b_dao= new BoardDAO();
			
			JSONArray arImage= new JSONArray();
			
			List<BoardImageVO>images=b_dao.getBoardImages(boardNum);
			
			for(BoardImageVO b_vo: images) {
				JSONObject image= new JSONObject();
				
				image.put("boardNum", b_vo.getBoardNum());
				image.put("imageName",b_vo.getImageName());
				
				arImage.add(image);
			}
			out.print(arImage.toJSONString());
			out.close();
			
		return null;
	}

}

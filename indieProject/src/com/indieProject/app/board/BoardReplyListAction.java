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
import com.indieProject.app.board.vo.BoardReplyVO;

public class BoardReplyListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int boardNum = Integer.parseInt(req.getParameter("boardNum"));
		
		PrintWriter out = resp.getWriter();
		BoardDAO r_dao = new BoardDAO();
		
		List<BoardReplyVO> replies = r_dao.getBoardReplies(boardNum);
		JSONArray arReply = new JSONArray();
		
		for(BoardReplyVO br_vo : replies) {
			JSONObject reply = new JSONObject();
			
			reply.put("replyNum", br_vo.getReplyNum());
			reply.put("memberId", br_vo.getMemberId());
			reply.put("replyContent", br_vo.getReplyContent());
			
			arReply.add(reply);
		}
		out.println(arReply.toJSONString());
		out.close();
		
		return null;
	}

}

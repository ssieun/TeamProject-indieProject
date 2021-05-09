package com.indieProject.app.amamovie;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.dao.AmaMovieDAO;
import com.indieProject.app.amamovie.vo.PopcornVO;
import com.indieProject.app.member.dao.MemberDAO;

public class PopcornSendOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		HttpSession session = req.getSession();
		MemberDAO m_dao = new MemberDAO();
		AmaMovieDAO a_dao = new AmaMovieDAO();
		PopcornVO p_vo = new PopcornVO();
		
		String memberId = (String) session.getAttribute("session_id");
		String amaTitle = req.getParameter("amaTitle");
		int amaNum = Integer.parseInt(req.getParameter("amaNum"));
		int popcornNum = Integer.parseInt(req.getParameter("popcornNum"));

		String receiveId = a_dao.getAmaData(amaNum).getMemberId();
		
		p_vo.setAmaNum(amaNum);
		p_vo.setSendId(memberId);
		p_vo.setReceiveId(receiveId);
		p_vo.setPopcornNum(popcornNum);
		p_vo.setPopcornContent("-");
		
		if(a_dao.sendPopcorn(p_vo)) {
			m_dao.updateMyPopcorn(popcornNum, memberId);
			m_dao.updatePopcornNum(popcornNum, receiveId);
			
			req.setAttribute("amaTitle", amaTitle);
			req.setAttribute("amaNum", amaNum);
			req.setAttribute("popcornNum", popcornNum);
			req.setAttribute("sendNum", a_dao.getSendNum());
			
			forward.setRedirect(false);
			forward.setPath("/app/amaMovie/sendPopcornEnd.jsp");
			
		}else {
			System.out.println("일단 팝콘 보내기 실패");
		}
		
		return forward;
	}

}

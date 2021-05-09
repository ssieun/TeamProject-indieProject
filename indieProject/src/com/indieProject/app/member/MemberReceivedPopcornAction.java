package com.indieProject.app.member;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;
import com.indieProject.app.member.vo.PopcornExchangeVO;

public class MemberReceivedPopcornAction  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MemberDAO m_dao=new MemberDAO();
		PopcornExchangeVO exchange_vo = new PopcornExchangeVO();
		HttpSession session = req.getSession();
		PrintWriter out=resp.getWriter();

		String memberId = (String)session.getAttribute("session_id");
		System.out.println("memberId= "+ memberId);
		int changePopcorn = Integer.parseInt(req.getParameter("changePopcorn"));
		int myReceivedPopcornNum = m_dao.myReceivedPopcornNum(memberId);
		
		exchange_vo.setMemberId(memberId);
		exchange_vo.setPopcornNum(changePopcorn);
		//여기가 금액출력부
		exchange_vo.setMoney(changePopcorn * 100);
		
		if(changePopcorn > myReceivedPopcornNum) {
			//혹시몰라 한번더 확인
			out.print("not-ok");
		}else {
			if(m_dao.applyExchange(exchange_vo)) {
				System.out.println("환전신청 성공");
				if(m_dao.subPopcorn(memberId, changePopcorn)) {
					out.write("ok");
					System.out.println("신청개수 차감 성공");
				}else {
					out.print("not-ok");
					System.out.println("신청개수 차감 실패");
				}
			}else {
				out.print("not-ok");
				System.out.println("환전신청 실패");
			}
		}
		out.close();
		
		return null;
	}

}

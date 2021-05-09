package com.indieProject.app.manager;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.manager.dao.ManagerDAO;
import com.indieProject.app.manager.vo.PopcornExchangeDataVO;

public class ManagerRefundsAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		
		ManagerDAO ma_dao = new ManagerDAO();
		String memberId = (String)req.getSession().getAttribute("session_id");
		
		if(ma_dao.managerCheck(memberId)) {
			String temp = req.getParameter("page");
			System.out.println("받아온 페이지 번호: " + temp);
			
			int page = temp == null ? 1 : Integer.parseInt(temp);
			
			//페이지 사이즈
			int pageSize = 10;
			//해당 페이지의 마지막 열
			int endRow = page * pageSize;
			//해당 페이지의 첫번째 열
			int startRow = endRow - (pageSize - 1);
			//시작 페이징
			int startPage = ((page - 1) / pageSize) * pageSize + 1;
			//끝나는 페이징
			int endPage = startPage + (pageSize - 1);
			//전체 데이터 개수
			int totalCnt = ma_dao.getExchangeCnt();
			
			int realEndPage = (totalCnt - 1) / pageSize + 1;
			
			endPage = endPage > realEndPage ? realEndPage : endPage;
			
			List<PopcornExchangeDataVO> exchangeList = ma_dao.getExchangeData(startRow, endRow);
			
			req.setAttribute("exchangeList", exchangeList);
			req.setAttribute("startPage", startPage);
			req.setAttribute("page", page);
			req.setAttribute("endPage", endPage);
			req.setAttribute("realEndPage", realEndPage);
			System.out.println("startPage:"+startPage);
			System.out.println("endPage:"+endPage);
			
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/indieManager/managerRefunds.jsp");
			
		}
		
		return forward;
	}
}

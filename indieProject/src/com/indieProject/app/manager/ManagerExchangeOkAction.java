package com.indieProject.app.manager;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.manager.dao.ManagerDAO;

public class ManagerExchangeOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ManagerDAO ma_dao = new ManagerDAO();
		
		PrintWriter out = resp.getWriter();
		
		String exchangeNum = req.getParameter("exchangeNum");
		
		if(ma_dao.setExchangeYes(exchangeNum)) {
			out.print("ok");
		}else {
			out.print("not-ok");
		}
		out.close();
		return null;
	}
}

package com.indieProject.app.manager;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.manager.dao.ManagerDAO;

public class CheckManagerOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		ManagerDAO ma_dao = new ManagerDAO();
		if((String)req.getSession().getAttribute("session_id") != null && (String)req.getSession().getAttribute("session_id") != "") {
			String memberId = (String)req.getSession().getAttribute("session_id");
			if(memberId != null) {
				if(ma_dao.managerCheck(memberId)) {
					out.print("ok");
				}else {
					out.print("not-ok");
				}
			}else {
				out.print("not-ok");
			}
		}else {
			out.print("no_session_Id");
		}
		out.close();
		return null;
	}
}

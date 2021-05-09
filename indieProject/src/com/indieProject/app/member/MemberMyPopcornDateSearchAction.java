package com.indieProject.app.member;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.member.dao.MemberDAO;
import com.indieProject.app.member.vo.MyPagePopcornVO;

public class MemberMyPopcornDateSearchAction  implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MemberDAO m_dao = new MemberDAO();
		HttpSession session = req.getSession();

		String memberId = (String)session.getAttribute("session_id");
		String date1 = req.getParameter("date1");
		String date2 = req.getParameter("date2");
		System.out.println("session: "+memberId);
        System.out.println(date1 + "팝콘");
        System.out.println(date2 + "팝콘");
		List<MyPagePopcornVO> popCornList = m_dao.myPopcornList(memberId,date1,date2);
		System.out.println(popCornList.get(0).getAmaTitleKor());
		
        String delim1 = ",";
        String delim2 = "+";
        StringBuilder sb = new StringBuilder();
        int i = 0;
        while (i < popCornList.size()-1)
        {
            sb.append(popCornList.get(i).getAmaTitleKor());
            sb.append(delim2);
            sb.append(popCornList.get(i).getReceiveId());
            sb.append(delim2);
            sb.append(popCornList.get(i).getPopCornNum());
            sb.append(delim2);
            sb.append(popCornList.get(i).getPopCornNum());
            sb.append(delim2);
            sb.append(popCornList.get(i).getSendDate());
            sb.append(delim1);
            i++;
        }
        sb.append(popCornList.get(i).getAmaTitleKor());
        sb.append(delim2);
        sb.append(popCornList.get(i).getReceiveId());
        sb.append(delim2);
        sb.append(popCornList.get(i).getPopCornNum());
        sb.append(delim2);
        sb.append(popCornList.get(i).getPopCornNum());
        sb.append(delim2);
        sb.append(popCornList.get(i).getSendDate());
        
        
        String popCornString = sb.toString();
        System.out.println(popCornString + "팝콘 스트링");

        PrintWriter out = resp.getWriter();
        out.println(popCornString);
		
		return null;
	}

}

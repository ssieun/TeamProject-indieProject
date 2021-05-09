package com.indieProject.app.member;

import java.io.PrintWriter;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.vo.AmaMoviePosterVO;
import com.indieProject.app.amamovie.vo.AmaMovieVO;
import com.indieProject.app.member.dao.MemberDAO;

public class MemberLoadMyMovieListOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		MemberDAO m_dao = new MemberDAO();
		PrintWriter out = resp.getWriter();
		
		String memberId = req.getParameter("session_id");
		int startRow = Integer.parseInt(req.getParameter("startRow"));
		int endRow = Integer.parseInt(req.getParameter("endRow"));
		
		JSONArray arMovieList = new JSONArray();
		
		List<AmaMovieVO> movieList= m_dao.myMovieListAll(memberId, startRow, endRow);
		for (int i = 0; i < movieList.size(); i++) {
			boolean flag = true;
			int amaNum = movieList.get(i).getAmaNum();
			
			JSONObject movie = new JSONObject();
			movie.put("amaNum", movieList.get(i).getAmaNum());
			movie.put("amaTitleKor", movieList.get(i).getAmaTitleKor());
			List<AmaMoviePosterVO> posterList = m_dao.myMovieListAllPoster(amaNum);
			for (int j = 0; j < posterList.size(); j++) {
				if(posterList.get(j).getFileName().substring(0, 5).equals("main_")) {
					movie.put("fileName", posterList.get(j).getFileName().substring(5));
					flag = false;
					break;
				}
			}
			if(flag) { //만약 main이미지를 못찾았다면
				movie.put("fileName", "");
				//포스터가 null인 값을 추가하여 순서가 꼬여있는 상황을 방지
			}
			arMovieList.add(movie);
		} 
		System.out.println(arMovieList.toJSONString());
		out.println(arMovieList.toJSONString());
		out.close();
		
		return null;
	}
}

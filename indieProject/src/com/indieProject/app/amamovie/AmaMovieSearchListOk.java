
package com.indieProject.app.amamovie;

import java.io.PrintWriter;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.dao.AmaMovieDAO;
import com.indieProject.app.amamovie.vo.AmaMoviePosterVO;
import com.indieProject.app.amamovie.vo.AmaMovieVO;


public class AmaMovieSearchListOk implements Action{

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		
		AmaMovieDAO m_dao=new AmaMovieDAO();
		PrintWriter out= resp.getWriter();
		String keyword=req.getParameter("keyword");
		System.out.println(keyword);
		keyword=keyword.replaceAll(" ", "");

		
		List<AmaMovieVO>amaMovieKorList=new ArrayList<AmaMovieVO>();
		List<AmaMovieVO>amaMovieEngList=new ArrayList<AmaMovieVO>();
		List<AmaMoviePosterVO>amaMovieStillCut=null;
		
		JSONArray arMovieKorResult=new JSONArray();
		JSONArray arMovieEngResult=new JSONArray();
		JSONArray noResult=new JSONArray();

		if(Pattern.matches("^[가-힣]*$", keyword)==true) {
			System.out.println(keyword);
			amaMovieKorList=m_dao.amaMovieKorList(keyword);
			//한글 제목으로 검색할때			
		for(AmaMovieVO m_vo: amaMovieKorList) {
			JSONObject list=new JSONObject();
			amaMovieStillCut=m_dao.getAmaPoster(m_vo.getAmaNum());
			
			list.put("amaNum", m_vo.getAmaNum());
			list.put("amaTitleKor" ,m_vo.getAmaTitleKor());
			list.put("synopsis",m_vo.getSynopsis());
			list.put("fileName",amaMovieStillCut.get(0).getFileName().substring(5));
			list.put("genre", m_vo.getGenre());
			
			System.out.println(amaMovieStillCut.get(0).getFileName().substring(5));
			arMovieKorResult.add(list);
	
			}
		out.print(arMovieKorResult.toJSONString());
		System.out.println("한글제목 검색하고 출력도 성공");
		
		}else if(Pattern.matches("^[a-zA-Z]*$",keyword)==true) {
			amaMovieEngList=m_dao.amaMovieEngList(keyword);
			System.out.println("영어제목"+keyword);
		//영어 제목으로 검색 할떄
		for(AmaMovieVO m_vo: 	amaMovieEngList) {
			JSONObject list=new JSONObject();
			
			
			amaMovieStillCut=m_dao.getAmaPoster(m_vo.getAmaNum());
	
			list.put("amaNum", m_vo.getAmaNum());
			list.put("amaTitleKor" ,m_vo.getAmaTitleKor());
			list.put("synopsis",m_vo.getSynopsis());
			list.put("fileName",amaMovieStillCut.get(0).getFileName().substring(5));
			list.put("genre", m_vo.getGenre());
			list.put("genre", m_vo.getGenre());
			
			arMovieEngResult.add(list);
		
			System.out.println(m_vo.getAmaTitleEng());
			System.out.println(m_vo.getAmaTitleKor());
		}
		out.print(arMovieEngResult.toJSONString());
		System.out.println("영어제목 검색하고 출력도 성공");
	}else {
		System.out.println("검색결과 없음");
		out.print(noResult.toJSONString());
	}

		out.close();
		return null;
	}
}

package com.indieProject.app.amamovie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.dao.AmaMovieDAO;
import com.indieProject.app.amamovie.vo.AmaMovieAndPosterVO;

public class AmaMovieAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		resp.setContentType("text/html;charset=utf-8");
		ActionForward forward = new ActionForward();
		AmaMovieDAO a_dao = new AmaMovieDAO();
		
		//현재 업로드된 장르 종류 가져오기 -> 장르에 맞춰서 데이터 가져오기[각각 한번씩? 어차피 객체로 받아오니까 장르받아온거로 json그룹만들고 그룹이름에 맞을 때 해당 그룹에 집어넣기
		List<String> genreList = a_dao.getGenre();
		
		//장르별로 구분하여 데이터를 가지고있는 JSONObject
		JSONObject finalJson = new JSONObject();
		
		//장르 배열
		String [] arGenre = new String[genreList.size()];
		
		for (int i = 0; i < genreList.size(); i++) {
			arGenre[i] = genreList.get(i);
			List<AmaMovieAndPosterVO> movieList = a_dao.getAmaMovieAndPosterList(genreList.get(i));
			JSONArray arJson = new JSONArray();
			for (int j = 0; j < movieList.size(); j++) {
				JSONObject json = new JSONObject();
				json.put("amaNum", movieList.get(j).getAmaNum());
				json.put("amaTitleKor", movieList.get(j).getAmaTitleKor());
				json.put("fileName", movieList.get(j).getFileName().substring(5));
				json.put("synopsis", movieList.get(j).getSynopsis());
				arJson.add(json);
			}
			finalJson.put(arGenre[i], arJson);
		}
		
		if(genreList.size() == 0) {
			req.setAttribute("movieJson", "");
		}else {
			req.setAttribute("movieJson", finalJson.toJSONString());
		}
		forward.setPath("/app/amaMovie/amaMovie.jsp");
		forward.setRedirect(false);
		
		return forward;
	}
}

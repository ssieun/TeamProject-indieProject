package com.indieProject.app.amamovie;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.dao.AmaMovieDAO;
import com.indieProject.app.amamovie.vo.AmaMovieAndPosterVO;

public class MainAmaMovieLoadOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		AmaMovieDAO a_dao = new AmaMovieDAO();
		
		List<AmaMovieAndPosterVO> dataList = a_dao.getMainAmaMovieAndPosterList();
		
		JSONArray arDatas = new JSONArray();
		for (int i = 0; i < dataList.size(); i++) {
			JSONObject data = new JSONObject();
			data.put("amaNum", dataList.get(i).getAmaNum());
			data.put("amaTitleKor", dataList.get(i).getAmaTitleKor());
			data.put("fileName", dataList.get(i).getFileName().substring(5));
			arDatas.add(data);
		}
		out.println(arDatas.toJSONString());
		out.close();
		
		return null;
	}
}

package com.indieProject.app.amamovie;

import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.dao.AmaMovieDAO;
import com.indieProject.app.amamovie.vo.AmaMovieReviewVO;
import com.indieProject.app.amamovie.vo.AmaMovieVO;

public class AmaMovieReviewAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		int amaNum = Integer.parseInt(req.getParameter("amaNum"));
		AmaMovieDAO a_dao = new AmaMovieDAO();
		AmaMovieVO a_vo = a_dao.getAmaData(amaNum);
		PrintWriter out = resp.getWriter();
		
		String temp = req.getParameter("page");
		int page = temp == null ? 1 : Integer.parseInt(temp);
		
		//페이지 사이즈
		int pageSize=5;
		//끝나는 행
		int endRow=page*pageSize;
		//시작하는 행
		int startRow=endRow-(pageSize-1);
		//시작 페이지
		int startPage=((page-1)/pageSize)*pageSize+1;
		//끝나는 페이지
		int endPage=startPage+(pageSize-1);
		
		
		int totalCnt = a_dao.getAmaReviewNum(amaNum);
		int realEndPage=(totalCnt-1)/pageSize+1;
	
		endPage= endPage >realEndPage ? realEndPage : endPage;

		List<AmaMovieReviewVO> amaReviews = a_dao.getAmaReview(amaNum, startRow, endRow);
		JSONArray arReview = new JSONArray();
		
		for(AmaMovieReviewVO mr_vo : amaReviews) {
			JSONObject review = new JSONObject();
			
			String from = mr_vo.getReplyDate();
			String to = from.substring(0, 16);

			review.put("amaNum", amaNum);
			review.put("totalCnt", totalCnt);
			review.put("startPage", startPage);
			review.put("endPage", endPage);
			review.put("nowPage", page);
			review.put("realEndPage", realEndPage);
			review.put("memberId", mr_vo.getMemberId());
			review.put("stars", mr_vo.getStars());
			review.put("replyContent", mr_vo.getReplyContent());
			review.put("replyDate", to);
			review.put("starAvg", a_dao.getStarAvg(amaNum));
			
			arReview.add(review);
		}
		out.println(arReview.toJSONString());
		out.close();
		
		return null;
	}

}

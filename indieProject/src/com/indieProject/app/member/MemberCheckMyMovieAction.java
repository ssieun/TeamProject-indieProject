package com.indieProject.app.member;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.vo.AmaMoviePosterVO;
import com.indieProject.app.amamovie.vo.AmaMovieVO;
import com.indieProject.app.member.dao.MemberDAO;

public class MemberCheckMyMovieAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = new ActionForward();
		
		String memberId = (String)req.getSession().getAttribute("session_id");
		
		MemberDAO m_dao = new MemberDAO();
		
		//한 페이지에서 보여줄 영화의 개수
		int boardSize = 3;
		
		//내가 작성한 영화 전체 개수
		int totalCnt = m_dao.myMovieNum(memberId);
		
		int endNum = totalCnt > boardSize ? boardSize : totalCnt;
		
		//내가 작성한 영화 전체 개수를 통한 보여질 수 있는 전체 페이지 수
		int totalPageCnt = ((totalCnt - 1) / boardSize) + 1;
		
		List<AmaMovieVO> movieList= m_dao.myMovieListAll(memberId, 1, endNum);
		
		List<AmaMoviePosterVO> moviePosterList = new ArrayList<AmaMoviePosterVO>();
		
		for (int i = 0; i < movieList.size(); i++) {
			boolean flag = true;
			int amaNum = movieList.get(i).getAmaNum();
			List<AmaMoviePosterVO> posterList = m_dao.myMovieListAllPoster(amaNum);
			for (int j = 0; j < posterList.size(); j++) {
				if(posterList.get(j).getFileName().substring(0, 5).equals("main_")) {
					moviePosterList.add(posterList.get(j));
					flag = false;
					break;
				}
			}
			if(flag) { //만약 main이미지를 못찾았다면
				AmaMoviePosterVO vo = new AmaMoviePosterVO();
				vo.setAmaNum(amaNum);
				moviePosterList.add(vo);
				//포스터가 null인 값을 추가하여 순서가 꼬여있는 상황을 방지
			}
		}
		
		req.setAttribute("boardSize", boardSize);
		req.setAttribute("totalCnt", totalCnt);
		req.setAttribute("totalPageCnt", totalPageCnt);
		req.setAttribute("movieList", movieList);
		req.setAttribute("moviePosterList", moviePosterList);
		
		forward.setPath("/app/member/myPageMovie.jsp");
		forward.setRedirect(false);
		
		return forward;
	}

}

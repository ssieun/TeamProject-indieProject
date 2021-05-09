package com.indieProject.app.amamovie;


import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.amamovie.dao.AmaMovieDAO;
import com.indieProject.app.amamovie.vo.AmaMovieActorVO;
import com.indieProject.app.amamovie.vo.AmaMovieMakerVO;
import com.indieProject.app.amamovie.vo.AmaMovieVO;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

public class AmaMovieWriteOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		ActionForward forward = null;
		AmaMovieVO a_vo = new AmaMovieVO();
		AmaMovieMakerVO [] a_m_vo_ar = null;
		AmaMovieActorVO [] a_a_vo_ar = null;

		AmaMovieDAO a_dao = new AmaMovieDAO();
		
		int movieNum;
		
		String saveFolder =req.getSession().getServletContext().getRealPath("/")+"../../../../../../indieProject/WebContent/images/amaMovie";
		
		int fileSize = 5 * 1024 * 1024; //5MB
		
		MultipartRequest multi = new MultipartRequest(req, saveFolder, fileSize, "UTF-8", new DefaultFileRenamePolicy());
		
		a_vo.setAmaTitleEng(multi.getParameter("amaTitleEng"));
		a_vo.setAmaTitleKor(multi.getParameter("amaTitleKor"));
		a_vo.setAmaMakeDate(multi.getParameter("amaMakeDate"));
		a_vo.setAmaMovieLength(multi.getParameter("amaMovieLength"));
		a_vo.setAmaDirector(multi.getParameter("amaDirector"));
		a_vo.setGenre(multi.getParameter("genre"));
		a_vo.setRating(multi.getParameter("rating"));
		a_vo.setLink(multi.getParameter("link"));
		a_vo.setPopcorn(multi.getParameter("popcorn"));
		a_vo.setSynopsis(multi.getParameter("synopsis"));
		a_vo.setTheme(multi.getParameter("theme"));
		a_vo.setMemberId((String)req.getSession().getAttribute("session_id"));
		System.out.println(a_vo.getMemberId());
		if(a_dao.insertMovie(a_vo)) {
			System.out.println("영화입력 성공");
			movieNum = a_dao.getMovieNum(a_vo);
			System.out.println(movieNum);
			//제작진 입력
			String makerPositionAr[] = multi.getParameterValues("makerPosition");
			String makerNameAr [] = multi.getParameterValues("makerName");
			a_m_vo_ar = new AmaMovieMakerVO[makerPositionAr.length];
			for (int i = 0; i < makerPositionAr.length; i++) {
				AmaMovieMakerVO vo = new AmaMovieMakerVO();
				vo.setAmaNum(movieNum);
				vo.setMakerPosition(makerPositionAr[i]);
				vo.setMakerName(makerNameAr[i]);
				a_m_vo_ar[i] = vo;
			}
			if(a_dao.insertMaker(a_m_vo_ar)) {
				System.out.println("제작진 입력 성공");
				
				String actorCastAr [] = multi.getParameterValues("actorCast");
				String actorNameAr [] = multi.getParameterValues("actorName");
				a_a_vo_ar = new AmaMovieActorVO[actorCastAr.length];
				for (int i = 0; i < actorCastAr.length; i++) {
					AmaMovieActorVO vo = new AmaMovieActorVO();
					vo.setAmaNum(movieNum);
					vo.setAmaCast(actorCastAr[i]);
					vo.setActorName(actorNameAr[i]);
					a_a_vo_ar[i] = vo;
				}
				//출연진 입력
				if(a_dao.insertActor(a_a_vo_ar)) {
					System.out.println("출연진 입력 성공");
					if(a_dao.insertPoster(movieNum, multi)) {
						System.out.println("포스터 입력 성공");
						if(a_dao.insertStillCut(movieNum, multi)) {
							System.out.println("스틸컷 입력 성공");
							forward = new ActionForward();
							forward.setPath(req.getContextPath() + "/amaMovie/AmaMovie.ama");
							forward.setRedirect(true);
						}else {
							System.out.println("스틸컷 입력 실패");
						}
					}else {
						System.out.println("포스터 입력 실패");
					}
				}else {
					System.out.println("출연진 입력 실패");
				}
			}else {
				System.out.println("제작진 입력 실패");
			}
		}else {
			System.out.println("영화입력 실패");
		}
		
		return forward;
	}
}

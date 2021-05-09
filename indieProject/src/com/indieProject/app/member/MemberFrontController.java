package com.indieProject.app.member;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.ActionForward;
import com.indieProject.app.member.MemberLoginOkAction;

public class MemberFrontController extends HttpServlet{
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		doProcess(req, resp);
	}
	
	protected void doProcess(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		req.setCharacterEncoding("UTF-8");
		
		String requestURI = req.getRequestURI();
		String contextPath = req.getContextPath();
		
		String command = requestURI.substring(contextPath.length());
		
		ActionForward forward = null;
		System.out.println(command);
		if(command.equals("/Home.me")) {
			System.out.println("홈");
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("index.jsp");
			System.out.println("홈2");

		}else if(command.equals("/member/kakaoSignup.me")) {
			
			forward = new ActionForward();
			forward.setRedirect(false);
			req.setAttribute("id", req.getParameter("id"));
			req.setAttribute("name", req.getParameter("name"));
			System.out.println(req.getParameter("id") + " front id");
			System.out.println(req.getParameter("name") + " front name");
			forward.setPath("/app/member/kakaoSignup.jsp");
		} 
		else if(command.equals("/member/MemberCheckIdOk.me")) {
			try {
				forward = new MemberCheckIdOkAction().execute(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/member/MemberJoinOkAction.me")) {
			//회원가입
				try {
					forward=new MemberJoinOkAction().execute(req, resp);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		}else if(command.equals("/member/SignUp.me")) {
			forward =new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/signup.jsp");
		
}		else if(command.equals("/member/SignUpOk.me")) {
					//회원가입 버튼 클릭 
					forward =new ActionForward();
					forward.setRedirect(false);
					forward.setPath("/app/member/signupEnd.jsp");
				
		}else if(command.equals("/member/FindIdPwOk.me")) {
			//아이디비밀번호찾기
			forward =new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/findIdPw.jsp");
		}else if(command.equals("/member/MemberFindIdAction.me")) {
			try {
				forward = new MemberFindIdAction().execute(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if(command.equals("/member/MemberFindPwAction.me")) {
			try {
				forward = new MemberFindPwAction().execute(req, resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/member/MemberEmailCheckOkAction.me")) {
			//이메일 인증 
			try {
				forward=new MemberEamilCheckOkAction().execute(req,resp);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/member/Login.me")) {
			String to = req.getParameter("to");
			int amaNum = 0;
			if(req.getParameter("amaNum") != null) {
				amaNum = Integer.parseInt(req.getParameter("amaNum"));
			}
			System.out.println("taaa:"+amaNum);
			forward = new ActionForward();
			forward.setRedirect(false);
			req.setAttribute("to", to);
			req.setAttribute("amaNum", amaNum);
			forward.setPath("/app/member/login.jsp");
			
		}else if(command.equals("/member/MemberLoginOk.me")) {
			try {
				forward = new MemberLoginOkAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/member/memberMyPage.me")) {
			try {
				forward = new MemberMyPageAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/member/memberChnageInfo.me")) {
			try {
				forward = new MemberChangeInfoAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/member/memberMyPopcorn.me")) {
			try {
				forward = new MemberMyPopcornAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/member/memberMyMovie.me")) {
			try {
				forward = new MemberCheckMyMovieAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/member/memberMyReview.me")) {
			try {
				forward = new MemberCheckMyReviewAction().execute(req, resp);
			} catch (Exception e) {System.out.println(e);}
		}else if(command.equals("/member/memberMyBoard.me")) {
			try {
				forward = new MemberCheckMyBoardAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/member/memberLoadMyBoard.me")) {
			try {
				forward = new MemberLoadMyBoardListOkAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/member/memberMyReply.me")) {
			try {
				forward = new MemberCheckMyReplyAction().execute(req, resp);
			} catch (Exception e) {;}
		}
		else if(command.equals("/member/MemberLogOutAction.me")) {
			try {
				forward = new MemberLogoutAction().execute(req, resp);
			} catch (Exception e) {;}
		}
		else if(command.equals("/member/MemberCheckPwOk.me")) {
			try {
				forward = new MemberCheckPwOkAction().execute(req, resp);
			} catch (Exception e) {;}
		}
		else if(command.equals("/member/MemberChangeInfoOkAction.me")) {
			try {
				forward = new MemberChangeInfoOkAction().execute(req, resp);
			} catch (Exception e) {;}
		}
		else if(command.equals("/member/MemberMyPopcornDateSearchAction.me")) {
			try {
				forward = new MemberMyPopcornDateSearchAction().execute(req, resp);
			} catch (Exception e) {;}
		}
		else if(command.equals("/member/MemberMyPopcornChargeAction.me")) {
			try {
				forward = new MemberMyPopcornChargeAction().execute(req, resp);
			} catch (Exception e) {;}
		}else if(command.equals("/member/MemberCustomerAction.me")) {
			//고객센터
			try {
				forward=new MemberCustomerAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/MemberCustomerOk.me")) {
			forward = new ActionForward();
			forward.setRedirect(false);
			forward.setPath("/app/member/contact.jsp");
			
		}else if(command.equals("/member/MemberLoadMyMovieListOk.me")) {
			try {
				forward = new MemberLoadMyMovieListOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/KakaoJoinOkAction.me")) {
			try {
				forward = new KakaoJoinOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/MemberCheckAccountOk.me")) {
			try {
				forward = new MemberCheckAccountOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/accountRegister.me")) {
			try {
				forward = new ActionForward();
				forward.setRedirect(false);
				forward.setPath("/app/member/accountRegister.jsp");
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/accountRegisterOk.me")) {
			try {
				forward = new MemberAccountRegisterOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/MemberExchangePopcornOk.me")) {
			try {
				forward = new MemberReceivedPopcornAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/memberDrop.me")) {
			try {
				forward = new MemberDropAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}else if(command.equals("/member/memberDeleteMovieOk.me")) {
			try {
				forward = new MemberDeleteMovieOkAction().execute(req, resp);
			} catch (Exception e) {e.printStackTrace();}
		}
		

		if(forward != null) {
			if(forward.isRedirect()) {

				resp.sendRedirect(forward.getPath());
			}else {
				RequestDispatcher dispatcher = req.getRequestDispatcher(forward.getPath());
				dispatcher.forward(req, resp);
			}
		}
		
	}
}

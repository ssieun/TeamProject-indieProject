package com.indieProject.app.manager;

import java.io.PrintWriter;
import java.util.Properties;

import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.indieProject.action.Action;
import com.indieProject.action.ActionForward;
import com.indieProject.app.manager.dao.ManagerDAO;
import com.indieProject.app.member.vo.NaverMailVO;

public class DeleteMovieCancleOkAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		req.setCharacterEncoding("UTF-8");
		resp.setCharacterEncoding("UTF-8");
		
		PrintWriter out = resp.getWriter();
		
		ManagerDAO ma_dao = new ManagerDAO();
		
		String memberId = req.getParameter("memberId");
		int amaNum = Integer.parseInt(req.getParameter("amaNum"));
		String amaTitleKor = req.getParameter("amaTitleKor");
		String noReason = req.getParameter("noReason");
		
		if(ma_dao.deleteMovieNo(amaNum)) {
			System.out.println("영화삭제신청 미승인 성공");
			String memberEmail = ma_dao.getMemberEmail(memberId);
			
			//mail server 설정
			NaverMailVO naverVo = new NaverMailVO();
			String host = "smtp.naver.com";
			String user = naverVo.getEmail(); //자신의 네이버 계정
			String password = naverVo.getPassword();//자신의 네이버 패스워드
			
			//메일 받을 주소
			String to_email = memberEmail;
			
			//SMTP 서버 정보를 설정한다.
			Properties props = new Properties();
			props.put("mail.smtp.host", host);
			props.put("mail.smtp.port", 587);
			props.put("mail.smtp.auth", "true");
			
			Session session = Session.getDefaultInstance(props, new javax.mail.Authenticator() {
				protected PasswordAuthentication getPasswordAuthentication() {
					return new PasswordAuthentication(user,password);
				}
			});
			
			//email 전송
			try {
				MimeMessage msg = new MimeMessage(session);
				msg.setFrom(new InternetAddress(user, "IndieProject"));
				msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to_email));
				
				//메일 제목
				msg.setSubject("[IndieProject] 영화삭제 미승인 안내메일");
				//메일 내용
				msg.setText("고객님의 영화 " + amaTitleKor + "이(가) 삭제 미승인되었습니다.\n사유: "+noReason);
				
				Transport.send(msg);
				System.out.println("이메일 전송완료");
				
			}catch (Exception e) {
				System.out.println("전송 실패");
				e.printStackTrace();// TODO: handle exception    
			}
			
			out.write("ok");
			
		}else {
			out.write("not-ok");
		}
		
		out.close();
		return null;
	}
}

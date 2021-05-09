package com.indieProject.app.member;

import java.io.PrintWriter;
import java.util.Properties;
import java.util.Random;

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
import com.indieProject.app.member.dao.MemberDAO;
import com.indieProject.app.member.vo.NaverMailVO;



public class MemberEamilCheckOkAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest req, HttpServletResponse resp) throws Exception {
	
		String email = req.getParameter("email");
		System.out.println(email+"받아옴");
		MemberDAO m_dao=new MemberDAO();
		PrintWriter out =resp.getWriter();
		resp.setContentType("text/html;charset=utf-8");
		
		if(m_dao.checkEmail(email)) {
			//중복된 이메일
			out.print("no");
			System.out.println("중복된 이메일");
		}else {
			//사용가능한 이메일
			 System.out.println("사용가능한 이메일");
			
            //mail server 설정
			NaverMailVO naverVo = new NaverMailVO();
            String host = "smtp.naver.com";
            String user = naverVo.getEmail(); //자신의 네이버 계정
            String password = naverVo.getPassword();//자신의 네이버 패스워드
            
            //메일 받을 주소
            String to_email = email;
            
            //SMTP 서버 정보를 설정한다.
            Properties props = new Properties();
            props.put("mail.smtp.host", host);
            props.put("mail.smtp.port", 587);
            props.put("mail.smtp.auth", "true");
       
            
            //인증 번호 생성기
            StringBuffer temp =new StringBuffer();
            Random rnd = new Random();
            
            for(int i=0;i<10;i++){
                int rIndex = rnd.nextInt(3);
                switch (rIndex) {
                case 0:
                    // a-z
                    temp.append((char) ((int) (rnd.nextInt(26)) + 97));
                    break;
                case 1:
                    // A-Z
                    temp.append((char) ((int) (rnd.nextInt(26)) + 65));
                    break;
                case 2:
                    // 0-9
                    temp.append((rnd.nextInt(10)));
                    break;
                }
            }
            String AuthenticationKey = temp.toString();
            System.out.println(AuthenticationKey);
            
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
                msg.setSubject("안녕하세요 IndieProject 인증 메일입니다.");
                //메일 내용
                msg.setText("인증 번호 :"+temp);
                
                Transport.send(msg);
                System.out.println("이메일 전송완료");
                
            }catch (Exception e) {
                e.printStackTrace();// TODO: handle exception    
		}
          out.print(temp);		
          System.out.println(temp+"받아옴");
	}//else end
		return null;

	}
}
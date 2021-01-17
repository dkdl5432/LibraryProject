package service;

import java.util.Random;

import javax.mail.internet.MimeMessage;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

@Service("member_service")
public class MemberService {
	
	
	//이메일 보내기 --------------------------------------------
	@Autowired
	private JavaMailSenderImpl mailSender;
	
	private int size;
	//인증키 생성
	private String getKey(int size) {
        this.size = size;
        return getAuthCode();
    }
	//인증코드 난수 발생
    private String getAuthCode() {
        Random random = new Random();
        StringBuffer buffer = new StringBuffer();
        int num = 0;

        while(buffer.length() < size) {
            num = random.nextInt(10);
            buffer.append(num);
        }

        return buffer.toString();
    }
	//이메일 보내기
    public String sendAuthMail(String email) {
        //6자리 난수 인증번호 생성
        String authKey = getKey(6);

        //인증메일 보내기
        // 메일 제목, 내용
     	String subject = "[두루미 도서관] 이메일 인증 번호입니다. ";
     	String content = "이메일 인증을 완료해 주세요."
     			+ "\n"
     			+ "두루미 도서관의 회원이 되시는 걸 진심으로 환영합니다."
     			+ "\n"
     			+ "이메일 인증을 완료하셔야 정상적으로 진행이 가능합니다.\n"
     			+ "앞으로 두루미 도서관 서비스에 많은 관심과 사랑 부탁 드립니다.\n"
     			+ "\n"
     			+ "인증번호 :" + authKey
     			+ "\n감사합니다.";
     			
     	// 보내는 사람
     	String from = "chounsa5555@naver.com";
     				
     	try {
     		// 메일 내용 넣을 객체와, 이를 도와주는 Helper 객체 생성
     		MimeMessage mail = mailSender.createMimeMessage();
     		MimeMessageHelper mailHelper = new MimeMessageHelper(mail, "UTF-8");

     		// 메일 내용을 채워줌
     		mailHelper.setFrom(from);	// 보내는 사람 셋팅
     		mailHelper.setTo(email);		// 받는 사람 셋팅
     		mailHelper.setSubject(subject);	// 제목 셋팅
     		mailHelper.setText(content);	// 내용 셋팅

     		// 메일 전송
     		mailSender.send(mail);
     					
     	} catch(Exception e) {
     		e.printStackTrace();
     	}

         return authKey;
    }
    
    
    
}

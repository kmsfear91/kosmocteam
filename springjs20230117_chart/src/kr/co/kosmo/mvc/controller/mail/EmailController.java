package kr.co.kosmo.mvc.controller.mail;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.mail.javamail.MimeMessagePreparator;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mail")
public class EmailController {

	static final String emailFromRecipient = "ejwon7@naver.com";

	@Autowired
	private JavaMailSenderImpl mailSender;

	@GetMapping(value = "/emailForm")
	public String emailForm() {
		return "mail/emailForm";
	}

	@PostMapping(value = "/sendEmail")
	public ModelAndView sendEmailToClient(HttpServletRequest request) {
		/*
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		// 메일 전송을 시작하는 메서드에게 데이터를 입력
		mailSender.setUsername(email);
		mailSender.setPassword(password);
		*/
		StringBuffer sb = new StringBuffer();
		for (int i = 0; i < 6; i++) {
			sb.append((int) (Math.random() * 10));
		}
		String random = sb.toString();
		/*
		mailSender.send(new MimeMessagePreparator() {
			@Override
			public void prepare(MimeMessage mimeMessage) throws Exception {
				MimeMessageHelper mimeMsgHelperObj = new MimeMessageHelper(mimeMessage, true, "UTF-8");
				mimeMsgHelperObj.setTo(email);
				mimeMsgHelperObj.setFrom(email);
				mimeMsgHelperObj.setText(random);
				mimeMsgHelperObj.setSubject("인증번호");
			}
		});
		System.out.println("\n 메일 전송 성공 \n");
		*/
		System.out.println(random);
		ModelAndView mav = new ModelAndView("mail/emailForm", "certnum", random);
		return mav;
	}

	@PostMapping(value = "/certification")
	public ModelAndView certification(HttpServletRequest request) {
		String num = request.getParameter("num");
		String certnum = request.getParameter("certnum");
		String msg = null;
		if (num.equals(certnum)) {
			msg = "인증성공!";
		} else {
			msg = "인증실패.";
		}
		ModelAndView mav = new ModelAndView("mail/result", "msg", msg);
		return mav;
	}
}

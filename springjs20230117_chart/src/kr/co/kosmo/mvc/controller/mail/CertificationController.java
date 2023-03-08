package kr.co.kosmo.mvc.controller.mail;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class CertificationController {

	@RequestMapping(value = "/certificationCheck")
	public int certification(String num, String certnum) {
		System.out.println("num" + num);
		System.out.println("certnum" + certnum);
		int cnt = 0;
		if (certnum.isEmpty() || certnum == null) {
			cnt = 1;
		} else {
			if (num.isEmpty() || num == null) {
				cnt = 2;
			} else {
				if (num.equals(certnum)) {
					cnt = 4;
				} else {
					cnt = 3;
				}
			}
		}
		return cnt;
	}
}
package kr.co.kosmo.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TodayDefaultController {

	// Aoprk ����Ǿ /mian/index.jsp���� ${today} ��밡��!
	@RequestMapping(value = { "/", "/main" })
	public String todayView() {
		return "main/index";
	}
}

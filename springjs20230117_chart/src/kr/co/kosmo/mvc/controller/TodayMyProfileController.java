package kr.co.kosmo.mvc.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class TodayMyProfileController {

	@RequestMapping(value = "/myprofile", method = RequestMethod.GET)
	public ModelAndView todayProfile() {
		ModelAndView mav = new ModelAndView("today/todayProfile");
		mav.addObject("profile", "���� �������� ��浿�̴�!");
		return mav;
	}

	@RequestMapping(value = "/todaywk", method = RequestMethod.GET)
	public ModelAndView todayWork() {
		ModelAndView mav = new ModelAndView("today/todayWork");
		mav.addObject("work", "��û ���� �۾��Դϴ�. ��¥�� �����ϼ���");
		return mav;
	}
}

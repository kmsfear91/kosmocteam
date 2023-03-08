package kr.co.kosmo.mvc.advice;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.AfterReturning;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestAttribute;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
/*
 * �Ϲ����� bean���� ��ĵ ���ؼ� ��ϵ�!
 * */
import org.springframework.web.servlet.ModelAndView;

@Component
@Aspect
public class TodayAdvice {

	// ���� ���� ������ �����ΰ�? => ��¥
	// target ? =>
	@Before("execution(* kr.co.kosmo.mvc.controller.TodayMy*.today*(..))")
	public void todayAdviceMethod() {
		String todate = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
		System.out.println("==Todate==");
		System.out.println(todate);
	}

	@AfterReturning(pointcut = "execution(* kr.co.kosmo.mvc.controller.Today*.today*(..))", returning = "mav")
	public ModelAndView afterToday(JoinPoint jp, ModelAndView mav) {
		// RequestContextHolder ����ؼ� HttpServletRequest �޾Ƽ� ������� �����Ǹ� �α��غ���
		ServletRequestAttributes ra = (ServletRequestAttributes) RequestContextHolder.currentRequestAttributes();
		HttpServletRequest request = ra.getRequest();
		mav.addObject("reip", request.getRemoteAddr());
		System.out.println("reip=>" + request.getRemoteAddr());
		mav.addObject("today", new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		return mav;
	}
}
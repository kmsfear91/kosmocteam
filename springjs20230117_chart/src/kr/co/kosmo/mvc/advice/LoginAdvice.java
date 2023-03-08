package kr.co.kosmo.mvc.advice;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.ModelAndView;

import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.vo.MyLoginLoggerDTO;

@Component
@Aspect
public class LoginAdvice {

	private String userAgent;

	@Autowired
	private MemberDaoInter memberDaoInter;

	@Around("execution(* kr.co.kosmo.mvc.controller.login.LoginCheckController.loginf*(..))")
	public ModelAndView loginLogger(ProceedingJoinPoint pjp) {
		// System.out.println("동작1!");
		ModelAndView rpath = null;
		// step1) 메서드의 이름을 가져와서 로그인과 로그아웃을 구별한다.
		String methodName = pjp.getSignature().getName();
		// System.out.println("MethodName : " + methodName);
		// step2) Joinpoint로 부터 타겟 객체의 메서드의 인자값 받아오기
		Object[] fd = pjp.getArgs();
		// for (Object e : fd) {
		// System.out.println(e.getClass().getName());
		// }
		if (methodName.equals("loginfProcess")) {
			try {
				rpath = (ModelAndView) pjp.proceed(); // login 메서드를 호출
			} catch (Throwable e) {
				e.printStackTrace();
			}
			// getArgs : 세션, request, DTO, userAgent - 4개
			HttpSession session = (HttpSession) fd[0];
			userAgent = (String) fd[3];
			String reip = ((HttpServletRequest) fd[1]).getRemoteAddr();
			String uid = (String) session.getAttribute("sessionID");
			// System.out.println("Agent : " + userAgent);
			// System.out.println("reip : " + reip);
			// System.out.println("uid : " + uid);
			// 로그인 정보를 데이터베이스에 저장하기
			MyLoginLoggerDTO vo = new MyLoginLoggerDTO();
			vo.setIdn(uid);
			vo.setStatus("login");
			vo.setReip(reip);
			vo.setUagent(userAgent);
			memberDaoInter.addLoginLogging(vo);
		} else if (methodName.equals("loginfoutProcess")) {
			// getArgs : 세션, request - 2개
			HttpSession session = (HttpSession) fd[0];
			String reip = ((HttpServletRequest) fd[1]).getRemoteAddr();
			String uid = (String) session.getAttribute("sessionID");
			// 로그아웃 정보를 데이터베이스에 저장하기
			MyLoginLoggerDTO vo = new MyLoginLoggerDTO();
			vo.setIdn(uid);
			vo.setStatus("logout");
			vo.setReip(reip);
			vo.setUagent(userAgent);
			memberDaoInter.addLoginLogging(vo);
			try {
				rpath = (ModelAndView) pjp.proceed(); // logout 메서드를 호출
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		System.out.println("어드바이스 동작 완료");
		return rpath;
	}
}

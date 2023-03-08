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
		// System.out.println("����1!");
		ModelAndView rpath = null;
		// step1) �޼����� �̸��� �����ͼ� �α��ΰ� �α׾ƿ��� �����Ѵ�.
		String methodName = pjp.getSignature().getName();
		// System.out.println("MethodName : " + methodName);
		// step2) Joinpoint�� ���� Ÿ�� ��ü�� �޼����� ���ڰ� �޾ƿ���
		Object[] fd = pjp.getArgs();
		// for (Object e : fd) {
		// System.out.println(e.getClass().getName());
		// }
		if (methodName.equals("loginfProcess")) {
			try {
				rpath = (ModelAndView) pjp.proceed(); // login �޼��带 ȣ��
			} catch (Throwable e) {
				e.printStackTrace();
			}
			// getArgs : ����, request, DTO, userAgent - 4��
			HttpSession session = (HttpSession) fd[0];
			userAgent = (String) fd[3];
			String reip = ((HttpServletRequest) fd[1]).getRemoteAddr();
			String uid = (String) session.getAttribute("sessionID");
			// System.out.println("Agent : " + userAgent);
			// System.out.println("reip : " + reip);
			// System.out.println("uid : " + uid);
			// �α��� ������ �����ͺ��̽��� �����ϱ�
			MyLoginLoggerDTO vo = new MyLoginLoggerDTO();
			vo.setIdn(uid);
			vo.setStatus("login");
			vo.setReip(reip);
			vo.setUagent(userAgent);
			memberDaoInter.addLoginLogging(vo);
		} else if (methodName.equals("loginfoutProcess")) {
			// getArgs : ����, request - 2��
			HttpSession session = (HttpSession) fd[0];
			String reip = ((HttpServletRequest) fd[1]).getRemoteAddr();
			String uid = (String) session.getAttribute("sessionID");
			// �α׾ƿ� ������ �����ͺ��̽��� �����ϱ�
			MyLoginLoggerDTO vo = new MyLoginLoggerDTO();
			vo.setIdn(uid);
			vo.setStatus("logout");
			vo.setReip(reip);
			vo.setUagent(userAgent);
			memberDaoInter.addLoginLogging(vo);
			try {
				rpath = (ModelAndView) pjp.proceed(); // logout �޼��带 ȣ��
			} catch (Throwable e) {
				e.printStackTrace();
			}
		}
		System.out.println("�����̽� ���� �Ϸ�");
		return rpath;
	}
}

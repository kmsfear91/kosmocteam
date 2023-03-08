package kr.co.kosmo.mvc.controller.survey;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kosmo.mvc.controller.service.SurveyService;
import kr.co.kosmo.mvc.vo.SurveyContentVO;
import kr.co.kosmo.mvc.vo.SurveyVO;

@Controller
@RequestMapping("/survey")
public class SurveyController {

	@Autowired
	private SurveyService surveyService;

	@GetMapping(value = "/surveyForm")
	public String surveyForm() {
		return "survey/surveyAddForm";
	}

	@PostMapping(value = "/addSurvey")
	public String surveyAdd(SurveyVO vo, HttpServletRequest request) {
		// ���� �̸����� �Ѿ���� �Ķ���ʹ� �迭�� ���� �� �ִ�.
		String[] surveytitle = request.getParameterValues("surveytitle");

		// DB�� �����ϱ� ���� List �����
		List<SurveyContentVO> list = new ArrayList<SurveyContentVO>();

		char stype = 'A';

		for (String e : surveytitle) {
			SurveyContentVO sv = new SurveyContentVO();
			sv.setSurveytitle(e);
			sv.setSurveycnt(0);
			sv.setSubtype(String.valueOf(stype));
			// System.out.println("surveyTitle" + e);
			list.add(sv);
			stype++; // ���ĺ��� ����
		}
		// System.out.println("Sub => " + vo.getSub());
		// SurveyVO�� ���� Ÿ��Ʋ�� ������ List<SurveyContentVO> ���ڷ� ����
		vo.setSurvey(list);
		// Service�� ���� �����Ѵ�.
		surveyService.addSurvey(vo, list);
		return "redirect:surveyList";
	}

	@RequestMapping(value = "/surveyList")
	public String surveyList(Model model) {
		model.addAttribute("list", surveyService.listSurvey());
		return "survey/surveyList";
	}

	@GetMapping(value = "/surveyDetail")
	public String surveyDetail(Model model, int num) {
		model.addAttribute("vo", surveyService.adminDetail(num));
		return "survey/surveyClientDetail";
	}

	@GetMapping(value = "/surveyAdminDetail")
	public String surveyAdminDetail(Model model, int num) {
		model.addAttribute("vo", surveyService.adminDetail(num));
		return "survey/surveyDetail";
	}

	@PostMapping(value = "/addSurveyClient")
	public String clientSurveyAdd(Model model, SurveyContentVO vo) {
		surveyService.updateSurveyCnt(vo);
		return "redirect:surveyList";
	}
}

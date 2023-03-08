package kr.co.kosmo.mvc.controller.chart;

import java.util.Map;

import org.apache.commons.collections.map.HashedMap;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.kosmo.mvc.controller.service.SurveyService;
import kr.co.kosmo.mvc.vo.SurveyContentVO;
import kr.co.kosmo.mvc.vo.SurveyVO;

@RestController
public class ServeyRestController {

	@Autowired
	private SurveyService surveyService;

	@RequestMapping(value = "/surveyJsonObjDemo")
	public SurveyVO surveyDetail(int num) {
		SurveyVO vo = surveyService.adminDetail(num);
		return vo;
	}

	@RequestMapping(value = "/surveyJsonObjDemo", produces = "application/json;charset=utf-8")
	public Map<String, Integer> surveyDetailJsonDemo(int num) {
		SurveyVO vo = surveyService.adminDetail(num);
		// ket, value => Map
		Map<String, Integer> map = new HashedMap();
		for (SurveyContentVO e : vo.getSurvey()) {
			// '비가 옵니다': 500,
			map.put(e.getSurveytitle(), e.getSurveycnt());
		}
		return map;
	}

	@RequestMapping(value = "/surveyJsonObj", produces = "application/json;charset=utf-8")
	public String surveyDetailJson(int num) {
		SurveyVO vo = surveyService.adminDetail(num);
		Map<String, Integer> map = new HashedMap();
		for (SurveyContentVO e : vo.getSurvey()) {
			// '비가 옵니다': 500,
			map.put(e.getSurveytitle(), e.getSurveycnt());
		}
		// JSON 결과를 문자열로 반환
		String result = null;
		// ObjectMapper 객체를 가지고 반환을 할 수 있다.
		ObjectMapper mapper = new ObjectMapper();
		try {
			// map -> {"모릅니다": 666, ..... "비가 옵니다": 500}
			result = mapper.writeValueAsString(map);
			// [{"sub":"내일 날씨는 어떨까요?"}, map]
			result = "[{\"sub\":\"" + vo.getSub() + "\"}, " + result + "]";
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
}

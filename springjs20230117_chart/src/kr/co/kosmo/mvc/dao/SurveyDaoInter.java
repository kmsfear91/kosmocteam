package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.vo.SurveyContentVO;
import kr.co.kosmo.mvc.vo.SurveyVO;

public interface SurveyDaoInter {

	public void addSurvey(SurveyVO vo);

	public void addSurveyContent(List<SurveyContentVO> list);
	
	public List<SurveyVO> listSurvey();

	public SurveyVO adminDetail(int num);
	
	public void updateSurveyCnt(SurveyContentVO vo);
}

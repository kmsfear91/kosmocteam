package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.vo.SurveyContentVO;
import kr.co.kosmo.mvc.vo.SurveyVO;

@Repository
public class SurveyDao implements SurveyDaoInter {

	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addSurvey(SurveyVO vo) {
		ss.insert("survey.add", vo);
	}

	@Override
	public void addSurveyContent(List<SurveyContentVO> list) {
		ss.insert("survey.addcontent", list);
	}

	@Override
	public List<SurveyVO> listSurvey() {
		return ss.selectList("survey.list");
	}

	@Override
	public SurveyVO adminDetail(int num) {
		return ss.selectOne("survey.adminDetail", num);
	}

	@Override
	public void updateSurveyCnt(SurveyContentVO vo) {
		ss.update("survey.updateSurveyCnt", vo);
	}
}

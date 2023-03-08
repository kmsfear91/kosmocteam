package kr.co.kosmo.mvc.vo;

import java.util.List;

public class SurveyVO {

	private int num, code, surveytotal;
	private String sub, sdate;
	private List<SurveyContentVO> survey;

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getSub() {
		return sub;
	}

	public void setSub(String sub) {
		this.sub = sub;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public List<SurveyContentVO> getSurvey() {
		return survey;
	}

	public void setSurvey(List<SurveyContentVO> survey) {
		this.survey = survey;
	}

	public int getSurveytotal() {
		return surveytotal;
	}

	public void setSurveytotal(int surveytotal) {
		this.surveytotal = surveytotal;
	}
}

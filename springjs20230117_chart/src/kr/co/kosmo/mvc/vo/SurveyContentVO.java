package kr.co.kosmo.mvc.vo;

public class SurveyContentVO {

	private int subcode, surveycnt;
	private String subtype, surveytitle;

	public int getSubcode() {
		return subcode;
	}

	public void setSubcode(int subcode) {
		this.subcode = subcode;
	}

	public int getSurveycnt() {
		return surveycnt;
	}

	public void setSurveycnt(int surveycnt) {
		this.surveycnt = surveycnt;
	}

	public String getSubtype() {
		return subtype;
	}

	public void setSubtype(String subtype) {
		this.subtype = subtype;
	}

	public String getSurveytitle() {
		return surveytitle;
	}

	public void setSurveytitle(String surveytitle) {
		this.surveytitle = surveytitle;
	}
}

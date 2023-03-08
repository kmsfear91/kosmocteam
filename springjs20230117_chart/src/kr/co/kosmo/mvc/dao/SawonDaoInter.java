package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.vo.DeptVO;
import kr.co.kosmo.mvc.vo.SawonVO;

public interface SawonDaoInter {

	public DeptVO getDeptList(int deptno);

	public List<SawonVO> getSawonPhoneList();
}

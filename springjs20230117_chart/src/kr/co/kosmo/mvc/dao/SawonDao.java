package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.vo.DeptVO;
import kr.co.kosmo.mvc.vo.SawonVO;

@Repository
public class SawonDao implements SawonDaoInter {

	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public DeptVO getDeptList(int deptno) {
		return ss.selectOne("ksawon.deptList", deptno);
	}

	@Override
	public List<SawonVO> getSawonPhoneList() {
		return ss.selectList("ksawon.sawonList");
	}
}

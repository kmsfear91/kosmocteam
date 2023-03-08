package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.vo.MemberDTO;
import kr.co.kosmo.mvc.vo.MyLoginLoggerDTO;
import kr.co.kosmo.mvc.vo.PageSearchDTO;

// Dao���� @Repository ��� -> Dao�� ������ ��Ͻ����ش�
// �⺻���� �̱������� �����ȴ�
@Repository
public class MemberDao implements MemberDaoInter {

	@Autowired
	private SqlSessionTemplate ss;
	// kosmo-web.xml���� byname�ϱ� ���ؼ� SqlSessionTemplate bean�� id�� ss�� ������!

	// SqlSession ss = SqlSessionFactory.getFactory().openSesseion(); ��� ���ִ� ������
	// <bean id="ss" class="ord.mybatis.spring.SqlSessionTemplate">
	// ���� ����ϱ� ���ؼ��� DI�� ���� �޾ƾ� �ϹǷ�, ��� ���� ���� �� @Autowired !

	@Override
	public void addMember(MemberDTO dto) {
		ss.insert("member.add", dto);
		// ss.commit();
		// ss.close(); ���ص� �ȴ�!!!!!!!!!!
	}

	@Override
	public int idcheck(String id) {
		int num = ss.selectOne("member.idchk", id);
		return num;
	}

	@Override
	public MemberDTO loginCheck(MemberDTO vo) {
		return ss.selectOne("member.login", vo);
	}

	@Override
	public void addLoginLogging(MyLoginLoggerDTO vo) {
		ss.insert("member.logger_in", vo);
	}

	@Override
	public List<MemberDTO> listMember(PageSearchDTO pvo) {
		return ss.selectList("member.listpage", pvo);
	}

	@Override
	public int getCnt(PageSearchDTO pvo) {
		return ss.selectOne("member.totalCount", pvo);
	}

	@Override
	public List<MemberDTO> jsonDemo(String id) {
		return ss.selectList("member.jsonDemo", id);
	}

	@Override
	public List<MemberDTO> listMember() {
		return ss.selectList("member.list");
	}
}

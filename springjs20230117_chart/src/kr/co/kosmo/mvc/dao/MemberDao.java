package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.vo.MemberDTO;
import kr.co.kosmo.mvc.vo.MyLoginLoggerDTO;
import kr.co.kosmo.mvc.vo.PageSearchDTO;

// Dao단은 @Repository 사용 -> Dao를 빈으로 등록시켜준다
// 기본으로 싱글톤으로 생성된다
@Repository
public class MemberDao implements MemberDaoInter {

	@Autowired
	private SqlSessionTemplate ss;
	// kosmo-web.xml에서 byname하기 위해서 SqlSessionTemplate bean의 id를 ss로 맞춰줌!

	// SqlSession ss = SqlSessionFactory.getFactory().openSesseion(); 대신 해주는 설정은
	// <bean id="ss" class="ord.mybatis.spring.SqlSessionTemplate">
	// 빈을 사용하기 위해서는 DI를 주입 받아야 하므로, 멤버 변수 설정 후 @Autowired !

	@Override
	public void addMember(MemberDTO dto) {
		ss.insert("member.add", dto);
		// ss.commit();
		// ss.close(); 안해도 된다!!!!!!!!!!
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

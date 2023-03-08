package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.vo.MemberDTO;
import kr.co.kosmo.mvc.vo.MyLoginLoggerDTO;
import kr.co.kosmo.mvc.vo.PageSearchDTO;

public interface MemberDaoInter {

	// 응집도를 낮추기 위해서 interface를 사용
	public void addMember(MemberDTO dto);

	public int idcheck(String id);

	public MemberDTO loginCheck(MemberDTO dto);

	// AOP에서 사용될 login로깅 처리를 위한 메서드
	public void addLoginLogging(MyLoginLoggerDTO vo);

	public List<MemberDTO> listMember();

	public List<MemberDTO> listMember(PageSearchDTO pvo);

	public int getCnt(PageSearchDTO pvo);

	// json
	public List<MemberDTO> jsonDemo(String id);
}

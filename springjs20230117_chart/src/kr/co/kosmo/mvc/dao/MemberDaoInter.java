package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.vo.MemberDTO;
import kr.co.kosmo.mvc.vo.MyLoginLoggerDTO;
import kr.co.kosmo.mvc.vo.PageSearchDTO;

public interface MemberDaoInter {

	// �������� ���߱� ���ؼ� interface�� ���
	public void addMember(MemberDTO dto);

	public int idcheck(String id);

	public MemberDTO loginCheck(MemberDTO dto);

	// AOP���� ���� login�α� ó���� ���� �޼���
	public void addLoginLogging(MyLoginLoggerDTO vo);

	public List<MemberDTO> listMember();

	public List<MemberDTO> listMember(PageSearchDTO pvo);

	public int getCnt(PageSearchDTO pvo);

	// json
	public List<MemberDTO> jsonDemo(String id);
}

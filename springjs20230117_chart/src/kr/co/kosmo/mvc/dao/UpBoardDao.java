package kr.co.kosmo.mvc.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.kosmo.mvc.vo.PageSearchDTO;
import kr.co.kosmo.mvc.vo.UpBoardDTO;

// upBoardDao => byName, alias 설정으로 byName하기
@Repository("upBoardList")
public class UpBoardDao implements UpBoardDaoInter {

	@Autowired
	private SqlSessionTemplate ss;

	@Override
	public void addUpBoard(UpBoardDTO vo) {
		ss.insert("upboard.add", vo);
	}

	@Override
	public int getCnt(PageSearchDTO vo) {
		return ss.selectOne("upboard.totalCount", vo);
	}

	@Override
	public List<UpBoardDTO> listUpBoard(PageSearchDTO vo) {
		return ss.selectList("upboard.listpage", vo);
	}

	@Override
	public UpBoardDTO detailUpBoard(int num) {
		return ss.selectOne("upboard.detail", num);
	}

	@Override
	public void deleteUpBoard(int num) {
		ss.delete("upboard.delete", num);
	}

	@Override
	public void updateUpBoard(UpBoardDTO vo) {

	}
}

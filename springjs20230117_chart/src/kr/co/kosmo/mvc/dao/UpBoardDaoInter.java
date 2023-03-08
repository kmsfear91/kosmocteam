package kr.co.kosmo.mvc.dao;

import java.util.List;

import kr.co.kosmo.mvc.vo.PageSearchDTO;
import kr.co.kosmo.mvc.vo.UpBoardDTO;

public interface UpBoardDaoInter {

	public void addUpBoard(UpBoardDTO vo);

	public int getCnt(PageSearchDTO vo);

	public List<UpBoardDTO> listUpBoard(PageSearchDTO vo);

	public UpBoardDTO detailUpBoard(int num);

	public void updateUpBoard(UpBoardDTO vo);

	public void deleteUpBoard(int num);
}

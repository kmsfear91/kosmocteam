package mobile.kosmo.mvc.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kosmo.mvc.vo.PageSearchDTO;
import kr.co.kosmo.mvc.vo.UpBoardDTO;
import mobile.kosmo.mvc.dao.UpBoardDao;

@Controller
public class DefaultMobileController {

	@Autowired
	public UpBoardDao upBoardList;

	private int nowPage = 1; // ���� ������ �� -> �޴� �������� �����Ǵ� ����
	private int nowBlock = 1; // ���� �� -> [][][][][] -> 1block
	private int totalRecord; // �� �Խù� ��, Dao�� ���� �޴´�.
	private int numPerPage = 10; // �� �������� ������ �Խù� ��
	private int pagePerBlock = 5; // �� ��ϴ� ������ ������ ��
	private int totalPage; // ��ü ������ �� => totalRecord/numPerPage
	private int totalBlock; // ��ü ��� ��
	private int beginPerPage; // �� �������� ���� �Խù��� index��
	private int endPerPage; // �� �������� ������ �Խù��� index��

	@RequestMapping(value = { "/", "/main" })
	public String defaultMPage(Model model, String cPage, PageSearchDTO pvo) {
		totalRecord = upBoardList.getCnt(pvo);
		totalPage = (int) Math.ceil(totalRecord / (double) numPerPage);
		totalBlock = (int) Math.ceil((double) totalPage / pagePerBlock);
		if (cPage != null) {
			nowPage = Integer.parseInt(cPage);
		}
		beginPerPage = (nowPage - 1) * numPerPage + 1;
		endPerPage = (beginPerPage - 1) + numPerPage;
		int startPage = (int) ((nowPage - 1) / pagePerBlock) * pagePerBlock + 1;
		int endPage = startPage + pagePerBlock - 1;
		if (endPage > totalPage) {
			endPage = totalPage;
		}
		pvo.setBegin(beginPerPage);
		pvo.setEnd(endPerPage);
		List<UpBoardDTO> list = upBoardList.listUpBoard(pvo);
		model.addAttribute("list", list);
		model.addAttribute("searchType", pvo.getSearchType());
		model.addAttribute("searchValue", pvo.getSearchValue());
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pagePerBlock", pagePerBlock);
		model.addAttribute("totalPage", totalPage);
		return "index";
	}
}

package kr.co.kosmo.mvc.controller.chart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.vo.MemberDTO;
import kr.co.kosmo.mvc.vo.PageSearchDTO;

@Controller
@RequestMapping("/mychart")
public class ChartController {

	@Autowired
	private MemberDaoInter memberDaoInter;

	private int nowPage = 1; // ���� ������ �� -> �޴� �������� �����Ǵ� ����
	private int nowBlock = 1; // ���� �� -> [][][][][] -> 1block
	private int totalRecord; // �� �Խù� ��, Dao�� ���� �޴´�.
	private int numPerPage = 10; // �� �������� ������ �Խù� ��
	private int pagePerBlock = 5; // �� ��ϴ� ������ ������ ��
	private int totalPage; // ��ü ������ �� => totalRecord/numPerPage
	private int totalBlock; // ��ü ��� ��
	private int beginPerPage; // �� �������� ���� �Խù��� index��
	private int endPerPage; // �� �������� ������ �Խù��� index��

	@GetMapping(value = "/studentChart")
	public String studentChart() {
		return "chart/studentChart";
	}

	@GetMapping(value = "/weatherChart")
	public String weatherChart() {
		return "chart/weatherChart";
	}

	@RequestMapping(value = "/memberJsonDemo")
	public String memberJson(Model model, String cPage, PageSearchDTO pvo) {
		totalRecord = memberDaoInter.getCnt(pvo);
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
		List<MemberDTO> list = memberDaoInter.listMember(pvo);
		model.addAttribute("list", list);
		model.addAttribute("searchType", pvo.getSearchType());
		model.addAttribute("searchValue", pvo.getSearchValue());
		model.addAttribute("nowPage", nowPage);
		model.addAttribute("startPage", startPage);
		model.addAttribute("endPage", endPage);
		model.addAttribute("pagePerBlock", pagePerBlock);
		model.addAttribute("totalPage", totalPage);
		return "chart/memberJsonDemo";
	}

	@GetMapping(value = "/jsonChart")
	public String jsonChart(@ModelAttribute(value = "num") int num) {
		return "chart/jsonChart";
	}
}

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

	private int nowPage = 1; // 현재 페이지 값 -> 메뉴 페이지와 연동되는 변수
	private int nowBlock = 1; // 현재 블럭 -> [][][][][] -> 1block
	private int totalRecord; // 총 게시물 수, Dao로 부터 받는다.
	private int numPerPage = 10; // 한 페이지당 보여질 게시물 수
	private int pagePerBlock = 5; // 한 블록당 보여질 페이지 수
	private int totalPage; // 전체 페이지 수 => totalRecord/numPerPage
	private int totalBlock; // 전체 블록 수
	private int beginPerPage; // 각 페이지별 시작 게시물의 index값
	private int endPerPage; // 각 페이지별 마지막 게시물의 index값

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

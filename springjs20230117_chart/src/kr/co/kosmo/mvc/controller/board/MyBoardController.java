package kr.co.kosmo.mvc.controller.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kosmo.mvc.dao.MyBoardDaoInter;
import kr.co.kosmo.mvc.vo.BoardVO;

@Controller
@RequestMapping("/mboard")
public class MyBoardController {

	@Autowired
	private MyBoardDaoInter myboardDaoInter;

	// 1 boardForm
	@GetMapping(value = "/boardForm")
	public String boardForm() {
		return "board/boardForm";
	}

	// 2. boardIn
	@PostMapping(value = "/boardIn")
	public String boardIn(BoardVO vo) {
		myboardDaoInter.addBoard(vo);
		return "redirect:boardList";
	}

	// 3. boardList
	@GetMapping(value = "/boardList")
	public String boardList(Model model) {
		model.addAttribute("list", myboardDaoInter.listBoard());
		return "board/boardList";
	}

	@GetMapping(value = "/boardDetail")
	public String boardDetail(Model model, int num) {
		model.addAttribute("vo", myboardDaoInter.detailBoard(num));
		return "board/boardDetail";
	}

	@GetMapping(value = "/boardDelete")
	public String boardDelete(int num) {
		myboardDaoInter.deleteBoard(num);
		return "redirect:boardList";
	}

	@GetMapping(value = "/boardUpdateForm")
	public String boardUpdateForm(Model model, int num) {
		model.addAttribute("vo", myboardDaoInter.detailBoard(num));
		return "board/boardUpdateForm";
	}

	@PostMapping(value = "/boardUpdate")
	public String boardUpdate(Model model, BoardVO vo) {
		myboardDaoInter.updateBoard(vo);
		return "redirect:boardDetail?num=" + vo.getNum();
	}
}

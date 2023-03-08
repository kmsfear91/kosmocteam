package kr.co.kosmo.mvc.controller.sawon;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kosmo.mvc.dao.SawonDaoInter;
import kr.co.kosmo.mvc.vo.DeptVO;
import kr.co.kosmo.mvc.vo.SawonVO;

@Controller
@RequestMapping(value = "/ksawon")
public class KSawonController {

	@Autowired
	private SawonDaoInter sawonDaoInter;

	@GetMapping(value = "/deptForm")
	public String deptForm() {
		return "sawon/deptChooseForm";
	}

	@PostMapping(value = "/deptList")
	public String deptList(Model model, int deptno) {
		DeptVO vo = sawonDaoInter.getDeptList(deptno);
		model.addAttribute("vo", vo);
		return "sawon/deptList";
	}

	@GetMapping(value = "/sPhoneList")
	public String sawonList(Model model) {
		List<SawonVO> list = sawonDaoInter.getSawonPhoneList();
		model.addAttribute("splist", list);
		return "sawon/sawonPhoneList";
	}
}

package kr.co.kosmo.mvc.controller.upload;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.kosmo.mvc.dao.UpBoardDaoInter;
import kr.co.kosmo.mvc.vo.PageSearchDTO;
import kr.co.kosmo.mvc.vo.UpBoardDTO;

@Controller
@RequestMapping("/upload")
public class UploadDemoController {

	@Autowired
	private UpBoardDaoInter upboardDaoInter;

	private int nowPage = 1; // ���� ������ �� -> �޴� �������� �����Ǵ� ����
	// private int nowBlock = 1; // ���� �� -> [][][][][] -> 1block
	private int totalRecord; // �� �Խù� ��, Dao�� ���� �޴´�.
	private int numPerPage = 10; // �� �������� ������ �Խù� ��
	private int pagePerBlock = 5; // �� ��ϴ� ������ ������ ��
	private int totalPage; // ��ü ������ �� => totalRecord/numPerPage
	private int totalBlock; // ��ü ��� ��
	private int beginPerPage; // �� �������� ���� �Խù��� index��
	private int endPerPage; // �� �������� ������ �Խù��� index��

	@GetMapping(value = "/upboardForm")
	public String upBoardForm() {
		return "updemo/upForm";
	}

	@PostMapping(value = "/uploadpro")
	public String uploadFile(Model model, UpBoardDTO vo, HttpServletRequest request) {
		String imgn_path = "resources\\imgfile";
		// request�� ������ �̹����� ��θ� �޾Ƽ� ���
		String r_path = request.getRealPath("/");
		System.out.println("r_path : " + r_path);
		// ���ε� �� �̹����� �̸��� �޾Ƽ� �̹����� ����
		// �̹��� �̸� Ȯ��
		String oriFn = vo.getMfile().getOriginalFilename();
		System.out.println("oriFn : " + oriFn);
		// �̹��� ������ �� contentType Ȯ��
		long size = vo.getMfile().getSize();
		String contentType = vo.getMfile().getContentType();
		// contentType�� ����
		// application/vnd.ms-excel
		// application/pdf
		// text/plain
		// application/haansofthwp
		// image/jpeg
		System.out.println("���� ũ�� : " + size);
		System.out.println("������ type : " + contentType);
		// �޸𸮻�(�ӽ��������)�� ������ �츮�� ������ ��ο� �����ϰڴ�.
		// �̹����� ����� ��� �����
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(imgn_path).append("\\");
		path.append(oriFn);
		System.out.println("FullPath : " + path);
		// �߻��� (�̹����� ������ ���) File ��ü�� ����
		File f = new File(path.toString());
		// �ӽ÷� �޸𸮿� ��� �� ���ε��� ������ �� -> FileŬ������ ��η� ����
		try {
			vo.getMfile().transferTo(f);
			// �̹��� �̸��� db�� �����ϱ� ���ؼ� vo���� �缳��
			vo.setImgn(oriFn);
			// System.out.println(vo.getMfile());
			// System.out.println(vo.getImgn());
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		upboardDaoInter.addUpBoard(vo);
		return "redirect:upboardList";
	}

	// search�� ��� post�� �� �� ������ method�� �������� ����
	@RequestMapping(value = "/upboardList")
	public String upBoardList(Model model, String cPage, PageSearchDTO pvo) {
		totalRecord = upboardDaoInter.getCnt(pvo);
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
		List<UpBoardDTO> list = upboardDaoInter.listUpBoard(pvo);
		model.addAttribute("list", list); // d
		model.addAttribute("searchType", pvo.getSearchType());
		model.addAttribute("searchValue", pvo.getSearchValue());
		model.addAttribute("nowPage", nowPage); // d
		model.addAttribute("startPage", startPage); // d
		model.addAttribute("endPage", endPage); // d
		model.addAttribute("pagePerBlock", pagePerBlock); // d
		model.addAttribute("totalPage", totalPage);
		return "updemo/upboardList";
	}

	@GetMapping(value = "/upboardDetail")
	public String upBoardDetail(Model model, int num) {
		UpBoardDTO vo = upboardDaoInter.detailUpBoard(num);
		model.addAttribute("vo", vo);
		return "updemo/upboardDetail";
	}

	@GetMapping(value = "/upboardDelete")
	public String upBoardDelete(int num) {
		upboardDaoInter.deleteUpBoard(num);
		return "redirect:upboardList";
	}
}

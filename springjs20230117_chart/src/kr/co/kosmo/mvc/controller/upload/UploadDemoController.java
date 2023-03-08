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

	private int nowPage = 1; // 현재 페이지 값 -> 메뉴 페이지와 연동되는 변수
	// private int nowBlock = 1; // 현재 블럭 -> [][][][][] -> 1block
	private int totalRecord; // 총 게시물 수, Dao로 부터 받는다.
	private int numPerPage = 10; // 한 페이지당 보여질 게시물 수
	private int pagePerBlock = 5; // 한 블록당 보여질 페이지 수
	private int totalPage; // 전체 페이지 수 => totalRecord/numPerPage
	private int totalBlock; // 전체 블록 수
	private int beginPerPage; // 각 페이지별 시작 게시물의 index값
	private int endPerPage; // 각 페이지별 마지막 게시물의 index값

	@GetMapping(value = "/upboardForm")
	public String upBoardForm() {
		return "updemo/upForm";
	}

	@PostMapping(value = "/uploadpro")
	public String uploadFile(Model model, UpBoardDTO vo, HttpServletRequest request) {
		String imgn_path = "resources\\imgfile";
		// request를 가지고 이미지의 경로를 받아서 출력
		String r_path = request.getRealPath("/");
		System.out.println("r_path : " + r_path);
		// 업로드 된 이미지의 이름을 받아서 이미지를 복사
		// 이미지 이름 확인
		String oriFn = vo.getMfile().getOriginalFilename();
		System.out.println("oriFn : " + oriFn);
		// 이미지 사이즈 및 contentType 확인
		long size = vo.getMfile().getSize();
		String contentType = vo.getMfile().getContentType();
		// contentType의 종류
		// application/vnd.ms-excel
		// application/pdf
		// text/plain
		// application/haansofthwp
		// image/jpeg
		System.out.println("파일 크기 : " + size);
		System.out.println("파일의 type : " + contentType);
		// 메모리상(임시저장장소)에 파일을 우리가 설정한 경로에 복사하겠다.
		// 이미지가 저장될 경로 만들기
		StringBuffer path = new StringBuffer();
		path.append(r_path).append(imgn_path).append("\\");
		path.append(oriFn);
		System.out.println("FullPath : " + path);
		// 추상경로 (이미지를 저장할 경로) File 객체로 생성
		File f = new File(path.toString());
		// 임시로 메모리에 담긴 즉 업로드한 파일의 값 -> File클래스의 경로로 복사
		try {
			vo.getMfile().transferTo(f);
			// 이미지 이름을 db에 저장하기 위해서 vo값을 재설정
			vo.setImgn(oriFn);
			// System.out.println(vo.getMfile());
			// System.out.println(vo.getImgn());
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		upboardDaoInter.addUpBoard(vo);
		return "redirect:upboardList";
	}

	// search일 경우 post로 올 수 있으니 method를 설정하지 않음
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

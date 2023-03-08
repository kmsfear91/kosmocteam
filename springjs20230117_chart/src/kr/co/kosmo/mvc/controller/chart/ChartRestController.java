package kr.co.kosmo.mvc.controller.chart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.vo.MemberDTO;

// @Controller -> ������ �����̳ʰ� Model�� �����ؼ� ���� �ý��ۿ����� InternalResourceViewResolver�� ���ؼ� ������ View�� forward ������� �̵��Ѵ�.
// @RestController -> CustomView�� ����ؼ� ������ View ��, JSP�� ������� �ʰ� �����͸� ������ �� �ֱ� ������ �ַ� JSON���� response �� �� �ַ� �����
// @Controller : �޼��� ���� [/WEB-INF/views/�ȳ��ϼ���.jsp]��(��) ã�� �� �����ϴ�.
// @RestController : JSON�� ���� �����͸� �����ϱ� ���� ��Ʈ�ѷ��̴�.
@RestController
public class ChartRestController {

	@Autowired
	private MemberDaoInter memberDaoInter;

	// �ش� ��û�� ���� ���� View���ٰ� ��ȯ���� ���� �����ؼ� ���� ó���� ���ش�.
	// produces = "text/html;charset=euc-kr" => Content-Type�� �����ϴ� �Ӽ�
	@RequestMapping(value = "/helloView", produces = "text/html;charset=euc-kr")
	public String viewMessage() {
		return "�ȳ��ϼ���";
	}

	// Json Object Type -> javascript Object
	@RequestMapping(value = "/memberJsonView1", produces = "application/json;charset=utf-8")
	public List<MemberDTO> jsonObjectDemo1(String id) {
		List<MemberDTO> list = memberDaoInter.jsonDemo(id);
		return list;
	}
}

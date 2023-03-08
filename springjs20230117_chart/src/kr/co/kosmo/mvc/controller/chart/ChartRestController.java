package kr.co.kosmo.mvc.controller.chart;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.vo.MemberDTO;

// @Controller -> 스프링 컨테이너가 Model로 선택해서 현재 시스템에서는 InternalResourceViewResolver를 통해서 지정한 View로 forward 방식으로 이동한다.
// @RestController -> CustomView를 사용해서 지정한 View 즉, JSP를 사용하지 않고 데이터를 응답할 수 있기 때문에 주로 JSON으로 response 할 때 주로 사용함
// @Controller : 메세지 파일 [/WEB-INF/views/안녕하세요.jsp]을(를) 찾을 수 없습니다.
// @RestController : JSON과 같은 데이터를 서비스하기 위한 컨트롤러이다.
@RestController
public class ChartRestController {

	@Autowired
	private MemberDaoInter memberDaoInter;

	// 해당 요청이 오면 가상 View에다가 반환받은 값을 전달해서 응답 처리를 해준다.
	// produces = "text/html;charset=euc-kr" => Content-Type을 지정하는 속성
	@RequestMapping(value = "/helloView", produces = "text/html;charset=euc-kr")
	public String viewMessage() {
		return "안녕하세요";
	}

	// Json Object Type -> javascript Object
	@RequestMapping(value = "/memberJsonView1", produces = "application/json;charset=utf-8")
	public List<MemberDTO> jsonObjectDemo1(String id) {
		List<MemberDTO> list = memberDaoInter.jsonDemo(id);
		return list;
	}
}

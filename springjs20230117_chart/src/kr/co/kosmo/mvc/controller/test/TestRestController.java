package kr.co.kosmo.mvc.controller.test;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

import kr.co.kosmo.mvc.dao.MemberDaoInter;
import kr.co.kosmo.mvc.vo.MemberDTO;

@RestController
public class TestRestController {

	@Autowired
	private MemberDaoInter memberDaoInter;

	@RequestMapping(value = "/testRest", produces = "application/json;charset=utf-8")
	public String test() {
		List<MemberDTO> list = memberDaoInter.listMember();
		String result = null;
		ObjectMapper mapper = new ObjectMapper();
		try {
			result = mapper.writeValueAsString(list);
		} catch (JsonProcessingException e1) {
			e1.printStackTrace();
		}
		return result;
	}
}

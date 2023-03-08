package kr.co.kosmo.mvc.controller.test;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/test")
public class TestController {

	@RequestMapping(value = "/test")
	public String test() {
		return "test/test";
	}

	@RequestMapping(value = "/keyword")
	public String keyword() {
		return "test/keyword";
	}
}

package kr.co.mlec.changePW;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ChangePWController {

	@GetMapping("/findPassword")
	public String findPW() {
		return "findPassword/findPassword";
	}
}

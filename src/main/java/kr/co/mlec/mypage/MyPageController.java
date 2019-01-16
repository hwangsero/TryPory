package kr.co.mlec.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;

import kr.co.mlec.diary.DiaryService;
import kr.co.mlec.login.LoginService;
import kr.co.mlec.vo.DiaryVO;
import kr.co.mlec.vo.MemberVO;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService mypageService;
	
	@Autowired
	private LoginService loginService;
	
	@Autowired
	private DiaryService diaryService;
	
	@GetMapping("/mypage")
	public String myPageForm(HttpSession session) {
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		System.out.println(userVO);
		return "mypage/mypage";
	}
	
	@PostMapping("/mypage")
	public String updateMember(MemberVO userVO, HttpSession session) {
		System.out.println("userVO : " + userVO);
//		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		mypageService.updateMember(userVO);
		MemberVO member = loginService.loginMember(userVO);
		session.setAttribute("userVO", member);
		System.out.println("update-userVO:" + userVO);
		
		
		return "mypage/mypage_update";
	}
	
	@GetMapping("/mypage/myDiary")
	public ModelAndView mypageList() {
		ModelAndView mav = new ModelAndView();
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("start", 1);
		parameters.put("end", 5);
		List<DiaryVO> diaryList = null;
		diaryList = diaryService.selectFiveDiary(parameters);
		
		mav.setViewName("mypage/mypage");
		Gson gson = new Gson();
		mav.addObject("diaryListJ", gson.toJson(diaryList) );
		
		
		return mav;
	}
	
	@GetMapping("/reply/see/{diaryNo}")
	public String myCommentSee(@PathVariable("diaryNo") int diaryNo) {
		return "redirect:/diary/" + diaryNo;
	}

}
	
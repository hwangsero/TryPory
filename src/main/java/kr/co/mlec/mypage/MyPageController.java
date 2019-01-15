package kr.co.mlec.mypage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.co.mlec.login.LoginService;
import kr.co.mlec.vo.MemberVO;
import kr.co.mlec.vo.NoticeVO;

@Controller
public class MyPageController {
	
	@Autowired
	private MyPageService mypageService;
	
	@Autowired
	private LoginService loginService;
	
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
	
	@ResponseBody
	@PutMapping("/mypage/profile_image")
	public int updateProfileImg(@RequestBody MemberVO member, HttpSession session) {
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		member.setNo(userVO.getNo());
		userVO.setProfile_img(member.getProfile_img());
		session.setAttribute("userVO", userVO);
		
		System.out.println(member);
		
		return mypageService.updateProfileImg(member);
	}
	@ResponseBody
	@DeleteMapping("/mypage/delete_profile_image")
	public int deleteProfileImg(HttpSession session) {
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		userVO.setProfile_img(null);
		session.setAttribute("userVO", userVO);
		
		return mypageService.deleteProfileImg(userVO);
	}
}
	
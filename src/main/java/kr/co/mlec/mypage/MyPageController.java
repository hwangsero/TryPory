package kr.co.mlec.mypage;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
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
	private DiaryService diaryService;
	
	@Autowired
	private LoginService loginService;
	
	@GetMapping("/mypage")
	public ModelAndView myPageForm(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("start", 1);
		parameters.put("end", 5);
		parameters.put("user_no", userVO.getNo());
		List<DiaryVO> myDiaryList = diaryService.selectMyDiary(parameters);
		List<DiaryVO> ScrapList = diaryService.selectScrapDiary(parameters);
		
		Gson gson = new Gson();
		System.out.println(ScrapList);
		mav.addObject("myDiaryList", gson.toJson(myDiaryList));
		mav.addObject("ScrapList", gson.toJson(ScrapList));
		mav.setViewName("mypage/mypage");
		
		return mav;
	}
	
	@ResponseBody
	@GetMapping("/mypage/list")
	public List<DiaryVO> DiaryListPlus(HttpServletRequest request, HttpSession session) {
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		int start = Integer.parseInt(request.getParameter("start"));
		int end = Integer.parseInt(request.getParameter("end"));
		// 최신글 5개
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("start", start);
		parameters.put("end", end);
		parameters.put("user_no", userVO.getNo());
		
		List<DiaryVO> diaryList = null;
		diaryList = diaryService.selectMyDiary(parameters);

		return diaryList;
	}
	@ResponseBody
	@GetMapping("/mypage/s_list")
	public List<DiaryVO> DiaryS_ListPlus(HttpServletRequest request, HttpSession session) {
		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
		int start = Integer.parseInt(request.getParameter("start"));
		int end = Integer.parseInt(request.getParameter("end"));
		// 최신글 5개
		Map<String, Object> parameters = new HashMap<String, Object>();
		parameters.put("start", start);
		parameters.put("end", end);
		parameters.put("user_no", userVO.getNo());
		
		List<DiaryVO> diaryList = null;
		diaryList = diaryService.selectScrapDiary(parameters);
		
		return diaryList;
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
	
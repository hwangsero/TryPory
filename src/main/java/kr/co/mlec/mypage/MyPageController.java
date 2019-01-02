//package kr.co.mlec.mypage;
//
//import java.util.List;
//
//import javax.servlet.http.HttpSession;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.ui.Model;
//import org.springframework.web.bind.annotation.GetMapping;
//import org.springframework.web.bind.annotation.PathVariable;
//import org.springframework.web.bind.annotation.PostMapping;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.servlet.ModelAndView;
//
//import kr.co.mlec.login.MemberVO;
//import kr.co.mlec.notice.NoticeService;
//import kr.co.mlec.notice.NoticeVO;
//
//@Controller
//public class MyPageController {
//	
//	@Autowired
//	private MyPageService mypageService;
//	
//	@RequestMapping("/mypage/{pageNo}")
//	public ModelAndView noticeList(@PathVariable("pageNo") int pageNo,Model model) {
//		ModelAndView mav = new ModelAndView();
//		model.addAttribute(pageNo);
//		List<NoticeVO> notice =  mypageService.selectAllNotice(pageNo);
//		
//		mav.addObject("notice", notice);
//		mav.setViewName("notice/noticeList");
//		
//		return mav;
//	}
//	
//	@GetMapping("/notice/write")
//	public ModelAndView noticeWriteForm(HttpSession session) {
//		//세션에서 작성자 아이디가져오기
//		MemberVO userVO = (MemberVO)session.getAttribute("userVO");
//		NoticeVO noticeVO = new NoticeVO();
////		noticeVO.setWriter(userVO.getName());
//		noticeVO.setWriter("작성자");
//		
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("noticeVO", noticeVO);
//		mav.setViewName("notice/notice-write");
//		return mav;
//	}
////	오호라 창규없는 창규팀 그럼 나는 시간을 어떻게 해야되지? 에? 응? 에? 뭐? 내일 만난다고? 하다가 나는 먼저 갈게 그냥 한소리긴한데 너 일요일도 나와야되 나올거야 안나올거야? 그냥 집에서 할까? 형은 간다고? 나는 어차피 약속이... 나는 어차피 6시쯤 갈거야 아침 6시부터 그건좀 심한데
////  너네 어차피 집에서 할꺼잖아 알바하는데... 그런거야 너도하는걸로? ㅇㅇ 응 지금 예매하는거야? 성진오빠 예매라고 하면 뭔간 영화같잖아 예매지 예약이지 매표도아니고 그래서 너 안할거냐고 알바하면 해야지 편의점? 어 너 편의점알바 하며는 폐기좀 갖고오자 근데 거기 장사가 잘 안되서 아니야 나 되게 잘먹어 나 시간대 폐기나오면 하나도 안남기고 다먹어
//	// 괜찮아 너희는 맣ㄴ이 했으니까 
//	@PostMapping("/notice/write")
//	public String noticeWriter(NoticeVO noticeVO) {
//		
//		mypageService.insertNotice(noticeVO);
//		
//		return "redirect:/notice/1";
//	}
//
//}
//	
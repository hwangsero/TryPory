package kr.co.mlec.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.mlec.vo.MemberVO;

public class EmailInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();

		MemberVO login_member = (MemberVO)session.getAttribute("userVO");
		System.out.println("이메일 인증 체크");
		if(login_member != null && login_member.getUser_type().equals("U") && login_member.getIs_auth().equals("0") ){ // 로그인 했고 U타입 회원인경우
			System.out.println("이메일 인증 하세요");
			response.sendRedirect(request.getContextPath() + "/email/authRequest");
			return false;
		}
		return true;
	}
}

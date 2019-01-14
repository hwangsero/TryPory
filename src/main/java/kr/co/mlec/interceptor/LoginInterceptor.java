package kr.co.mlec.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import kr.co.mlec.vo.MemberVO;

public class LoginInterceptor extends HandlerInterceptorAdapter{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();

		MemberVO login_member = (MemberVO)session.getAttribute("userVO");
		if(login_member == null) {

			String back_uri = request.getServletPath();
			System.out.println("login interceptor uri : " +back_uri);
			
			// ?no=55 같은 파라미터 추출
			String uri_param = request.getQueryString();
			if( uri_param != null && ! uri_param.isEmpty()) {
				back_uri = back_uri + "?" + uri_param;
			}
			session.setAttribute("back_uri", back_uri);

			System.out.println("redir login");
			response.sendRedirect(request.getContextPath() + "/login");
			return false;
		}
		return true;
	}
}

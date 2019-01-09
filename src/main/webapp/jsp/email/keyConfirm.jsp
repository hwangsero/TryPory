<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/email/email.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/email/email_mobile.css">


<%@ include file="/WEB-INF/include/head.jsp"%>
<script>
	
</script>
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>
	<section>
		<div class="email-check-success-form">
			<h2>Trifory</h2>
			<a
				href="https://www.google.com/search?q=%EB%A9%94%EB%A1%B1&oq=%EB%A9%94%EB%A1%B1&aqs=chrome..69i57j0l5.915j0j7&sourceid=chrome&ie=UTF-8">
				<h1>
					<span>Trifory</span> 회원이 되신 것을 환영합니다.
				</h1> 
<pre>
축하합니다. 
이메일 인증에 성공하셨습니다. 
지금 바로 다이어리 기록을 남겨서 다른 사람들과 공유하세요.
</pre>
			</a>
			
			<h5>회원정보 수정은 마이페이지에서 가능합니다.</h5>
		</div>
		<%-- <h2>${msg}</h2> --%>
	</section>
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>
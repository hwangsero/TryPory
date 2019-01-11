<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/findPassword.css">


<%@ include file="/WEB-INF/include/head.jsp"%>

<meta charset="EUC-KR">
<title>Insert title here</title>
</head>

<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>


	<div class="find_password_form">
		<div class="find_password_form_type1">
			<img src="<%=request.getContextPath()%>/assets/img/findPassword.png">
			<div class="find_password_form_type1-1">
				<h2>비밀번호 찾기 안내</h2>
			</div>
		</div>
		<div class="find_password_form_type2">
			<div class="find_password_form_type2-1">
				<span class="mail"> 
				<input type="text" size="20" id="email"
					name="email" placeholder="이메일을 30자 이내로 입력하세요.">
				</span> 
				<span class="text">@</span> 
				<span class="mailAddr"> 
				<input type="text" size="20" 
					name="email_domain" id="email_domain">
				</span>
			</div>

			<div class="find_password_form_type2-2">
				<h5>메일 확인을 통해 비밀번호를 변경할 수 있습니다.</h5>
				<h5>이메일을 입력하여 확인 후 비밀번호를 변경해주세요.</h5>
			</div>
		</div>



	</div>
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>
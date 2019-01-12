<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/findPassword.css">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/findPassword_mobile.css">

<%@ include file="/WEB-INF/include/head.jsp"%>

<meta charset="EUC-KR">
<title>Insert title here</title>

<script>

$(document).ready(function() {
	
$('#submitBtn').click(function () {
	
	if($('#password').val() == '') {
		alert('패스워드를 입력해주세요')
		$('#password').focus();
		return false;
	}
	
	if($('#passwordChk').val() == '') {
		alert('패스워드확인을 입력해주세요')
		$('#passwordChk').focus();
		return false;
	}
	
	if($('#passwordChk').val() != $('#password').val()) {
		alert('패스워드가 일치하지 않습니다')
		$('#passwordChk').focus();
		return false;
	}
	
})
})
</script>
</head>

<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>


	<div class="change_password_form">
		<div class="change_password_form_type1">
			<div class="change_password_form_type1-1">
				<h2>비밀번호 변경 안내</h2>
			</div>
		</div>
		<div class="change_password_form_type2">
			<div class="change_password_form_type2-1">
			<form action="${pageContext.request.contextPath }/changePassword" method="post">
			<input type="hidden" value="${param.email }" name="email">
				<div class="change_password_form_type2-1_input">
					<h5>새 비밀번호</h5>
					<span class="changePW"> <input type="password" size="20"
						id="password" name="password" placeholder="">
					</span>

					<h5>비밀번호 확인</h5>
					<span class="checkedPW"> <input type="password" size="20"
						name="passwordChk" id="passwordChk">
					</span>
				</div>
				

				<div class="change_password_form_type2-1_button">
					<button type="submit" id="submitBtn">확인</button>
					<button id="backBtn">취소</button>
					</form>
				</div>

			</div>

		</div>



	</div>
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>
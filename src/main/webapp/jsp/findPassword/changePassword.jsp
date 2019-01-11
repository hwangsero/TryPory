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
				<div class="change_password_form_type2-1_input">
					<h5>새 비밀번호</h5>
					<span class="changePW"> <input type="text" size="20"
						id="changePW" name="changePW" placeholder="">
					</span>

					<h5>비밀번호 확인</h5>
					<span class="checkedPW"> <input type="text" size="20"
						name="checkedPW" id="checkedPW">
					</span>
				</div>


				<div class="change_password_form_type2-1_button">
					<button id="backBtn">취소</button>
					<button>확인</button>
				</div>

			</div>

		</div>



	</div>
	<%@ include file="/WEB-INF/include/footer.jsp"%>

</body>
</html>
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-3.3.1.min.js"></script>
	<script src="${pageContext.request.contextPath}/assets/js/mypage.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mypage.css">	
	<link rel="stylesheet"	href="<%=request.getContextPath()%>/assets/css/joinForm.css">
	<%@ include file="/WEB-INF/include/head.jsp" %>
	
</head>
<script>
	var check = true;
	
	function checkData() {
		var f = document.inputForm;
//이메일	
		if(f.email.value.length == 0 ) {
			alert('이메일을 입력하세요.');
			f.email.focus();
			return false;
		}
		
		if(f.email_domain.value.length == 0 ) {
			alert('이메일 형식을 다 채워주세요');
			f.email_domain.focus();
			return false;
		}
		
//비번
		if(f.password.value.length == 0 ) {
			alert('비밀번호를  입력하세요.');
 			f.password.focus(); 
			return false;
		}
		if(f.password.value.length > 21 ) {
			alert('비밀번호를 20자 이내로 입력하세요.');
			return false;
		}
		if(f.pwCk.value.length == 0 ) {
			alert('비밀번호 확인을  입력하세요.');
			f.pwCk.focus();
			return false;
		} 
		if(f.password.value !== f.pwCk.value) {
			alert('비밀번호가 다릅니다. 다시 입력해주세요.');
			return false;
		}
//핸드폰		
		if(f.tel1.value.length == 0 ) {
			alert('핸드폰 첫 번호를 입력하세요.');
			f.tel1.focus();
			return false;
		}
		if(f.tel1.value.length > 5 ) {
			alert('핸드폰 첫 번호를 3자 이내로 입력하세요.');
			return false;
		}
		if(f.tel2.value.length == 0 ) {
			alert('핸드폰 가운데 번호를 입력하세요.');
			f.tel2.focus();
			return false;
		}
		if(f.tel2.value.length > 5 ) {
			alert('핸드폰 가운데 번호를 4자 이내로 입력하세요.');
			return false;
		}
		if(f.tel3.value.length == 0 ) {
			alert('핸드폰 끝 번호를 입력하세요.');
			f.tel3.focus();
			return false;
		}
		if(f.tel3.value.length > 5 ) {
			alert('핸드폰 끝 번호를 4자 이내로 입력하세요.');
			return false;
		}
	}
</script>

<body>
	 <%@ include file="/WEB-INF/include/header.jsp" %>
	 <%@ include file="/jsp/mypage/mypage_update_section.jsp" %>
	 <%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>
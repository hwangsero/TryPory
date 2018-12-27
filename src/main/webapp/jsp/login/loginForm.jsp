<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/login.css">
<%@ include file="/WEB-INF/include/head.jsp" %>
 <script>
	function checkForm(){
		var f=document.lform;
		if( f.email.value == ""){
			alert("아이디를 입력하세요");
			return false;
		}
		if( f.password.value == ""){
			alert("비밀번호를 입력하세요");
			return false;
		}		
		return true;
	}	
</script>
</head>
<body>
	 <%@ include file="/WEB-INF/include/header.jsp" %>
		<div class="login-form">
			<div class="container">
				<div class="login-form-h2">
					<h1><a href="<%= request.getContextPath() %>">로그인</a></h1>
				</div>
			
				<form method="post" action="<%=request.getContextPath()%>/jsp/login/loginProcess.jsp"
					name="lform" onsubmit="return checkForm()">
						<div class="login-form-input">
							<h3>이메일</h3>
							<span> 
								<input type="text" size="40" id="email" name="email" placeholder="이메일">
							</span> 
						</div>
							
						<div class="login-form-input">
							<h3>비밀번호</h3>
							<span>
								<input type="password" size="40" id="password" name="password"  placeholder="비밀번호">
							</span>
						</div>
						
						<div class=buttons>
						 	<input class="join-btn"type="button" value="회원가입">
						 	<input class="login-btn" type="submit" value="로그인">
						</div>
						
				</form>
			</div>
		</div>
		<!-- // end login-form -->
		
		
		
	<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>





<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/login.css">
<link href="${pageContext.request.contextPath}/assets/css/mobile.css" rel="stylesheet">
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

<style>
@media (max-width:800px){
		*{
			width:86%;
		} 
	}
</style>
</head>
<body>
	 <%@ include file="/WEB-INF/include/header.jsp" %>
		<div class="login-form">
			<div class="login-form-h2">
				<h1><a href="<%= request.getContextPath() %>">LOGO</a></h1>
			</div>
			
			<form method="post" action="${pageContext.request.contextPath }/login"
				name="lform" onsubmit="return checkForm()">
					<div class="login-form-input">
						<span>Email</span>
						<span> 
							<input type="text" size="40" id="email" name="email" placeholder="Email">
						</span> 
					</div>
						
					<div class="login-form-input">
						<span>PassWord</span>
						<span>
							<input type="password" size="40" id="password" name="password"  placeholder="PassWord">
						</span>
					</div>
					
					<div class=buttons>
					 	<input class="join-btn"type="button" value="Join">
					 	<input class="login-btn" type="submit" value="Login">
					</div>
			</form>
		</div>
		<!-- // end login-form -->
		
		
		
	<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>





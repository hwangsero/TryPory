<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/login.css">
<script src="<%= request.getContextPath() %>/js/checkForm.js"></script>
<script src="<%= request.getContextPath() %>/js/jquery-3.3.1.min.js"></script>
<title>Insert title here</title>

 <script>
	function checkForm(){
		var f=document.lform;
		if(isNull(f.id,"아이디를 입력하세요")){
			return false;
		}
		if(isNull(f.password,"비번을 입력하세요 ")){
			return false;
		}
	}
	
		
</script>
</head>
<body>

		<div class="login-form">
			<div class="login-form-h2">
				<h1><a href="<%= request.getContextPath() %>">LOGO</a></h1>
			</div>
			
			<form method="post" action="<%=request.getContextPath()%>/index.jsp"
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
		
		
		

</body>
</html>





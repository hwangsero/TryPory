<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/joinForm.css">

<title>회원 가입</title>
	<%@ include file="/WEB-INF/include/head.jsp" %>
<script>
	var check = true;
	
	function checkData() {
		var f = document.inputForm;


//이메일		
		if(f.email_id.value.length == 0 ) {
			alert('이메일을 입력하세요.');
			f.email.focus();
			return false;
		}
		
		if(f.email_domain.value.length == 0 ) {
			alert('이메일 형식을 다 채워주세요');
			f.email.focus();
			return false;
		}
		
		if(f.email_id.value.length > 31 ) {
			alert('이메일을 30자 이내로 입력하세요.');
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
		

</script>

</head>
<body>
	 <%@ include file="/WEB-INF/include/header.jsp" %>
	<section>


		<div class=join-form>
			<!-- <div class="join-form-head">
				<h2>Create An Account</h2>
			</div>//header -->

			<h2>Create An Account</h2>

			<div class="container">
				<form method="post" action="<%=request.getContextPath()%>/index.jsp"
					onsubmit="return checkData()" name="inputForm">


					<!--이메일-->
					<div class="joinId">
						<h3>이메일</h3>
						<span class="mail"> <input type="text" size="20" id="email"
							name="email_id" placeholder="이메일을 30자 이내로 입력하세요.">
						</span> <span class="text">@</span> <span class="mailAddr"> <input
							type="text" size="20" name="email_domain">
						</span>
					</div>

					<!--Id-->
					<div>
						<h3>아이디</h3>
						<span> 
						<input type="text" size="40" id="id"
							name="id" placeholder="사용할 아이디를 입력하세요">
						</span>
					</div>

					<!--비번-->
					<div>
						<h3>비밀번호</h3>
						<span> <input type="password" size="40" id="password"
							name="password" placeholder="비밀번호를 20자 이내로 입력하세요.">
						</span>
					</div>

					<!--비번재확인-->
					<div>
						<h3>비밀번호 재확인</h3>
						<span> <input type="password" size="40" id="pwCk"
							name="pwCk" placeholder="비밀번호를 20자 이내로 입력하세요.">
						</span>
					</div>



					<!--tel-->
					<div>
						<h3>휴대전화</h3>
						<span class="tel1"> <input type="text" size="3" name="tel1">
						</span> <span class="text telT">-</span> <span class="tel tel2"> <input
							type="tel" size="4" name="tel2">
						</span> <span class="text telT">-</span> <span class="tel tel3"> <input
							type="tel" size="4" name="tel3">
						</span>
					</div>


					<div class="join-buttons">
						<button class="jbutton" type="submit" value="가입 완료">가입하기</button>
						<button class="back" type="reset" value="초기화">초기화</button>
					</div>
				</form>
			</div>
			<!-- // end container -->
		</div>
		 <%@ include file="/WEB-INF/include/footer.jsp" %>
	</section>
</body>
</html>


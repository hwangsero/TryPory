<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/joinForm.css">
<%@ include file="/WEB-INF/include/head.jsp"%>
<script>
	var idCheck = false;

	$(document).ready(function() {

		$j('#duplBtn').click(function() {
			if ($('#email').val() == '') {
				alert('이메일을 입력하세요')
				$('#email').focus();
			} else if ($('#email_domain').val() == '') {
				alert('이메일 형식을 다 채워주세요')
				$('#email_domain').focus();
			} else {
				var data = {
					email : $('#email').val() + '@' + $('#email_domain').val()
				}
				console.log(data)
				$j.ajax({
					url : '${pageContext.request.contextPath}/join/check',
					type : 'post',
					data : JSON.stringify(data),
					dataType : "json",
					contentType : 'application/json',
					success : function(data) {
						if (data == "true") {
							$('#duplSpan').empty();
							$('#duplSpan').append("사용가능한 아이디입니다");
							idCheck = true;
						} else {
							$('#duplSpan').empty();
							$('#duplSpan').append("중복된 아이디입니다");
						}

					},
					error : function(e) {
						alert(e);
					}
				})

			}

		})

	})

	function checkData() {
		var f = document.inputForm;
		//이메일	
		if (f.email.value.length == 0) {
			alert('이메일을 입력하세요.');
			f.email.focus();
			return false;
		}

		if (f.email_domain.value.length == 0) {
			alert('이메일 형식을 다 채워주세요');
			f.email_domain.focus();
			return false;
		}

		f.email.value = f.email.value + '@' + f.email_domain.value;

		//비번
		if (f.password.value.length == 0) {
			alert('비밀번호를  입력하세요.');
			f.password.focus();
			return false;
		}
		if (f.password.value.length > 21) {
			alert('비밀번호를 20자 이내로 입력하세요.');
			return false;
		}
		if (f.pwCk.value.length == 0) {
			alert('비밀번호 확인을  입력하세요.');
			f.pwCk.focus();
			return false;
		}
		if (f.password.value !== f.pwCk.value) {
			alert('비밀번호가 다릅니다. 다시 입력해주세요.');
			return false;
		}
		//핸드폰		
		if (f.tel1.value.length == 0) {
			alert('핸드폰 첫 번호를 입력하세요.');
			f.tel1.focus();
			return false;
		}
		if (f.tel1.value.length > 5) {
			alert('핸드폰 첫 번호를 3자 이내로 입력하세요.');
			return false;
		}
		if (f.tel2.value.length == 0) {
			alert('핸드폰 가운데 번호를 입력하세요.');
			f.tel2.focus();
			return false;
		}
		if (f.tel2.value.length > 5) {
			alert('핸드폰 가운데 번호를 4자 이내로 입력하세요.');
			return false;
		}
		if (f.tel3.value.length == 0) {
			alert('핸드폰 끝 번호를 입력하세요.');
			f.tel3.focus();
			return false;
		}
		if (f.tel3.value.length > 5) {
			alert('핸드폰 끝 번호를 4자 이내로 입력하세요.');
			return false;
		}

		if (idCheck == false) {
			alert('아이디 중복체크를 해주세요');
			return false;
		}

	}
</script>
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>
	<section>

		<div class=join-form>
			<div class="container">
				<div class="join-form-h2">
					<h1>회원가입</h1>
				</div>
				<form method="post"
					action="${pageContext.request.contextPath }/join"
					onsubmit="return checkData()" name="inputForm">
					<!--이메일-->
					<div class="joinId">
						<h3>
							이메일 <input type="button" id="duplBtn" value="중복체크"> <b
								id="duplSpan"></b>
						</h3>
						<span class="mail"> <input type="text" size="20" id="email"
							name="email" placeholder="이메일을 30자 이내로 입력하세요.">
						</span> <span class="text">@</span> <span class="mailAddr"> <input
							type="text" size="20" name="email_domain" id="email_domain">
						</span>
					</div>

					<!--Id-->
					<div>
						<h3>이름</h3>
						<span> <input type="text" size="40" id="name" name="name"
							placeholder="이름을 입력하세요">
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
	</section>
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>


<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/email/email.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/email/email_mobile.css">

<%@ include file="/WEB-INF/include/head.jsp"%>
<script>
$j(document).ready(function(){
	$j("input#resend_email").click(function(){
		$j.ajax({
			url: window.ctx + '/resendEmail',
			type : 'POST',
			success : function(){
				alert('이메일이 재전송되었습니다');
			}, 
			error : function(jqXHR) {
				console.log(jqXHR);
			}
		});
	});
});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>
	<section>
	<div class="email-check-form">
		<h2><span>이메일 인증</span> 안내입니다.</h2>
		
<pre>
안녕하세요. 
트리포리를 이용해주셔서 감사합니다.
아래 <span>메일인증</span> 버튼을 클릭하여 회원가입을 완료해주세요.
</pre>				
		<input type="button" id="resend_email" value="메일 인증">
	</div>
	</section>
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>
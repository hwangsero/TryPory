<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
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
		<h2>이메일 인증해주세요</h2>
		
		<input type="button" id="resend_email" value="이메일 재전송">
	</section>
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>
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
			beforeSend:function(){
				var str = '<div class="preloader ajax d-flex align-items-center justify-content-center">';
						str += '<div class="spinner">';
							str += '<div class="double-bounce1"></div>';
							str += '<div class="double-bounce2"></div>';
						str += '</div>';
					str += '</div>';
		        	$('section').append(str);
		    },
		   	complete:function(){
		        $('section .preloader').remove();
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
<span>Tripory</span>에 회원가입해주셔서 감사합니다.
<br>
이메일을 받지못하신 경우 아래 <span>이메일 재전송</span> 버튼을 클릭해주세요
</pre>				
		<input type="button" id="resend_email" value="이메일 재전송">
	</div>
	</section>
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>
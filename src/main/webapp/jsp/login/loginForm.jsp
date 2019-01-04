<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
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

	$j(document).ready(function(){
		$j("form[name=lform]").submit(function(e){
			e.preventDefault();
			if( ! checkForm()){
				return false;
			}
			$j.ajax({
				url : '<%=request.getContextPath()%>/login',
				type :'post',
				data : {
					email : $j("form[name=lform] input[name=email]").val(),
					password : $j("form[name=lform] input[name=password]").val()
				},
				success : function ( msg ){
					alert(msg);
					location.href="<%= request.getContextPath() %>";
				}
			});
		});
	});
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
</head>
<body>
	 <%@ include file="/WEB-INF/include/header.jsp" %>
		<div class="login-form">
			<div class="container">
				<div class="login-form-h2">
					<h1><a href="<%= request.getContextPath() %>">로그인</a></h1>
				</div>
			
				<form method="post"	name="lform">
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
				<a id="kakao-login-btn"></a>
<script type='text/javascript'>
  //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('2fed101eab1c984c04b7979e17790867');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function(authObj) {
        // 로그인 성공시, API를 호출합니다.
        Kakao.API.request({
          url: '/v2/user/me',
          success: function(res) {
        	  location.href='${pageContext.request.contextPath}/login/kko/' + res.properties.nickname;
          },
          fail: function(error) {
        	 console.log(error)
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function(err) {
    	  console.log(err)
        alert(JSON.stringify(err));
      }
    });
  //]]>
</script>
<div id="naver_id_login"></div>
  <!-- //네이버아이디로로그인 버튼 노출 영역 -->
  <script type="text/javascript">
  	var naver_id_login = new naver_id_login("ZzvV2ys1Zu5dLvgKF84f", "http://localhost:8888/Travel-Diary/jsp/login/callback.jsp");
  	var state = naver_id_login.getUniqState();
  	naver_id_login.setButton("white", 2,40);
  	naver_id_login.setDomain("btVpK6adye");
  	naver_id_login.setState(state);
  	naver_id_login.setPopup();
  	naver_id_login.init_naver_id_login();
  </script>
			</div>
		</div>
		<!-- // end login-form -->
		
		
		
	<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>





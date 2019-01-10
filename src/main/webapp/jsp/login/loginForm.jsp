<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
<meta name="viewport" content="user-scalable=no, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, width=device-width"/>
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/login.css">
<!-- <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script> -->
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
      var result;
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
            success : function ( data ){
               alert(result = JSON.parse(data).loginMsg);
               result = JSON.parse(data).result;
               if(result == "true" ) {
                  if($('#emailSave').is(":checked")){ 
                  	saveLogin($('#email').val());
                  }
                  else { 
                  	saveLogin("");
                  }
                  
					location.href="<%= request.getContextPath() %>"; 
               } else {
                	saveLogin("");
               }
            }
         });
      });
   });
   
   $(function() {
      var cookieEmail = getLogin();
      console.log("cookieEmail : " + cookieEmail)
      if(cookieEmail != "") {
         
         $('#email').val(cookieEmail);
         $('#emailSave').attr("checked",true);
      }
   })
   
   function saveLogin(email) {
      if(email != "") {
         setSave("userEmail",email, 7);
      } else {
         setSave("userEmail", email, -1);
      }
   }
   
   function setSave(name, value, expiredays) {
      var today = new Date();
      today.setDate(today.getDate() + expiredays);
      document.cookie = name + "=" + escape(value) + "; path=/;expires=" + today.toGMTString() + ";"
   }
   
   function getLogin() {
      var cook = document.cookie + ";";
      var idx = cook.indexOf("userEmail",0);
      var val = "";
      
      if(idx != -1) {
         cook = cook.substring(idx, cook.length);
         begin = cook.indexOf("=",0) + 1;
         end = cook.indexOf(";",begin);
         val = unescape(cook.substring(begin,end))
      }
      return val;
   }
   
</script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  <!-- <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
</head>
<body>
    <%@ include file="/WEB-INF/include/header.jsp" %>
      <div class="login-form">
         <div class="container">
            <div class="login-form-h2">
               <h1>로그인</h1>
            </div>
         
            <form method="post"   name="lform">
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
                  
                  <div class= buttons>
                      <input id="loginBtn" class="login-btn" type="submit" value="로그인">
                      <input type="checkbox" id="emailSave"> <p>아이디저장</p>
                      <div class="find">
                         <p><a>아이디/비밀번호 찾기</a></p>
                         <p><a href="${pageContext.request.contextPath}/join">회원가입<a/></p>
                      </div>   
                      <div class="login-api-btn">
                      <a class="login-api-button" id="facebook_api_button" href="${facebook_url}">페이스북 계정으로 로그인</a>
                      <a class="login-api-button" id="google_api_button" href="${google_url}">구글 계정으로 로그인</a>
                      <a class="login-api-button" id="naver_id_button" href="${naver_url}">네이버 계정으로 로그인</a>
                      </div>
                  </div>
                  
            </form>

         </div>
      </div>
      <!-- // end login-form -->
   <%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>




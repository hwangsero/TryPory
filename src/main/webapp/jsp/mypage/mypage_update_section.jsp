<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>



<!-- 이미지교체 팝업 -->

<div class="cd-popup02" role="alert">
	<div class="cd-popup-container">
		<div class="button-area">
			배경 이미지 교체 <a href="#0" class="cd-popup-close img-replace"></a>
		</div>
		<label for="profile-button">사진 업로드</label> <label>현재 사진 삭제</label> <input
			type="file" id="profile-button">
	</div>
</div>
<!--배경이미지 교체 팝업 END-->

<div class="cd-popup" role="alert">
	<div class="cd-popup-container">
		<div class="button-area">
			프로필 사진 교체 <a href="#0" class="cd-popup-close img-replace"></a>
		</div>
		<label for="profile-button">사진 업로드</label> <label>현재 사진 삭제</label>
		<!-- 		<label for="profile-button">취소</label> -->

		<input type="file" id="profile-button">
	</div>
	<!-- cd-popup-container -->
</div>
<!-- 프로필 이미지 교체 팝업 END-->

<section class="mag-posts-area d-flex flex-wrap profile-page">

	<a href="#" class="backImgBtn">
		<div class="page-header header-filter"></div>
	</a>
	<!-- 배경이미지 영역 END  -->

	<div class="mag-posts-content mt-200 mb-30 p-30">

		<div class="profile-content ">
			<div class="container">
				<div class="profile">
					<div class="avatar">
						<a href="#" class="profileImgBtn"><img
							src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTU0NjQzOTk4OTQ4OTkyMzQy/ansel-elgort-poses-for-a-portrait-during-the-baby-driver-premiere-2017-sxsw-conference-and-festivals-on-march-11-2017-in-austin-texas-photo-by-matt-winkelmeyer_getty-imagesfor-sxsw-square.jpg"
							alt="Circle Image" class="img-raised rounded-circle img-fluid">
						</a>
					</div>


					<div class="update-form-box">
						<form method="post"
							action="${pageContext.request.contextPath }/mypage"
							onsubmit="return checkData()" name="inputForm">

							<!-- 프로필수정 form -->
							<div class="update-form">
								<h2>프로필 수정</h2>
								<!--닉네임-->
								<div class="inputBox">
									<h3>이름</h3>
									<span> <input type="text" size="40" id="name" name="name"
										value ="${ userVO.name }">
									</span>
								</div>

								<!--소개-->
								<div class="inputBox">
									<h3>소개</h3>
									<span class="intro"> <textarea rows="6" cols="60" name="intro" >${ userVO.intro }</textarea>
									</span>
								</div>
							</div>

							<!-- 개인정보수정  -->
							<div class="update-form">
								<h2>개인정보 수정</h2>
								<!--이메일-->
								<div class="joinId">
									<h3>이메일</h3>
									<span class="mail"> <input type="text" size="20"
										id="email" name="email" value="${ userVO.email }">
									</span> 
									<span class="text">@</span> 
									<span class="mailAddr">
										<input type="text" size="20" value="${ userVO.domain }" name="domain">
									</span>
								</div>

								<!--비번-->
								<div class="inputBox">
									<h3>비밀번호</h3>
									<span> <input type="password" size="40" id="password"
										name="password" value="${ userVO.password }">
									</span>
								</div>

								<!--비번재확인-->
								<div class="inputBox">
									<h3>비밀번호 재확인</h3>
									<span> <input type="password" size="40" id="pwCk"
										name="pwCk">
									</span>
								</div>

								<!--tel-->
								<div>
									<h3>휴대전화</h3>
									<div class="inputBox">
										<span class="tel tel1"> <input type="text" size="3"
											name="phone1" value="${ userVO.phone1 }">
										</span> <span class="text telT">-</span> <span class="tel tel2">
											<input type="tel" size="4" name="phone2" value="${ userVO.phone2 }">
										</span> <span class="text telT">-</span> <span class="tel tel3">
											<input type="tel" size="4" name="phone3" value="${ userVO.phone3 }">
										</span>
									</div>
								</div>
							</div>


							<div class="join-buttons">
								<button class="jbutton" type="submit" value="가입 완료">수정하기</button>
								<button type="button" class="back" onclick="location.href='${pageContext.request.contextPath}/jsp/mypage/mypage.jsp'">취소</button>
							</div>
						</form>
					</div>

					<!-- // end container -->
				</div>
			</div>

		</div>
	</div>
	</div>

	</div>

</section>
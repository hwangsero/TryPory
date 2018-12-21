<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
    
<!-- 이미지교체 팝업 -->

<div class="cd-popup02" role="alert">
	<div class="cd-popup-container">
		<div class="button-area">
			배경 이미지 교체 
			<a href="#0" class="cd-popup-close img-replace"></a>
		</div>
		<label for="profile-button">사진 업로드</label>
		<label >현재 사진 삭제</label>		
		<input type="file" id="profile-button">
	</div> 
</div> 
<!--배경이미지 교체 팝업 END-->

<div class="cd-popup" role="alert">
	<div class="cd-popup-container">
		<div class="button-area">
			프로필 사진 교체 
			<a href="#0" class="cd-popup-close img-replace"></a>
		</div>
		<label for="profile-button">사진 업로드</label>
		<label>현재 사진 삭제</label>
<!-- 		<label for="profile-button">취소</label> -->
		
		<input type="file" id="profile-button">
	</div> <!-- cd-popup-container -->
</div> 
<!-- 프로필 이미지 교체 팝업 END-->
	
<section class="mag-posts-area d-flex flex-wrap profile-page">	
					
    <a href="#" class="backImgBtn">
    	<div class="page-header header-filter">
    	</div>	
   	</a>
   	<!-- 배경이미지 영역 END  -->
   	
   	<div class="mag-posts-content mt-200 mb-30 p-30">
   	
		<div class="profile-content ">
			<div class="container">
				<div class="profile">
					<div class="avatar">
						<a href="#" class="profileImgBtn"><img src="https://www.biography.com/.image/ar_1:1%2Cc_fill%2Ccs_srgb%2Cg_face%2Cq_auto:good%2Cw_300/MTU0NjQzOTk4OTQ4OTkyMzQy/ansel-elgort-poses-for-a-portrait-during-the-baby-driver-premiere-2017-sxsw-conference-and-festivals-on-march-11-2017-in-austin-texas-photo-by-matt-winkelmeyer_getty-imagesfor-sxsw-square.jpg"
							alt="Circle Image" class="img-raised rounded-circle img-fluid">
						</a>
					</div>
					<div class="name">
						<h3 class="title">HACHO</h3>
						<h6>hacho_2011@naver.com</h6>
					</div>
					<div class="description text-center">
						<p>여행하는 걸 좋아하는 하초입니다 (^^)</p>
					</div>
					<a href="${pageContext.request.contextPath}/jsp/mypage/mypage_update.jsp"><label for="myUpdateBtn">개인정보 수정</label></a>
				</div>

				
				<!-- 탭 영역 시작 -->

				<div class="profile-tabs">
					<ul class="nav nav-pills nav-pills-icons justify-content-center"
						role="tablist">
						<li class="nav-item">
							<a class="nav-link active" href="#studio" role="tab" data-toggle="tab">내 다이어리</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#works"	role="tab" data-toggle="tab">좋아요</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#favorite" role="tab" data-toggle="tab">내 댓글</a>
						</li>
					</ul>
				</div>
				
				<!-- 컨텐츠 영역 시작 -->

				<div class="tab-content tab-space">
					<div class="tab-pane active text-center gallery" id="studio">

						<div class="trending-now-posts mb-30">
							<div style="margin-bottom: 10px; font-size: 20px">2017/01/02
								~ 2017/02/03 &nbsp;&nbsp;&nbsp;&nbsp;다이어리제목</div>
							<!-- Section Title -->

							<div class="trending-posts">
								<!--            <div class="trending-post-slides owl-carousel"> -->
								<div class="single-trending-post"
									style="width: 50%; height: 400px; float: left;">
									<img
										src="${pageContext.request.contextPath}/assets/img/bg-img/19.jpg"
										alt="">
									<div class="post-content">
										<a href="#" class="post-cata">일본</a> <a href="video-post.html"
											class="post-title">여행 다이어리</a>
									</div>
								</div>

								<div class="single-trending-post"
									style="width: 50%; height: 400px; float: left;">
									<img
										src="${pageContext.request.contextPath}/assets/img/bg-img/20.jpg"
										alt="">
									<div class="post-content">
										<a href="#" class="post-cata">유럽</a> <a href="video-post.html"
											class="post-title">여행 다이어리</a>
									</div>
								</div>

							</div>
						</div>

					</div>
					
					<!-- 1st End  -->

					<div class="tab-pane text-center gallery" id="works">
						<div class="trending-now-posts mb-30">
							<div style="margin-bottom: 10px; font-size: 20px">2017/01/02
								~ 2017/02/03 &nbsp;&nbsp;&nbsp;&nbsp;다이어리제목</div>
							<!-- Section Title -->

							<div class="trending-posts">
								<!--            <div class="trending-post-slides owl-carousel"> -->
								<div class="single-trending-post"
									style="width: 100%; height: auto; float: left;">
									<img
										src="${pageContext.request.contextPath}/assets/img/bg-img/19.jpg"
										alt="">
									<div class="post-content">
										<a href="#" class="post-cata">일본</a> <a href="video-post.html"
											class="post-title">여행 다이어리</a>
									</div>
								</div>


							</div>
						</div>
					</div>
					
					<!-- 2nd End  -->

					<div class="tab-pane text-center gallery" id="favorite">

						<div class="tab-pane text-center gallery" id="works">
							<div class="trending-now-posts mb-30">
								<div style="margin-bottom: 10px; font-size: 20px">2017/01/03
									~ 2017/02/03 &nbsp;&nbsp;&nbsp;&nbsp;다이어리제목</div>
								<!-- Section Title -->

								<div class="trending-posts">
									<!--            <div class="trending-post-slides owl-carousel"> -->
									<div class="single-trending-post"
										style="width: 100%; height: auto; float: left;">
										<img
											src="${pageContext.request.contextPath}/assets/img/bg-img/19.jpg"
											alt="">
										<div class="post-content">
											<a href="#" class="post-cata">일본</a> <a
												href="video-post.html" class="post-title">여행 다이어리</a>
										</div>
									</div>


								</div>
							</div>
						</div>

					</div>
					<!-- 3rd End  -->

				</div>
				<!-- mypage contents  -->
				


			</div>
		</div>
	</div>
	
	</div>
		
</section>
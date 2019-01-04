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
						<h3 class="title">${ userVO.name }</h3>
						<h6>${ userVO.email }</h6>
					</div>
					<div class="description text-center">
						<p>${ userVO.intro }</p>
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
				
					<div class="tab-pane active" id="studio">

						<div class="diary_post">
							<div class="profile_area">
						        <div class="profile_wrap">
						            <a href="/my/4550316/profile" class="link_profile" title="계정 상세페이지" data-persist-component="unique_idx2" onclick="nclk(this,'sea*t.profile','','');">
						                <span class="profile_thumb">
						                    <img class="thumb_default" src="https://img-pholar.pstatic.net/20171231_163/1514678074152X9488_JPEG/miya1220.jpg?type=fn80_80" onerror="this.src='https://ssl.pstatic.net/static/m/pholar/img/blank.png'" onclick="nclk(this,'sea*t.thumb','','');">
						                    <span class="profile_thumb_mask"></span>
						                </span>
						                <span class="profile_name">최창규</span>
						                <em class="data_date">2일 전</em>
						            </a>
						            
					                <span class="location">
					                    <a href="/gallery/location?code=ChIJ3eA7J_DdAGARil7_EwUaR_I&amp;name=%ED%95%98%EB%A3%A8%EC%B9%B4%EC%8A%A4%20300" onclick="nclk(this,'sea.location','','');">
					                       <i class="fas fa-map-marker-alt location_name"></i>하루카스 300
					                    </a>
					                </span>
						        </div>
						    </div>
					
							<div class="trending-now-posts mb-30 img_posts">
								<div style="margin-bottom: 10px; font-size: 20px;">
									<h5>오사카 여행 일지</h5>
									<b>#오사카 #하루카스300 #ハルカス300</b>
								</div>
								
								<div class="trending-posts img_wrap clr">
									<div class="img_content">
										<img src="${pageContext.request.contextPath}/assets/img/bg-img/19.jpg"
											alt="">
									</div>
									<div class="img_content">
										<img src="${pageContext.request.contextPath}/assets/img/bg-img/20.jpg"
											alt="">
									</div>
									<div class="img_content">
										<img src="${pageContext.request.contextPath}/assets/img/bg-img/21.jpg"
											alt="">
									</div>
									<div class="img_content">
										<img src="${pageContext.request.contextPath}/assets/img/bg-img/22.jpg"
											alt="">
									</div>
									<div class="img_content plus_content">
										<img src="${pageContext.request.contextPath}/assets/img/bg-img/22.jpg"
											alt="">
										<div class="post-content" style="text-align: center">
											<a href="video-post.html" class="post-title">+3</a>
										</div>
									</div>
								</div>
								
								<div class="img_snsBtn">
									<div class="heart">
										<i class="far fa-heart fa-2x"></i> 
										<span>30</span>
									</div>
									<div class="comment">
										<i class="far fa-comment-dots fa-2x"></i> 
										<span>5</span>
									</div>
								</div>
							</div>
						</div>

					</div>
					
					<!-- 1st End  -->

					<div class="tab-pane" id="works">
						<div class="diary_post">
							<div class="profile_area">
						        <div class="profile_wrap">
						            <a href="/my/4550316/profile" class="link_profile" title="계정 상세페이지" data-persist-component="unique_idx2" onclick="nclk(this,'sea*t.profile','','');">
						                <span class="profile_thumb">
						                    <img class="thumb_default" src="https://img-pholar.pstatic.net/20171231_163/1514678074152X9488_JPEG/miya1220.jpg?type=fn80_80" onerror="this.src='https://ssl.pstatic.net/static/m/pholar/img/blank.png'" onclick="nclk(this,'sea*t.thumb','','');">
						                    <span class="profile_thumb_mask"></span>
						                </span>
						                <span class="profile_name">최창규</span>
						                <em class="data_date">2일 전</em>
						            </a>
						            
					                <span class="location">
					                    <a href="/gallery/location?code=ChIJ3eA7J_DdAGARil7_EwUaR_I&amp;name=%ED%95%98%EB%A3%A8%EC%B9%B4%EC%8A%A4%20300" onclick="nclk(this,'sea.location','','');">
					                       <i class="fas fa-map-marker-alt location_name"></i>하루카스 300
					                    </a>
					                </span>
						        </div>
						    </div>
					
							<div class="trending-now-posts mb-30 img_posts">
								<div style="margin-bottom: 10px; font-size: 20px;">
									<h5>오사카 여행 일지</h5>
									<b>#오사카 #하루카스300 #ハルカス300</b>
								</div>
								
								<div class="trending-posts img_wrap clr">
									<div class="img_content">
										<img src="${pageContext.request.contextPath}/assets/img/bg-img/19.jpg"
											alt="">
									</div>
									<div class="img_content">
										<img src="${pageContext.request.contextPath}/assets/img/bg-img/20.jpg"
											alt="">
									</div>
									<div class="img_content">
										<img src="${pageContext.request.contextPath}/assets/img/bg-img/21.jpg"
											alt="">
									</div>
								
									<div class="img_content plus_content">
										<img src="${pageContext.request.contextPath}/assets/img/bg-img/22.jpg"
											alt="">
										<div class="post-content" style="text-align: center">
											<a href="video-post.html" class="post-title">+3</a>
										</div>
									</div>
								</div>
								<div class="img_snsBtn">
									<div class="heart">
										<i class="far fa-heart fa-2x"></i> 
										<span>30</span>
									</div>
									<div class="comment">
										<i class="far fa-comment-dots fa-2x"></i> 
										<span>5</span>
									</div>
								</div>
							</div>
						</div>
					</div>
					
					<!-- 2nd End  -->

					<div class="tab-pane" id="favorite">
						
						<h2 class="comment_none">작성한 댓글이 없습니다</h2>
						
					</div>
					<!-- 3rd End  -->

					</div>

				</div>
				<!-- mypage contents  -->
				


			</div>
		</div>
	</div>
	
	</div>
		
</section>
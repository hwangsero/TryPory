<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
<section class="mag-posts-area d-flex flex-wrap">

   <div class="mag-posts-content mt-30 mb-30 p-30 box-shadow">
       <!-- Trending Now Posts Area -->
       <div class="trending-now-posts mb-30 posts">
           <!-- Section Title -->


           <div class="favorite-diary">
           		<div class="main-category ">
          			<hr>
            		<h5 class="mb-70"><span>인기</span> 다이어리</h5>
           		</div>
          		<div class="main-content clr">
					<div id ="main-img">
						<img src="${pageContext.request.contextPath}/assets/img/main/main-img.jpg">
					</div>
					
					<div id ="main-text">
						<div class="main-detail">
							<span class="travel-period">기간 | 2019.01.01 - 2019.01.10</span>
							<span class="travel-point">오사카</span>
							<h2>제목입니다</h2>
							<span class="tag">#태그</span> <span class="tag">#태그</span> <span
								class="tag">#태그태그</span> <span class="tag">#태그태그</span> <span
								class="tag">#태그</span>
						</div>
						<div class="main-profile">
							<span class="profile_thumb"> <img class="thumb_default"
								src="https://img-pholar.pstatic.net/20171231_163/1514678074152X9488_JPEG/miya1220.jpg?type=fn80_80"
								onerror="this.src='https://ssl.pstatic.net/static/m/pholar/img/blank.png'"
								onclick="nclk(this,'sea*t.thumb','','');"> <span
								class="profile_thumb_mask"></span>
							</span> <span class="profile_name">최창규</span>
							<div class="travel-like">
								<i class="far fa-heart fa-2x"></i> <span class="like-count">15</span>
							</div>
						</div>
					</div>
					
					<div class="main-thumb-box clr">
						<div class="main-thumb"> 
							<img src="${pageContext.request.contextPath}/assets/img/main/main-img.jpg">
						</div>
						<div class="main-thumb"> 
							<img src="${pageContext.request.contextPath}/assets/img/main/main-img.jpg">
						</div>
						<div class="main-thumb"> 
							<img src="${pageContext.request.contextPath}/assets/img/main/main-img.jpg">
						</div>
						<div class="main-thumb"> 
							<img src="${pageContext.request.contextPath}/assets/img/main/main-img.jpg">
						</div>
					</div>
				</div>
           </div>
           

           
            <div class="favorite-tags">
           
           		<div class="main-category">
          			<hr>
            		<h5><span>인기</span> 태그</h5>
          	 	</div>
          		<div class="tags-container clr">
          			<div class="tag-box01 clr">
          				<div class="tag-top">
							<div class="tags tag1">
								<div class="blur"></div>
								<div class="img" style="background-image:url(${pageContext.request.contextPath}/assets/img/main/main-img.jpg);"></div>
								<h2>#겨울</h2>
							</div>
							<div class="tags tag2"> 
								<div class="blur"></div>
								<div class="img" style="background-image:url(${pageContext.request.contextPath}/assets/img/main/main-img.jpg);"></div>
								<h2>#겨울</h2>
							</div>
							</div>
						<div class="tag-bottom">
							<div class="tags tag3"> 
								<div class="blur"></div>
								<div class="img" style="background-image:url(${pageContext.request.contextPath}/assets/img/main/main-img.jpg);"></div>
								<h2>#겨울</h2>
							</div>
							<div class="tags tag4">
								<div class="blur"></div>
								<div class="img" style="background-image:url(${pageContext.request.contextPath}/assets/img/main/main-img.jpg);"></div>
								<h2>#겨울</h2>
							</div>
						</div>
					</div>
					<div class="tag-box02">
						<div class="blur"></div>
						<div class="img" style="background-image:url(${pageContext.request.contextPath}/assets/img/main/main-img.jpg);"></div>
						<h2>#겨울</h2>
					</div>
				</div>
           </div>
           
           

           <div class="all-diary clr">
           
           		<div class="main-category">
          			<hr>
            		<h5><span>전체</span> 다이어리</h5>
          	 	</div>
           
				<div class="all-diary-view">
					<div class="diary-box">
						<div class="img-box"><img src="${pageContext.request.contextPath}/assets/img/main/main-img.jpg"></div>
						<div class="text-box">
							<div class="travel-detail">
								<span class="travel-period">기간 | 2019.01.01 - 2019.01.10</span>
								<h2>제목입니다</h2>
								<span class="tag">#태그</span> <span class="tag">#태그</span> <span
									class="tag">#태그태그</span> <span class="tag">#태그태그</span> <span
									class="tag">#태그</span>
							</div>
							<div class="travle-profile">
								<span class="profile_thumb"> <img class="thumb_default"
									src="https://img-pholar.pstatic.net/20171231_163/1514678074152X9488_JPEG/miya1220.jpg?type=fn80_80"
									onerror="this.src='https://ssl.pstatic.net/static/m/pholar/img/blank.png'"
									onclick="nclk(this,'sea*t.thumb','','');"> <span
									class="profile_thumb_mask"></span>
								</span> <span class="profile_name">최창규</span>
								<div class="travel-like">
									<i class="far fa-heart fa-lg"></i> <span>15</span>
								</div>
							</div>
						</div>
					</div>
					<div class="diary-box">
						<div class="img-box"><img src="${pageContext.request.contextPath}/assets/img/main/main-img.jpg"></div>
						<div class="text-box">
							<div class="travel-detail">
								<span class="travel-period">기간 | 2019.01.01 - 2019.01.10</span>
								<h2>제목입니다</h2>
								<span class="tag">#태그</span> <span class="tag">#태그</span> <span
									class="tag">#태그태그</span> <span class="tag">#태그태그</span> <span
									class="tag">#태그</span>
							</div>
							<div class="travle-profile">
								<span class="profile_thumb"> <img class="thumb_default"
									src="https://img-pholar.pstatic.net/20171231_163/1514678074152X9488_JPEG/miya1220.jpg?type=fn80_80"
									onerror="this.src='https://ssl.pstatic.net/static/m/pholar/img/blank.png'"
									onclick="nclk(this,'sea*t.thumb','','');"> <span
									class="profile_thumb_mask"></span>
								</span> <span class="profile_name">최창규</span>
								<div class="travel-like">
									<i class="far fa-heart fa-lg"></i> <span>15</span>
								</div>
							</div>
						</div>
					</div>
					<div class="diary-box">
						<div class="img-box"><img src="${pageContext.request.contextPath}/assets/img/main/main-img.jpg"></div>
						<div class="text-box">
							<div class="travel-detail">
								<span class="travel-period">기간 | 2019.01.01 - 2019.01.10</span>
								<h2>제목입니다</h2>
								<span class="tag">#태그</span> <span class="tag">#태그</span> <span
									class="tag">#태그태그</span> <span class="tag">#태그태그</span> <span
									class="tag">#태그</span>
							</div>
							<div class="travle-profile">
								<span class="profile_thumb"> <img class="thumb_default"
									src="https://img-pholar.pstatic.net/20171231_163/1514678074152X9488_JPEG/miya1220.jpg?type=fn80_80"
									onerror="this.src='https://ssl.pstatic.net/static/m/pholar/img/blank.png'"
									onclick="nclk(this,'sea*t.thumb','','');"> <span
									class="profile_thumb_mask"></span>
								</span> <span class="profile_name">최창규</span>
								<div class="travel-like">
									<i class="far fa-heart fa-lg"></i> <span>15</span>
								</div>
							</div>
						</div>
					</div>
<!-- diary-box -->
				</div>
<!-- all-diary-view -->
			</div>
<!-- trending-posts -->
			
			
       </div>
       
		
	</div>
	<div id="background-img01">
		<img
			src="${pageContext.request.contextPath}/assets/img/main/main-img.jpg">
	</div>
	<div id="background-img02">
		<img
			src="${pageContext.request.contextPath}/assets/img/main/background-01.jpg">
	</div>

</section>
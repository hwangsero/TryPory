<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css">
<section class="mag-posts-area d-flex flex-wrap">
<script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-2.2.4.min.js"></script>
<script src="${pageContext.request.contextPath}/assets/js/jquery/jquery-3.3.1.min.js"></script>
<script>

</script>

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
						<img src="https://i.imgur.com/${bestDiary[0].cover_image }.jpg">
					</div>
					
					<div id ="main-text">
						<div class="main-thumb-box clr">
							<div class="main-thumb"> 
								<img src="https://i.imgur.com/${bestDiary[1].cover_image }.jpg">
							</div>
							<div class="main-thumb"> 
								<img src="https://i.imgur.com/${bestDiary[2].cover_image }.jpg">
							</div>
							<div class="main-thumb"> 
								<img src="https://i.imgur.com/${bestDiary[3].cover_image }.jpg">
							</div>
							<div class="main-thumb"> 
								<img src="https://i.imgur.com/${bestDiary[4].cover_image }.jpg">
							</div>
						</div>
						
						<div class="main-detail">
							<span class="travel-period">기간 | ${bestDiary[0].start_date } - ${bestDiary[0].end_date }</span>
						<!-- 	<span class="travel-point">오사카</span> -->
							<h2>${bestDiary[0].title }</h2>
							<c:if test="${not empty bestDiary[0].tag }">
								<c:set var="tags" value="${fn:split(bestDiary[0].tag,', ')}" />
								<c:forEach var="tag" items="${tags}" >
								       <span class="tag">${tag }</span>
								</c:forEach> 
								</c:if>
						</div>
						
						
						<div class="main-profile">
							<span class="profile_thumb"> <img class="thumb_default"
								src="https://	img-pholar.pstatic.net/20171231_163/1514678074152X9488_JPEG/miya1220.jpg?type=fn80_80"
								onerror="this.src='https://ssl.pstatic.net/static/m/pholar/img/blank.png'"
								onclick="nclk(this,'sea*t.thumb','','');"> <span
								class="profile_thumb_mask"></span>
							</span> 
							<span class="profile_name">${bestDiary[0].writer }</span>
							<div class="travel-like">
								<img src ="${pageContext.request.contextPath}/assets/img/heart-off.png"  class="heart-img">
								<span class="like-count">${bestDiary[0].likeCnt }</span>
							</div>
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
								<div class="img" style="background-image:url(${imageurls[0]});"></div>
								<a href="${pageContext.request.contextPath }/diary?keyword=${bestTag[0]}&type=tag"><h2>#${bestTag[0] }</h2></a>
							</div>
							<div class="tags tag2"> 
								<div class="blur"></div>
								<div class="img" style="background-image:url(${imageurls[1]});"></div>
								<a href="${pageContext.request.contextPath }/diary?keyword=${bestTag[1]}&type=tag"><h2>#${bestTag[1] }</h2></a>
							</div>
							</div>
						<div class="tag-bottom">
							<div class="tags tag3"> 
								<div class="blur"></div>
								<div class="img" style="background-image:url(${imageurls[2]});"></div>
								<a href="${pageContext.request.contextPath }/diary?keyword=${bestTag[2]}&type=tag"><h2>#${bestTag[2] }</h2></a>
							</div>
							<div class="tags tag4">
								<div class="blur"></div>
								<div class="img" style="background-image:url(${imageurls[3]});"></div>
								<a href="${pageContext.request.contextPath }/diary?keyword=${bestTag[3]}&type=tag"><h2>#${bestTag[3] }</h2></a>
							</div>
						</div>
					</div>
					<div class="tag-box02">
						<div class="blur"></div>
						<div class="img" style="background-image:url(${imageurls[4]});"></div>
						<a href="${pageContext.request.contextPath }/diary?keyword=${bestTag[4]}&type=tag"><h2>#${bestTag[4] }</h2></a>
					</div>
				</div>
           </div>
           
           

           <div class="all-diary clr">
           
           		<div class="main-category">
          			<hr>
            		<h5><span>전체</span> 다이어리</h5>
          	 	</div>
           
				<div class="all-diary-view">
				<c:forEach items="${ allList }" var="diary">
					<div class="diary-box">
						<div class="img-box"><a href="${pageContext.request.contextPath }/diary/${diary.no }"><img src="https://i.imgur.com/${diary.cover_image }.jpg"></a></div>
						<div class="text-box">
							<div class="travel-detail">
								<span class="travel-period">기간 | ${diary.start_date} - ${diary.end_date}</span>
								<h2>${ diary.title }</h2>
								<c:if test="${not empty diary.tag }">
								<c:set var="tags" value="${fn:split(diary.tag,', ')}" />
								<c:forEach var="tag" items="${tags}" >
								       <span class="tag">${tag }</span>
								</c:forEach> 
								</c:if>
								
								
							</div>
							<div class="travle-profile">
								<span class="profile_thumb"> <img class="thumb_default"
									src="https://img-pholar.pstatic.net/20171231_163/1514678074152X9488_JPEG/miya1220.jpg?type=fn80_80"
									onerror="this.src='https://ssl.pstatic.net/static/m/pholar/img/blank.png'"
									onclick="nclk(this,'sea*t.thumb','','');"> <span
									class="profile_thumb_mask"></span>
								</span> <span class="profile_name">${ diary.writer }</span>
								<div class="travel-like">
									<img src ="${pageContext.request.contextPath}/assets/img/heart-off.png" class="heart-img">
									<span class="like-count">${ diary.likeCnt }</span>
								</div>
							</div>
						</div>
					</div>
					</c:forEach>
					
<!-- diary-box -->
				</div>
<!-- all-diary-view -->
			</div>
<!-- trending-posts -->
			
			
       </div>
       
		
	</div>
	
<%-- 	<img src="${pageContext.request.contextPath}/assets/img/main/pre.png" class="main-btn pre"> --%>
<%--    	<img src="${pageContext.request.contextPath}/assets/img/main/next.png" class="main-btn next"> --%>
   
	
	<div id="background-img01">
		<div id="bg-img">
		<img src="https://i.imgur.com/${bestDiary[0].cover_image }.jpg">
		</div>
	</div>
	
	<div id="background-img02">
	</div>

</section>
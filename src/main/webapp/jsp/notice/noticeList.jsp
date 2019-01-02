<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/head.jsp"%>
<!--공지사항 목록페이지 css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/notice/notice.css">
<!--공지사항 목록페이지 모바일 css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/notice/notice_mobile.css">

<script>
	$(document).ready(function() {
		$('#searchBtn').click(function(e) {
			e.preventDefault();
			location.href= '${pageContext.request.contextPath}/notice/search/1/' + $("form[name=searchForm] select[name=searchType]").val() + '/' + $("form[name=searchForm] input[name=searchWord]").val()
				
		})
	})

</script>

</head>

<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>

	<!-- 1. 공지사항 전체영역 -->
	<div class="Notice-Box">
		<!--2. 공지사항 머리말-->
		<div class="type1">
			<h1>공지사항</h1>
			<div class="type1-1">
				<h2>
					전체<span>${noticeCnt }</span>건
				</h2>
				<div class="type1-2">
					<a href="<%=request.getContextPath()%>/jsp/notice/notice-write.jsp">
						<img
						src="<%=request.getContextPath()%>/assets/img/notice-img/notice_write_button-01.png">
						<h2>글쓰기</h2>
					</a>
				</div>
			</div>
		</div>

		<!--END 2. 공지사항 머리말  -->

		<!--3. 공지사항 머리말 하단-->
		<form name="searchForm" >
		<div class="type2">
				<div class="search-box">
					<input type="text" name="searchWord" placeholder="검색어 입력">
					<button id="searchBtn">
						<h2>검색</h2>
					</button>
				</div>

				<select name="searchType">
					<option value="all">전체</option>
					<option value="writer">작성자</option>
					<option value="title">제목</option>
					<option value="content">내용</option>
				</select>
		</div>
		</form>
		<!--END 3.공지사항 머리말 하단-->

		<!--4. 공지사항 테이블 -->
		<table class="type3">
			<thead>
				<tr>
					<th scope="cols">번호</th>
					<th scope="cols">제목</th>
					<th scope="cols">등록일</th>
					<th scope="cols">조회수</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach items="${noticeVO }" var="notice">
				<tr>
					<th scope="row">${notice.no }</th>
					<td><a
						href="${pageContext.request.contextPath }/notice/detail/${notice.no}/1">${notice.title }</a></td>
					<td>${notice.registerDate}</td>
					<td>${notice.viewCnt}</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>


		<!--5. 페이징 번호 관련-->
		<div class="paging">
			<ul>
			<c:if test="${empty type }">
			<c:choose>
			<c:when test="${pagination.curPage > 1 }">
			<a href="${pageContext.request.contextPath }/notice/1"><button>최좌측</button></a>
			</c:when>
			<c:otherwise>
			<a href="#"><button>최좌측</button></a>
			</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test="${pagination.curRange > 1 }">
			<a href="${pageContext.request.contextPath }/notice/${start - 1}"><button>좌측</button></a>
			</c:when>
			<c:otherwise>
			<a href="#"><button>좌측</button></a>
			</c:otherwise>
			</c:choose>
			<c:forEach begin="${start }" end="${end}" var="pageNo">
			
				<li><a href="${pageContext.request.contextPath }/notice/${pageNo}">
				
				<c:choose>
				<c:when test="${pagination.curPage eq pageNo }">
				<strong>${ pageNo }</strong>
				</c:when>
				<c:otherwise>
				${ pageNo }
				</c:otherwise>
				</c:choose>
				
				</a></li>
				</c:forEach> 
			<c:choose>
			<c:when test="${pagination.rangeCnt gt pagination.curRange }">
			<a href="${pageContext.request.contextPath }/notice/${end + 1}"><button>우측</button></a>
			</c:when>
			<c:otherwise>
			<a href="#"><button>우측</button></a>
			</c:otherwise>
			</c:choose>

			<c:choose>
			<c:when test="${pagination.curPage < pagination.pageCnt }">
			<a href="${pageContext.request.contextPath }/notice/${pagination.pageCnt}"><button>최우측</button></a>
			</c:when>
			<c:otherwise>
			<a href="#"><button>최우측</button></a>
			</c:otherwise>
			</c:choose>
			</c:if>
			
			
			<c:if test="${not empty type }">
			<c:choose>
			<c:when test="${pagination.curPage > 1 }">
			<a href="${pageContext.request.contextPath }/notice/search/1/${type}/${word}"><button>최좌측</button></a>
			</c:when>
			<c:otherwise>
			<a href="#"><button>최좌측</button></a>
			</c:otherwise>
			</c:choose>
			
			<c:choose>
			<c:when test="${pagination.curRange > 1 }">
			<a href="${pageContext.request.contextPath }/notice/search/${start - 1}/${type}/${word}"><button>좌측</button></a>
			</c:when>
			<c:otherwise>
			<a href="#"><button>좌측</button></a>
			</c:otherwise>
			</c:choose>
			<c:forEach begin="${start }" end="${end}" var="pageNo">
			
				<li><a href="${pageContext.request.contextPath }/notice/search/${pageNo}/${type}/${word}">
				
				<c:choose>
				<c:when test="${pagination.curPage eq pageNo }">
				<strong>${ pageNo }</strong>
				</c:when>
				<c:otherwise>
				${ pageNo }
				</c:otherwise>
				</c:choose>
				
				</a></li>
				</c:forEach> 
			<c:choose>
			<c:when test="${pagination.rangeCnt gt pagination.curRange }">
			<a href="${pageContext.request.contextPath }/notice/search/${end + 1}/${type}/${word}"><button>우측</button></a>
			</c:when>
			<c:otherwise>
			<a href="#"><button>우측</button></a>
			</c:otherwise>
			</c:choose>

			<c:choose>
			<c:when test="${pagination.curPage < pagination.pageCnt }">
			<a href="${pageContext.request.contextPath }/notice/search/${pagination.pageCnt}/${type}/${word}"><button>최우측</button></a>
			</c:when>
			<c:otherwise>
			<a href="#"><button>최우측</button></a>
			</c:otherwise>
			</c:choose>
			</c:if>
			
			
			</ul>
		</div>
		<!--END 5. 페이징 번호 관련 -->
	<!--END 1. 공지사항 전체영역 -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>
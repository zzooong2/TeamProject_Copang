<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<%@ include file="/views/common/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="../../resources/css/category/category.css">
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>


	<main class="main">

		<div class="bar">
			<p>
				<a href="/">홈</a> ><a href="/category/list.do?type=ITㆍ프로그래밍&cPage=1">IT/프로그래밍</a>
				<%-- 
				<c:choose>
				<c:if test="/category/list.do?type=ITㆍ프로그래밍&middleCategory=UX 기획&cPage=1">
					<p> UX 기획</p>
				</c:if>
				<c:otherwise>
				
				</c:otherwise>
				</c:choose> 
				--%>
			</p>
		</div>

		<!-- 카테고리 목록 모음 -->

		<div class="category_area">
			<ul>
				<a
					href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=UX 기획&cPage=1">UX
					기획</a>
				<li><a
					href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=UX 기획&subCategory=스토리보드&cPage=1">스토리보드</a></li>
				<li><a
					href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=UX 기획&subCategory=기타 기획&cPage=1">기타
						기획</a></li>
			</ul>
			<ul>
				<a href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=웹&cPage=1">웹</a>
				<li><a
					href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=웹&subCategory=홈페이지&cPage=1">홈페이지</a></li>
				<li><a
					href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=웹&subCategory=퍼블리싱&cPage=1">퍼블리싱</a></li>
				<li><a
					href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=웹&subCategory=유지보수&cPage=1">유지보수</a></li>
			</ul>
			<ul>
				<a
					href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=프로그램&cPage=1">프로그램</a>
				<li><a
					href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=프로그램&subCategory=PCㆍ웹프로그램&cPage=1">PCㆍ웹프로그램</a></li>
				<li><a
					href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=프로그램&subCategory=서버ㆍ클라우드&cPage=1">서버ㆍ클라우드</a></li>
				<li><a
					href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=프로그램&subCategory=봇ㆍ챗봇&cPage=1">봇ㆍ챗봇</a></li>
			</ul>
			<ul>
				<a href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=커머스&cPage=1">커머스</a>
				<li><a
					href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=커머스&subCategory=쇼핑몰&cPage=1">쇼핑몰</a></li>
				<li><a
					href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=커머스&subCategory=쇼핑몰(웹빌더ㆍCMS)&cPage=1">쇼핑몰(웹빌더ㆍCMS)</a></li>
				<li><a
					href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=커머스&subCategory=쇼핑몰(카페24)&cPage=1">쇼핑몰(카페24)</a></li>
				<li><a
					href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=커머스&subCategory=쇼핑몰 수정ㆍ유지보수&cPage=1">쇼핑몰
						수정ㆍ유지보수</a></li>
			</ul>
		</div>



		<!-- 카테고리 게시글 모음 -->

		<div class="detail_area" style="position: relative;">

			<!-- grid 전체 -->
			<div class="thumb_container">

				<c:forEach var="item" items="${list}">
					<!-- setAttribute에서 작성한 이름 -->

					<!-- grid 개별 영역 -->
					<div class="detail_thumb" onclick="location.href='..'">
						<div class="thumb_space">
							<!-- item.DTO의 변수명 -->
							<img
								src="${pageContext.request.contextPath}/resources/upload/main/${item.fileName}"
								alt="">
							<p>${item.boardTitle}</p>
						</div>

						<!-- 별점 -->
						<div class="star_score">
							<img src="/resources/img/star.png" alt="">
							<p>(4.9)</p>
						</div>

						<!-- 가격 -->
						<div class="price">
							<c:choose>
								<c:when test="${item.priceOption == 'single'}">
									<p>${item.price}원</p>
								</c:when>
								<c:otherwise>
									<p>${item.price}원~</p>
								</c:otherwise>
							</c:choose>
						</div>

						<!-- 회사명 -->
						<div class="company_name">
							<p>${item.company}</p>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>

		<div aria-label="Page navigation example"
			style="background-color: white;">

			<ul class="pagination"
				style="justify-content: center; list-style: none; display: flex; margin: 0 auto; padding: 0; text-align: center; position: absolute; right: 40%; bottom: -30%;">
				<!-- 왼쪽 버튼 -->
				<c:choose>
					<c:when test="${pi.cPage == 1}">
						<li class="page-item" style="margin-right: 20px"><a
							class="page-link" href="#" aria-label="Previous"> <span
								aria-hidden="true">&laquo;</span>
						</a></li>
					</c:when>

					<c:otherwise>
						<li class="page-item" style="margin-right: 20px"><a
							class="page-link"
							href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=${middleCategory}&subCategory=${subCategory}&cPage=${pi.cPage-1}"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>

				<!-- 
               페이지 버튼 
               for(int i=0; i<10; i++) {  } 
            -->
				<c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
					<li class="page-item" style="margin-right: 20px"><a
						class="page-link"
						href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=${middleCategory}&subCategory=${subCategory}&cPage=${page}">${page}</a></li>
				</c:forEach>

				<!-- 오른쪽 버튼 -->
				<c:choose>
					<c:when test="${pi.cPage == pi.maxPage}">
						<li class="page-item" style="margin-right: 20px">
						<a class="page-link" href="#" aria-label="Next"> 
						<span aria-hidden="true">&raquo;</span>
						</a>
						</li>
					</c:when>

					<c:otherwise>
						<li class="page-item" style="margin-right: 20px"><a
							class="page-link"
							href="/category/list.do?type=ITㆍ프로그래밍&middleCategory=${middleCategory}&subCategory=${subCategory}&cPage=${pi.cPage+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>

			</ul>
		</div>
	</main>

	<%@ include file="/views/common/footer.jsp"%>

</body>
</html>
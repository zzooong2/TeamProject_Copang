<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<%@ include file="/views/common/head.jsp"%>
<link rel="stylesheet" type="text/css"
	href="/resources/css/category/category.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="/resources/js/categoryList/categoryList.js"></script>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>


	<main class="main">

		<div class="bar">
			<p>
				<a href="/">홈</a> ><a href="/category/list.do?type=IT·프로그래밍&middleCategory=&subCategory=&cPage=${cPage}">IT·프로그래밍</a>
				<c:if test="${not empty middleCategory}"> 
				><a href="/category/list.do?type=IT·프로그래밍&middleCategory=${middleCategory}&subCategory=&cPage=${cPage}">${middleCategory}</a>
				</c:if>
				<c:if test="${not empty subCategory}">
				><a href="/category/list.do?type=IT·프로그래밍&middleCategory=${middleCategory}&subCategory=${subCategory}&cPage=${cPage}">${subCategory}</a>
				</c:if>
			</p>
		</div>

		<!-- 카테고리 목록 모음 -->

		<div class="category_area">
			<!-- data-(Attribute값) -->
			<p class="Middle_Category" data-type="IT·프로그래밍" data-middle="UX기획" data-page="1">UX기획</p>
			
			<p class="Subcat_Category" data-type="IT·프로그래밍" data-middle="UX기획" data-sub="스토리보드" data-page="1">스토리보드 </p>
			<p class="Subcat_Category" data-type="IT·프로그래밍" data-middle="UX기획" data-sub="기타 기획" data-page="1">기타 기획</p>
			<br>
			<p class="Middle_Category" data-type="IT·프로그래밍" data-middle="웹" data-page="1">웹</p>
			
			<p class="Subcat_Category" data-type="IT·프로그래밍" data-middle="웹" data-sub="홈페이지" data-page="1">홈페이지</p>
			<p class="Subcat_Category" data-type="IT·프로그래밍" data-middle="웹" data-sub="퍼블리싱" data-page="1">퍼블리싱</p>
			<p class="Subcat_Category" data-type="IT·프로그래밍" data-middle="웹" data-sub="유지보수" data-page="1">유지보수</p>
			<br>
			<p class="Middle_Category" data-type="IT·프로그래밍" data-middle="프로그램" data-page="1">프로그램</p>
			
			<p class="Subcat_Category" data-type="IT·프로그래밍" data-middle="프로그램" data-sub="PC·웹프로그램" data-page="1">PC·웹프로그램</p>
			<p class="Subcat_Category" data-type="IT·프로그래밍" data-middle="프로그램" data-sub="서버·클라우드" data-page="1">서버·클라우드</p>
			<p class="Subcat_Category" data-type="IT·프로그래밍" data-middle="프로그램" data-sub="봇·챗봇" data-page="1">봇·챗봇</p>
			<br>
			<p class="Middle_Category" data-type="IT·프로그래밍" data-middle="커머스" data-page="1">커머스</p>
			
			<p class="Subcat_Category" data-type="IT·프로그래밍" data-middle="커머스" data-sub="쇼핑몰" data-page="1">쇼핑몰</p>
			<p class="Subcat_Category" data-type="IT·프로그래밍" data-middle="커머스" data-sub="쇼핑몰(웹빌더·CMS)" data-page="1">쇼핑몰(웹빌더·CMS)</p>
			<p class="Subcat_Category" data-type="IT·프로그래밍" data-middle="커머스" data-sub="쇼핑몰(카페24)" data-page="1">쇼핑몰(카페24)</p>
			<p class="Subcat_Category" data-type="IT·프로그래밍" data-middle="커머스" data-sub="쇼핑몰 수정·유지보수" data-page="1">쇼핑몰 수정·유지보수</p>

		</div>



		<!-- 카테고리 게시글 모음 -->
		<div class="detail_area" style="position: relative;">

			<!-- grid 전체 -->
			<div class="thumb_container">
				<c:choose>
					<c:when test="${not empty tCategory}">
						<c:forEach var="item" items="${tCategory}">
							<!-- setAttribute에서 작성한 이름 -->
							<!-- grid 개별 영역 -->
							<div class="detail_thumb"
								onclick="location.href='/BoardPro/Detail.do?boardNo=${item.boardNo}'">
								<div class="thumb_space">
									<!-- item.DTO의 변수명 -->
									<img
										src="${pageContext.request.contextPath}/resources/upload/main/${item.fileName}"
										alt="${item.fileName}">
									<p>${item.boardTitle}</p>
								</div>
								<!-- 별점 -->
								<div class="star_score">
									<img src="/resources/img/star.png" alt="">
									<p>(4.9)</p>
								</div>
								<!-- 가격 -->
								<div class="price">
									<c:if test="${item.priceOption == 'SINGLE'}">
										<p>${item.price}원</p>
									</c:if>
									<c:if test="${item.priceOption == 'STANDARD'}">
										<p>${item.price}원~</p>
									</c:if>
								</div>
								<!-- 회사명 -->
								<div class="company_name">
									<p>${item.company}</p>
								</div>
							</div>
						</c:forEach>
					</c:when>

					<c:when test="${not empty sCategory}">
						<c:forEach var="item" items="${sCategory}">
							<!-- setAttribute에서 작성한 이름 -->
							<!-- grid 개별 영역 -->
							<div class="detail_thumb"
								onclick="location.href='/BoardPro/Detail.do?boardNo=${item.boardNo}'">
								<div class="thumb_space">
									<!-- item.DTO의 변수명 -->
									<img
										src="${pageContext.request.contextPath}/resources/upload/main/${item.fileName}"
										alt="${item.fileName}">
									<p>${item.boardTitle}</p>
								</div>
								<!-- 별점 -->
								<div class="star_score">
									<img src="/resources/img/star.png" alt="">
									<p>(4.9)</p>
								</div>
								<!-- 가격 -->
								<div class="price">
									<c:if test="${item.priceOption == 'SINGLE'}">
										<p>${item.price}원</p>
									</c:if>
									<c:if test="${item.priceOption == 'STANDARD'}">
										<p>${item.price}원~</p>
									</c:if>
								</div>
								<!-- 회사명 -->
								<div class="company_name">
									<p>${item.company}</p>
								</div>
							</div>
						</c:forEach>
					</c:when>

					<c:when test="${not empty fCategory}">
						<c:forEach var="item" items="${fCategory}">
							<!-- setAttribute에서 작성한 이름 -->
							<!-- grid 개별 영역 -->
							<div class="detail_thumb"
								onclick="location.href='/BoardPro/Detail.do?boardNo=${item.boardNo}'">
								<div class="thumb_space">
									<!-- item.DTO의 변수명 -->
									<img
										src="${pageContext.request.contextPath}/resources/upload/main/${item.fileName}"
										alt="${item.fileName}">
									<p>${item.boardTitle}</p>
								</div>
								<!-- 별점 -->
								<div class="star_score">
									<img src="/resources/img/star.png" alt="">
									<p>(4.9)</p>
								</div>
								<!-- 가격 -->
								<div class="price">
									<c:if test="${item.priceOption == 'SINGLE'}">
										<p>${item.price}원</p>
									</c:if>
									<c:if test="${item.priceOption == 'STANDARD'}">
										<p>${item.price}원~</p>
									</c:if>
								</div>
								<!-- 회사명 -->
								<div class="company_name">
									<p>${item.company}</p>
								</div>
							</div>
						</c:forEach>
					</c:when>
				</c:choose>
			</div>
		</div>

		<div aria-label="Page navigation example"
			style="background-color: white;">
			
			
			<ul class="pagination"
				style="justify-content: center; list-style: none; display: flex; margin: 0 auto; padding: 0; text-align: center; position: absolute; right: 40%; bottom: -5%;">
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
							href="/category/list.do?type=IT·프로그래밍&middleCategory=${middleCategory}&subCategory=${subCategory}&cPage=${pi.cPage-1}"
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
						href="/category/list.do?type=IT·프로그래밍&middleCategory=${middleCategory}&subCategory=${subCategory}&cPage=${page}">${page}</a></li>
				</c:forEach>

				<!-- 오른쪽 버튼 -->
				<c:choose>
					<c:when test="${pi.cPage == pi.maxPage}">
						<li class="page-item" style="margin-right: 20px"><a
							class="page-link" href="#" aria-label="Next"> <span
								aria-hidden="true">&raquo;</span>
						</a></li>
					</c:when>

					<c:otherwise>
						<li class="page-item" style="margin-right: 20px"><a
							class="page-link"
							href="/category/list.do?type=IT·프로그래밍&middleCategory=${middleCategory}&subCategory=${subCategory}&cPage=${pi.cPage+1}"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</c:otherwise>
				</c:choose>


			</ul>
		</div>
		<c:if test="${sessionScope.partCode == 2}">
		<button class="Page_enroll"
			onclick="location.href='/views/board/boardProEnroll.jsp'">등록</button>
		</c:if>
	</main>

	<%@ include file="/views/common/footer.jsp"%>

</body>
</html>


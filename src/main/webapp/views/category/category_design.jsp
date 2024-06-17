<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
				<a href="/">홈</a> ><a
					href="/category/list.do?type=디자인&middleCategory=&subCategory=">디자인</a>
				<c:if test="${not empty middleCategory}"> 
				><a href="/category/list.do?type=디자인&middleCategory=${middleCategory}&subCategory=">${middleCategory}</a>
				</c:if>
				<c:if test="${not empty subCategory}">
				><a href="/category/list.do?type=디자인&middleCategory=${middleCategory}&subCategory=${subCategory}">${subCategory}</a>
				</c:if>
			</p>
		</div>

		<!-- 카테고리 목록 모음 -->

		<div class="category_area">

			<p class="Middle_Category" data-type="디자인" data-middle="로고·브랜딩" data-page="1">로고·브랜딩</p>
			
			<p class="Subcat_Category" data-type="디자인" data-middle="로고·브랜딩" data-sub="로고 디자인" data-page="1">로고 디자인</p>
			<p class="Subcat_Category" data-type="디자인" data-middle="로고·브랜딩" data-sub="브랜드 디자인 가이드" data-page="1">브랜드 디자인 가이드</p>
			<br>
			<p class="Middle_Category" data-type="디자인" data-middle="인쇄 홍보물" data-page="1">인쇄 홍보물</p>
			
			<p class="Subcat_Category" data-type="디자인" data-middle="인쇄 홍보물" data-sub="명함" data-page="1">명함</p>
			<p class="Subcat_Category" data-type="디자인" data-middle="인쇄 홍보물" data-sub="전단지·포스터·인쇄물" data-page="1">전단지·포스터·인쇄물</p>
			<p class="Subcat_Category" data-type="디자인" data-middle="인쇄 홍보물" data-sub="현수막·X배너" data-page="1">현수막·X배너</p>
			<p class="Subcat_Category" data-type="디자인" data-middle="인쇄 홍보물" data-sub="메뉴판" data-page="1">메뉴판</p>
			<br>
			<p class="Middle_Category" data-type="디자인" data-middle="마케팅 디자인" data-page="1">마케팅 디자인</p>
			
			<p class="Subcat_Category" data-type="디자인" data-middle="마케팅 디자인" data-sub="상세페이지" data-page="1">상세페이지</p>
			<p class="Subcat_Category" data-type="디자인" data-middle="마케팅 디자인" data-sub="SNS·썸네일 디자인" data-page="1">SNS·썸네일 디자인</p>
			<p class="Subcat_Category" data-type="디자인" data-middle="마케팅 디자인" data-sub="채널아트 디자인" data-page="1">채널아트 디자인</p>
			<p class="Subcat_Category" data-type="디자인" data-middle="마케팅 디자인" data-sub="방송용 아바타" data-page="1">방송용 아바타</p>
			<p class="Subcat_Category" data-type="디자인" data-middle="마케팅 디자인" data-sub="배너·배달어플" data-page="1">배너·배달어플</p>
			<p class="Subcat_Category" data-type="디자인" data-middle="마케팅 디자인" data-sub="블로그·카페 디자인" data-page="1">블로그·카페 디자인</p>
			<br>
			<p class="Middle_Category" data-type="디자인" data-middle="웹·모바일 디자인" data-page="1">웹·모바일 디자인</p>
			
			<p class="Subcat_Category" data-type="디자인" data-middle="웹·모바일 디자인" data-sub="명함" data-page="1">명함</p>
			<p class="Subcat_Category" data-type="디자인" data-middle="웹·모바일 디자인" data-sub="전단지·포스터·인쇄물" data-page="1">전단지·포스터·인쇄물</p>
			<p class="Subcat_Category" data-type="디자인" data-middle="웹·모바일 디자인" data-sub="현수막·X배너" data-page="1">현수막·X배너</p>
			<p class="Subcat_Category" data-type="디자인" data-middle="웹·모바일 디자인" data-sub="메뉴판" data-page="1">메뉴판</p>
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
				style="justify-content: center; list-style: none; display: flex; margin: 0 auto; padding: 0; text-align: center; position: absolute; right: 41%; bottom: -30%;">
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
							href="/category/list.do?type=디자인&middleCategory=${middleCategory}&subCategory=${subCategory}&cPage=${pi.cPage-1}"
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
						href="/category/list.do?type=디자인&middleCategory=${middleCategory}&subCategory=${subCategory}&cPage=${page}">${page}</a></li>
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
							href="/category/list.do?type=디자인&middleCategory=${middleCategory}&subCategory=${subCategory}&cPage=${pi.cPage+1}"
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
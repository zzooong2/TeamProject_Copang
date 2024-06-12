<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
				<a href="/">홈</a> ><a href="/category/list.do?type=마케팅&cPage=1">마케팅</a>
				<c:if test="${middleCategory != null}"> 
				 ><a href="/category/list.do?type=마케팅&middleCategory=${middleCategory}&cPage=1">${middleCategory}</a>
				</c:if>
				<c:if test="${subCategory != null}">
				 ><a href="">${subCategory}</a>
				</c:if>
			</p>
		</div>

		<!-- 카테고리 목록 모음 -->

		<div class="category_area">
			<ul>
				<a href="/category/list.do?type=마케팅&middleCategory=채널 활성화&cPage=1">채널
					활성화</a>
				<li><a
					href="/category/list.do?type=마케팅&middleCategory=채널 활성화&subCategory=블로그 관리&cPage=1">블로그
						관리</a></li>
				<li><a
					href="/category/list.do?type=마케팅&middleCategory=채널 활성화&subCategory=카페 관리&cPage=1">카페
						관리</a></li>
				<li><a
					href="/category/list.do?type=마케팅&middleCategory=채널 활성화&subCategory=인스타그램 관리&cPage=1">인스타그램
						관리</a></li>
				<li><a
					href="/category/list.do?type=마케팅&middleCategory=채널 활성화&subCategory=유튜브 관리&cPage=1">유튜브
						관리</a></li>
			</ul>
			<ul>
				<a href="/category/list.do?type=마케팅&middleCategory=바이럴ㆍ체험단&cPage=1">바이럴ㆍ체험단</a>
				<li><a
					href="/category/list.do?type=마케팅&middleCategory=바이럴ㆍ체험단&subCategory=체험단ㆍ기자단&cPage=1">체험단ㆍ기자단</a></li>
				<li><a
					href="/category/list.do?type=마케팅&middleCategory=바이럴ㆍ체험단&subCategory=개인 인플루언서&cPage=1">개인
						인플루언서</a></li>
				<li><a
					href="/category/list.do?type=마케팅&middleCategory=바이럴ㆍ체험단&subCategory=바이럴ㆍ포스팅&cPage=1">바이럴ㆍ포스팅</a></li>
			</ul>
			<ul>
				<a href="/category/list.do?type=마케팅&middleCategory=PRㆍ행사&cPage=1">PRㆍ행사</a>
				<li><a
					href="/category/list.do?type=마케팅&middleCategory=PRㆍ행사&subCategory=언론홍보&cPage=1">언론홍보</a></li>
				<li><a
					href="/category/list.do?type=마케팅&middleCategory=PRㆍ행사&subCategory=행사ㆍ이벤트&cPage=1">행사ㆍ이벤트</a></li>
			</ul>
			<ul>
				<a href="/category/list.do?type=마케팅&middleCategory=업종ㆍ목적별&cPage=1">업종ㆍ목적별</a>
				<li><a
					href="/category/list.do?type=마케팅&middleCategory=업종ㆍ목적별&subCategory=종합광고대행&cPage=1">종합광고대행</a></li>
				<li><a
					href="/category/list.do?type=마케팅&middleCategory=업종ㆍ목적별&subCategory=스토어 마케팅&cPage=1">스토어
						마케팅</a></li>
				<li><a
					href="/category/list.do?type=마케팅&middleCategory=업종ㆍ목적별&subCategory=지도 마케팅&cPage=1">지도
						마케팅</a></li>
				<li><a
					href="/category/list.do?type=마케팅&middleCategory=업종ㆍ목적별&subCategory=라이브커머스&cPage=1">라이브커머스</a></li>
			</ul>
		</div>

		<!-- 카테고리 게시글 모음 -->

		<div class="detail_area" style="position: relative;">

			<!-- grid 전체 -->
			<div class="thumb_container">
				<c:forEach var="item" items="${list}">
					<!-- grid 개별 영역 -->
					<div class="detail_thumb" onclick="location.href=''">
						<div class="thumb_space">
							<img src="../Semiproject(SH)/img/${item.fileName}" alt="">
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
								<c:when test="${item.priceOption == single}">
									<p>${item.price}</p>
								</c:when>
								<c:otherwise>
									<p>${item.price}~</p>
								</c:otherwise>
							</c:choose>
						</div>

						<!-- 회사명 -->
						<div class="company_name">
							<p>${item.company}</p>
						</div>
					</div>

				</c:forEach>

				<!-- grid 개별 영역 -->
				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb2.jpg" alt="">
						<p>로고제작 전문기업</p>
					</div>

					<!-- 별점 -->
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					<!-- 가격 -->
					<div class="price">
						<p>150,000 ~</p>
					</div>

					<!-- 회사명 -->
					<div class="company_name">
						<p>지구컴즈</p>
					</div>
				</div>

				<!-- grid 개별 영역 -->
				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb3.jpg" alt="">
						<p>로고제작 랭킹 1위 어워즈 수상</p>
					</div>

					<!-- 별점 -->
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.7)</p>
					</div>

					<!-- 가격 -->
					<div class="price">
						<p>70,000 ~</p>
					</div>

					<!-- 회사명 -->
					<div class="company_name">
						<p>앨리스 디자인</p>
					</div>
				</div>

				<!-- grid 개별 영역 -->
				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>

					<!-- 별점 -->
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					<!-- 가격 -->
					<div class="price">
						<p>55,000 ~</p>
					</div>

					<!-- 회사명 -->
					<div class="company_name">
						<p>에브리 PPT</p>
					</div>
				</div>

				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>

					<!-- 별점 -->
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					<!-- 가격 -->
					<div class="price">
						<p>55,000 ~</p>
					</div>

					<!-- 회사명 -->
					<div class="company_name">
						<p>에브리 PPT</p>
					</div>
				</div>

				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>

					<!-- 별점 -->
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					<!-- 가격 -->
					<div class="price">
						<p>55,000 ~</p>
					</div>

					<!-- 회사명 -->
					<div class="company_name">
						<p>에브리 PPT</p>
					</div>
				</div>

				<div class="detail_thumb" onclick="location.href='..'">
					<div class="thumb_space">
						<img src="../Semiproject(SH)/img/thumb4.jpg" alt="">
						<p>초고속 ppt 제작</p>
					</div>

					<!-- 별점 -->
					<div class="star_score">
						<img src="/resources/img/star.png" alt="">
						<p>(4.9)</p>
					</div>

					<!-- 가격 -->
					<div class="price">
						<p>55,000 ~</p>
					</div>

					<!-- 회사명 -->
					<div class="company_name">
						<p>에브리 PPT</p>
					</div>
				</div>

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
							href="/category/list.do?type=마케팅&middleCategory=${middleCategory}&subCategory=${subCategory}&cPage=${pi.cPage-1}"
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
						href="/category/list.do?type=마케팅&middleCategory=${middleCategory}&subCategory=${subCategory}&cPage=${page}">${page}</a></li>
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
							href="/category/list.do?type=마케팅&middleCategory=${middleCategory}&subCategory=${subCategory}&cPage=${pi.cPage+1}"
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
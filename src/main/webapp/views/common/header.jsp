<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div class="header_group">
	<header class="header_all">
		<ul class="top_menu">
			<li>분야 카테고리
				<ul class="sub_menu">
					<li><a href="#">IT/프로그래밍</a></li>
					<li><a href="#">디자인</a></li>
					<li><a href="#">영상/사진</a></li>
					<li><a href="#">마케팅</a></li>
					<li><a href="#">교육</a></li>
				</ul>
			</li>
		</ul>
		<!-- 로고 -->
		<a href="/">
		<img class="Logo" src="/resources/img/Logo.png" alt="logo">
		</a>
		<!-- Search(돋보기) -->

		<form class="search-box" method="" class="formSetting">
			<input class="search-txt" type="text" name="searchTxt" value="">
			<button class="search-btn" type="submit">
				<i class="fa-solid fa-magnifying-glass" style="color: #ff8e47;"></i>
			</button>
		</form>
		<!-- 네비게이션 -->
		<div class="nav">


	<c:choose>
	
		<c:when test="${sessionScope.userId != null}">
			<!-- <li class="my_page" style="display: none;"><a href="#">마이페이지</a><li> -->
			
			<!-- <li class="log_out" style="display: none;"><a href="#">로그아웃</a></li> -->
		</c:when>
		
		<c:otherwise>
			<li class="login"><a href="/views/member/login.jsp">로그인</a></li>

			<li class="register"><a href="/views/member/register.jsp">회원가입</a></li>
		</c:otherwise>
	
	</c:choose>

		</div>
	</header>
</div>
<!-- 헤더 구분 선 -->
<hr>

<!-- jstl -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CoPang</title>
    
	<%@ include file="/views/common/head.jsp"%>
	
	<link rel="stylesheet" href="/resources/css/customerService/customerService/customerServiceList.css">
	
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
	<main class="main">
        <section class="board-section">
        <div class="page-navigation">
            Copang  >  고객센터
        </div>

        <div class="notice-title">
            Customer Service
        </div>
       
       	<form action="/customerService/list.do" method="GET">
       		<input type="hidden" name="cPage" value="1" />
			<select name="category" class="category-select">
				<option value="Q_TITLE">제목</option>
				<option value="Q_CONTENTS">내용</option>
				<option value="USER_NAME">작성자</option>
			</select>
	        <input type="text" id="serach-keyword" name="search-text" class="search" placeholder="검색할 키워드를 입력해주세요.">
			<button type="submit" class="customer-search-btn">검 색</button>			
		</form>
		<c:if test="${sessionScope.userName != null}">
			<button class="write-notice" type="button" onclick="location.href='/form/customerServiceEnrollForm.do'">글쓰기</button>
		</c:if>
		<br><br><br><br><br><br>
		
        <div class="board-table">
            <table>
                <thead>
                    <tr>
                        <td>고객센터</td>
                    </tr>
                </thead>
                <tbody>
                	<c:choose>
                		<c:when test="${empty list}">
		                    <tr>
		                        <td>등록된 글이 없습니다.</td>
		                    </tr>
	                    </c:when>
	                    <c:otherwise>
	                    	<c:forEach var="item" items="${list}"> 
			                    <tr onclick="location.href='/customerService/detail.do?boardNo=${item.boardNo}'">
			                        <td>${item.boardTitle}</td>
			                    </tr>
		                    </c:forEach>
	                    </c:otherwise>
                    </c:choose>
                </tbody>
            </table>
        </div>
		
        <nav aria-label="Page navigation example">
            <ul class="pagination">
            	<!-- 왼쪽 버튼 -->
                <c:choose>
                	<c:when test="${pi.cPage == 1}">
                		<li class="page-item"><a class="page-link" href="#">Previous</a></li>
                	</c:when>
                	<c:otherwise>
		                <li class="page-item"><a class="page-link" href="/customerService/list.do?cPage=${pi.cPage-1}&category=Q_TITLE&search-text=">Previous</a></li>
                	</c:otherwise>
                </c:choose>
                
                <!-- 페이지 버튼 -->
                <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
	                <li class="page-item"><a class="page-link" href="/customerService/list.do?cPage=${page}&category=Q_TITLE&search-text=">${page}</a></li>
                </c:forEach>

				<!-- 오른쪽 버튼 -->
				<c:choose>
					<c:when test="${pi.cPage == pi.maxPage}">
		                <li class="page-item"><a class="page-link" href="#">Next</a></li>
					</c:when>
					<c:otherwise>
		                <li class="page-item"><a class="page-link" href="/customerService/list.do?cPage=${pi.cPage+1}&category=Q_TITLE&search-text=">Next</a></li>
					</c:otherwise>
				</c:choose>
            </ul>
        </nav>
    </section>
    </main>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>

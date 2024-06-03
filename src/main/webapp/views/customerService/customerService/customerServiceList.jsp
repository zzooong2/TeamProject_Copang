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
	
	<link rel="stylesheet" href="../../../resources/css/customerService/customerService/customerServiceList.css">
	
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
       

        <input type="text" id="serach-keyword" class="search" placeholder="검색할 키워드를 입력해주세요.">
	
		<button class="write-notice" type="button" onclick="location.href='/form/customerServiceEnrollForm.do'">작 성</button>
		
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
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">2</a></li>
                <li class="page-item"><a class="page-link" href="#">3</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </nav>
    </section>
    </main>
	<%@ include file="/views/common/footer.jsp"%>
</body>
</html>

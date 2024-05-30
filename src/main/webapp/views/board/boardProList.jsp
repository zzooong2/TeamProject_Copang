<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>COPANG</title>
    <link rel="icon" href="../../resources/img/tapIcon.png">
    <link rel="stylesheet" type="text/css" href="../../resources/css/board/boardProList.css">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
	<%@ include file="/views/common/head.jsp"%>
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
    <div id="main">
        <%-- <div class="boardList_container">
            <div class="boardList_category">
                <ul class="boardList_categoryList"><strong>카테고리</strong>
                    <li>IT·프로그래밍</li>
                    <li>디자인</li>
                    <li>영상·사진·음향</li>
                    <li>교육</li>
                    <li>마케팅</li>
                </ul>
            </div>
            <div class="boxList">
                <c:choose>
                    <c:when test="${empty list}">
                        <p>등록된 글이 없습니다.</p>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="item" item="${list}">
                            <div class="item_list" onclick="location.href='/board/boardProDetail.do?boardNo=${item.boardNo}'">
                                <img src="${item.imageURL}" alt="${item.bTitle}">
                                <td>${item.bTitle}</td>
                                <td>${item.bPay}</td>
                                <td>${item.bName}</td>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>
    
        </div>
    </div> --%>

		<div class="boardProList_container">
        <div class="boardProList_sidebar">
            <ul>
                <li><a href="#">카테고리 1</a></li>
                <li><a href="#">카테고리 2</a></li>
                <li><a href="#">카테고리 3</a></li>
                <li><a href="#">카테고리 4</a></li>
            </ul>
        </div>
        <div class="boardProList_content">
            <div class="boardProList_image-grid">
                <!-- 이미지와 제목을 여기에 추가 -->
                <c:forEach var="post" items="${list}">
                    <div class="boardProList_post">
                        <img src="${post.imageUrl}" alt="${post.title}">
                        <h2>${post.title}</h2>
                    </div>
                </c:forEach>
            </div>
            
            <!-- 페이지네이션 -->
            <div class="boardProList_pagination">
                <c:if test="${pi.startPage != 1}">
                    <a href="list.do?cpage=1&category=${category}">처음</a>
                </c:if>
                <c:forEach begin="${pi.startPage}" end="${pi.endPage}" step="1" var="i">
                    <a href="list.do?cpage=${i}&category=${category}" <c:if test="${pi.currentPage eq i}">class="active"</c:if>>${i}</a>
                </c:forEach>
                <c:if test="${pi.endPage != pi.maxPage}">
                    <a href="list.do?cpage=${pi.maxPage}&category=${category}">끝</a>
                </c:if>
            </div>
        </div>
    </div>



		<%-- <nav aria-label="Page navigation example" style="background-color: white;">
        <ul class="pagination" style="justify-content: center;">
            <!-- 왼쪽 버튼 -->
            <c:choose>
                <c:when test="${pi.cpage == 1}">
                    <li class="page-item" style="margin-right: 0px"><a class="page-link" href="#"
                            aria-label="Previous"><span aria-hidden="true">&laquo;</span></a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item" style="margin-right: 0px"><a class="page-link"
                            href="/freeBoard/list.do?cpage=${pi.cpage-1}" aria-label="Previous"><span
                                aria-hidden="true">&laquo;</span></a></li>
                </c:otherwise>
            </c:choose>
    
            <!-- 페이지 버튼 -->
            <c:forEach var="page" begin="${pi.startPage}" end="${pi.endPage}">
                <li class="page-item" style="margin-right: 0px"><a class="page-link"
                        href="/freeBoard/list.do?cpage=${page}">${page}</a></li>
            </c:forEach>
    
            <!-- 오른쪽 버튼 -->
            <c:choose>
                <c:when test="${pi.cpage == pi.maxPage}">
                    <li class="page-item" style="margin-right: 0px"><a class="page-link" href="#" aria-label="Next"><span
                                aria-hidden="true">&raquo;</span></a></li>
                </c:when>
                <c:otherwise>
                    <li class="page-item" style="margin-right: 0px"><a class="page-link"
                            href="/freeBoard/list.do?cpage=${pi.cpage+1}" aria-label="Next"><span
                                aria-hidden="true">&raquo;</span></a></li>
                </c:otherwise>
            </c:choose>
        </ul>
    </nav> --%>


	<%-- <%@ include file="/views/common/footer.jsp"%> --%>
</body>
</html>
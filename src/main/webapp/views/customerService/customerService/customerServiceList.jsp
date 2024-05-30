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
	
		<button class="write-notice" onclick="location.href='/views/customerService/customerService/customerServiceEnroll.jsp'">작 성</button>
		
        <div class="board-table">
            <table>
                <thead>
                    <tr>
                        <td>고객센터</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td> <a href="/views/customerService/customerService/customerServiceDetail.jsp">CSS가 적용되지 않아요..</td>
                    </tr>
                    <tr>
                        <td> 작업이 너무 힘드네요..</td>
                    </tr>
                    <tr>
                        <td> 도와주실분!!</td>
                    </tr>
                    <tr>
                        <td> 안양에는 유실물보관소가 맛있습니다.</td>
                    </tr>
                    <tr>
                        <td> 안양 그린 컴퓨터 아트 학원</td>
                    </tr>
                    <tr>
                        <td> 결제페이지 API 연동도 해야해요</td>
                    </tr>
                    <tr>
                        <td> GitHub, Jira 공부하세요!!!!! GitHub, Jira 공부하세요!!!!! GitHub, Jira 공부하세요!!!!!</td>
                    </tr>
                    <tr>
                        <td> 페이스북 간편 회원가입/로그인 안되네요??</td>
                    </tr>
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

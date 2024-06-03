<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>CoPang</title>
    
	<%@ include file="/views/common/head.jsp"%>
	
	<link rel="stylesheet" href="../../../resources/css/customerService/notice/noticeList.css">
	
</head>
<body>
	<%@ include file="/views/common/header.jsp"%>
	
	<main class="main">
        <section class="board-section">
        <div class="page-navigation">
            Copang  >  공지사항
        </div>

        <div class="notice-title">
            Notice
        </div>
       

        <input type="text" id="serach-keyword" class="search" placeholder="검색할 키워드를 입력해주세요.">
	
		<button class="write-notice" onclick="location.href='/views/customerService/notice/noticeEnroll.jsp'">작 성</button>
		
        <div class="board-table">
            <table>
                <thead>
                    <tr>
                        <td>공지사항</td>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td> <a href="/views/customerService/notice/noticeDetail.jsp" class="get-detail">코팡 서비스 점검안내 (06/31 00:00 ~ 06:00)</a></td>
                    </tr>
                    <tr>
                        <td> 전기배선 설치, 인터넷 수리로 인한 검증절차 변경 안내</td>
                    </tr>
                    <tr>
                        <td> 코팡보증 이용약관 변경 안내</td>
                    </tr>
                    <tr>
                        <td> 페이스북 간편 회원가입/로그인 서비스 종료 안내</td>
                    </tr>
                    <tr>
                        <td> 코팡 서비스 점검안내 (06/31 00:00 ~ 06:00)</td>
                    </tr>
                    <tr>
                        <td> 전기배선 설치, 인터넷 수리로 인한 검증절차 변경 안내</td>
                    </tr>
                    <tr>
                        <td> 코팡보증 이용약관 변경 안내</td>
                    </tr>
                    <tr>
                        <td> 페이스북 간편 회원가입/로그인 서비스 종료 안내</td>
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
